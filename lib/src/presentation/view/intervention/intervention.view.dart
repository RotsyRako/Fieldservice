import 'dart:async';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button_icon_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/models/constants/interventions_status.dart';
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/presentation/controller/home/home.controller.dart';
import 'package:field_service/src/presentation/controller/intervention/intervention.controller.dart';
import 'package:field_service/src/presentation/view/intervention/details.dart';
import 'package:field_service/src/presentation/view/intervention/work_monitoring.dart';
import 'package:field_service/src/presentation/view/intervention/widget/add_time_bottom_sheet.dart';
import 'package:field_service/src/presentation/view/intervention/widget/navigation_bar.dart';
import 'package:field_service/src/presentation/view/intervention/widget/timer_widget.dart';
import 'package:field_service/src/presentation/widget/status_app_bar.dart';
import 'package:field_service/src/routing/route_names.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class InterventionView extends ConsumerStatefulWidget {
  const InterventionView({
    required this.intervention,
    super.key,
  });

  final InterventionDto intervention;

  @override
  ConsumerState<InterventionView> createState() => _InterventionViewState();
}

class _InterventionViewState extends ConsumerState<InterventionView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTab = 0;
  late InterventionDto _currentIntervention;
  bool _isUpdating = false;

  @override
  void initState() {
    super.initState();
    _currentIntervention = widget.intervention;
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedTab = _tabController.index;
      });
    });
  }

  @override
  void didUpdateWidget(InterventionView oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Mettre à jour l'intervention actuelle si le widget a changé
    if (oldWidget.intervention.id != widget.intervention.id) {
      setState(() {
        _currentIntervention = widget.intervention;
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String get priorityColor {
    switch (_currentIntervention.priority.toLowerCase()) {
      case 'haute':
        return '#C67C21';
      case 'moyenne':
        return '#9963AD';
      case 'basse':
        return '#4F5E66';
      default:
        return '#9963AD';
    }
  }

  Future<void> _updateInterventionStatus(int newStatus) async {
    if (_isUpdating) {
      return;
    }

    setState(() {
      _isUpdating = true;
    });

    final controller = ref.read(
      interventionControllerProvider(_currentIntervention.id ?? '').notifier,
    );

    try {
      final updatedIntervention = await controller.updateStatus(
        intervention: _currentIntervention,
        newStatus: newStatus,
      );

      if (mounted) {
        if (updatedIntervention != null) {
          setState(() {
            _currentIntervention = updatedIntervention;
          });

          // Rafraîchir la liste des interventions dans la vue d'accueil
          ref.invalidate(homeControllerProvider);

          // Afficher un message de succès seulement si synchronisé
          if (updatedIntervention.isSync) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Statut mis à jour avec succès'),
                duration: Duration(seconds: 2),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Les modifications ont été sauvegardées localement'),
                duration: Duration(seconds: 3),
                backgroundColor: Colors.orange,
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erreur lors de la mise à jour'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors de la mise à jour: ${e.toString()}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isUpdating = false;
        });
      }
    }
  }

  void _startTimer() {
    final interventionId = _currentIntervention.id;
    if (interventionId != null) {
      ref.read(timerStateProvider(interventionId).notifier).start();
    }
  }

  void _stopTimer() {
    final interventionId = _currentIntervention.id;
    if (interventionId != null) {
      ref.read(timerStateProvider(interventionId).notifier).stop();
    }
  }

  Future<void> _handleTimerComplete(Duration duration) async {
    _stopTimer();
    
    // Afficher le bottom sheet
    if (!mounted) return;
    
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTimeBottomSheet(
        duration: duration,
        onSave: (date, timeSpent, description) async {
          await _saveTimesheet(date, timeSpent, description);
        },
      ),
    );
  }

  Future<void> _saveTimesheet(
    String date,
    String timeSpent,
    String? description,
  ) async {
    if (_currentIntervention.id == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Impossible de sauvegarder : intervention sans ID'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      return;
    }

    final interventionId = _currentIntervention.id!;
    final controller = ref.read(
      interventionControllerProvider(interventionId).notifier,
    );

    final success = await controller.saveTimesheet(
      interventionId: interventionId,
      date: date,
      timeSpent: timeSpent,
      description: description,
    );

    if (mounted) {
      if (success) {
        // Attendre un peu pour s'assurer que l'insertion est terminée
        await Future.delayed(const Duration(milliseconds: 200));
        
        // Rafraîchir le provider pour mettre à jour la liste dans WorkMonitoring
        // Utiliser refresh au lieu de invalidate pour forcer un rafraîchissement immédiat
        try {
          final _ = await ref.refresh(timesheetsByInterventionProvider(interventionId).future);
        } catch (e) {
          // En cas d'erreur, invalider quand même pour permettre un nouveau chargement
          ref.invalidate(timesheetsByInterventionProvider(interventionId));
          print('Erreur lors du rafraîchissement: $e');
        }
        
        // Vérifier que le widget est toujours monté avant d'utiliser le contexte
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Temps enregistré avec succès'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erreur lors de l\'enregistrement'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    }
  }

  Future<void> _openMap() async {
    // Construire l'URL Google Maps avec les coordonnées de l'intervention
    final latitude = _currentIntervention.lat;
    final longitude = _currentIntervention.long;
    
    // URL pour ouvrir Google Maps avec l'itinéraire (format universel)
    final googleMapsUrl = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&destination=$latitude,$longitude',
    );
    
    try {
      // Essayer d'ouvrir directement l'URL
      // Le système choisira automatiquement l'application la plus appropriée
      // (Google Maps si installé, sinon le navigateur)
      final launched = await url_launcher.launchUrl(
        googleMapsUrl,
        mode: url_launcher.LaunchMode.externalApplication,
      );
      
      if (!launched && mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Impossible d\'ouvrir la carte'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      print('Erreur lors de l\'ouverture de la carte: $e');
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Impossible d\'ouvrir la carte : ${e.toString()}'),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = InterventionsStatus.fromValue(_currentIntervention.status);
    
    // Récupérer toutes les interventions
    final interventionsAsync = ref.watch(homeControllerProvider);
    
    // Trouver l'index de l'intervention actuelle
    final currentIndexAndList = interventionsAsync.when(
      data: (interventions) {
        if (interventions.isEmpty) {
          return (currentIndex: -1, list: <InterventionDto>[]);
        }
        // Comparer les IDs en gérant les cas null
        final currentIndex = interventions.indexWhere(
          (intervention) {
            final currentId = _currentIntervention.id;
            final interventionId = intervention.id;
            // Comparer les IDs même s'ils sont null
            if (currentId == null && interventionId == null) return true;
            if (currentId == null || interventionId == null) return false;
            return currentId == interventionId;
          },
        );
        return (currentIndex: currentIndex, list: interventions);
      },
      loading: () => (currentIndex: -1, list: <InterventionDto>[]),
      error: (_, __) => (currentIndex: -1, list: <InterventionDto>[]),
    );

    final currentIndex = currentIndexAndList.currentIndex;
    final interventions = currentIndexAndList.list;
    
    // Calculer hasPrevious et hasNext
    // Si l'intervention n'est pas trouvée (currentIndex = -1), 
    // on permet quand même la navigation vers la première/dernière intervention
    final hasPrevious = interventions.isNotEmpty && 
                        (currentIndex > 0 || (currentIndex == -1 && interventions.length > 1));
    final hasNext = interventions.isNotEmpty && 
                    ((currentIndex >= 0 && currentIndex < interventions.length - 1) ||
                     (currentIndex == -1 && interventions.length > 1));

    void navigateToIntervention(int index) {
      if (interventions.isEmpty) return;
      
      // L'index passé est déjà calculé (currentIndex - 1 ou currentIndex + 1)
      // Il faut juste s'assurer qu'il est dans les limites
      int targetIndex = index;
      if (targetIndex < 0) targetIndex = 0;
      if (targetIndex >= interventions.length) targetIndex = interventions.length - 1;
      
      if (targetIndex >= 0 && targetIndex < interventions.length) {
        final targetIntervention = interventions[targetIndex];
        context.replace(
          '/home/${RouteNames.intervention}/${targetIntervention.id}',
          extra: targetIntervention,
        );
      }
    }

    return Scaffold(
      body: Column(
        children: [
          const StatusAppBar(),

          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: theme.sizes.asInsets.xs.horizontal),
            child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => context.pop(),
                        ),
                        InterventionNavigationBar(
                          onPrevious: () => navigateToIntervention(currentIndex - 1),
                          onNext: () => navigateToIntervention(currentIndex + 1),
                          hasPrevious: hasPrevious,
                          hasNext: hasNext,
                        ),
                      ],
                    ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Carte d'intervention
                    _buildInterventionCard(theme, status),
                    const ThemeGap.l(),
                    // Tabs
                    _buildTabs(theme),
                    // Contenu des tabs
                    _buildTabContent(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInterventionCard(ThemeData theme, InterventionsStatus status) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colors.baseWhite,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Statut et distance
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: status.backgroundColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ThemeText.bodyXSmallSemiBold(
                  status.label,
                  color: status.textColor,
                ),
              ),
              ThemeText.bodySmallBold(
                '${_currentIntervention.distance} km',
                color: theme.colors.primary50,
              ),
            ],
          ),
          const ThemeGap.sm(),
          // Titre
          ThemeText.h5Bold(_currentIntervention.titre),
          const ThemeGap.sm(),
          // Dates
          Row(
            children: [
              ThemeText.bodySmallBold(
                _currentIntervention.dateStart,
                color: theme.colors.grey50,
              ),
              const ThemeGap.s(),
              Iconify(
                Ph.arrow_right,
                size: 12,
                color: theme.colors.primary50,
              ),
              const ThemeGap.s(),
              ThemeText.bodySmallBold(
                _currentIntervention.dateEnd,
                color: theme.colors.grey50,
              ),
            ],
          ),
          const ThemeGap.l(),
          // Chronomètre (si statut en cours)
          Builder(
            builder: (context) {
              final isTermine = _currentIntervention.status == 3;
              final isEnCours = _currentIntervention.status == 2;
              final isTimerActive = _currentIntervention.id != null
                  ? ref.watch(timerStateProvider(_currentIntervention.id!))
                  : false;
              
              // Masquer le chronomètre si l'intervention est terminée
              if (isTermine) {
                return const SizedBox.shrink();
              }
              
              if (isEnCours && isTimerActive) {
                return Column(
                  children: [
                    TimerWidget(
                      onStop: _stopTimer,
                      onComplete: _handleTimerComplete,
                    ),
                    const ThemeGap.s(),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
          // Boutons d'action
          Builder(
            builder: (context) {
              final isTermine = _currentIntervention.status == 3;
              final isPlanifie = _currentIntervention.status == 1;
              final isEnCours = _currentIntervention.status == 2;
              final isTimerActive = _currentIntervention.id != null
                  ? ref.watch(timerStateProvider(_currentIntervention.id!))
                  : false;
              
              // Masquer tous les boutons si l'intervention est terminée
              if (isTermine) {
                return const SizedBox.shrink();
              }
              
              if (isPlanifie) {
                return Column(
                  children: [
                    ThemeButton.primary(
                      icon: Ic.check,
                      label: 'Je suis sur place',
                      iconPosition: ThemeButtonIconPosition.left,
                      onPressed: _isUpdating
                          ? null
                          : () => _updateInterventionStatus(2),
                      loading: _isUpdating,
                      fullWidth: true,
                      radius: BorderRadius.circular(8),
                      horizontalPadding: 12,
                      verticalPadding: 8,
                    ),
                    const ThemeGap.s(),
                    ThemeButton.secondary(
                      icon: Ic.gps_fixed,
                      iconPosition: ThemeButtonIconPosition.left,
                      label: 'Trouver un itinéraire',
                      onPressed: _openMap,
                      fullWidth: true,
                      radius: BorderRadius.circular(8),
                      horizontalPadding: 12,
                      verticalPadding: 8,
                    ),
                  ],
                );
              } else if (isEnCours && !isTimerActive) {
                return Column(
                  children: [
                    ThemeButton.primary(
                      icon: Ic.play_arrow,
                      label: 'Démarrer l\'intervention',
                      iconPosition: ThemeButtonIconPosition.left,
                      onPressed: isTimerActive ? null : () {
                        _startTimer();
                      },
                      fullWidth: true,
                      radius: BorderRadius.circular(8),
                      horizontalPadding: 12,
                      verticalPadding: 8,
                    ),
                    const ThemeGap.s(),
                    ThemeButton.secondary(
                      icon: Ic.outline_draw,
                      iconPosition: ThemeButtonIconPosition.left,
                      label: 'Valider et faire signer',
                      onPressed: () {
                        context.push(
                          '/home/${RouteNames.intervention}/${_currentIntervention.id}/${RouteNames.signature}',
                          extra: _currentIntervention,
                        );
                      },
                      fullWidth: true,
                      radius: BorderRadius.circular(8),
                      horizontalPadding: 12,
                      verticalPadding: 8,
                    ),
                  ],
                );
              } else {
                return Column(
                  children: [
                    ThemeButton.secondary(
                      icon: Ic.outline_draw,
                      iconPosition: ThemeButtonIconPosition.left,
                      label: 'Valider et faire signer',
                      onPressed: () {
                        context.push(
                          '/home/${RouteNames.intervention}/${_currentIntervention.id}/${RouteNames.signature}',
                          extra: _currentIntervention,
                        );
                      },
                      fullWidth: true,
                      radius: BorderRadius.circular(8),
                      horizontalPadding: 12,
                      verticalPadding: 8,
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabs(ThemeData theme) {
    return TabBar(
      controller: _tabController,
      indicatorColor: theme.colors.primary50,
      labelColor: theme.colors.baseWhite,
      unselectedLabelColor: theme.colors.grey50.withValues(alpha: 0.64),
      dividerColor: Colors.transparent,
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: theme.colors.primary50,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      labelStyle: theme.textStyles.bodySmallSemiBold,
      labelPadding: const EdgeInsets.symmetric(horizontal: 12),
      tabs: [
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Iconify(
                Ph.clipboard_text,
                size: 12,
                color: _selectedTab == 0
                    ? theme.colors.baseWhite
                    : theme.colors.grey50.withValues(alpha: 0.64),
              ),
              const ThemeGap.xs(),
              const Text('Détail'),
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Iconify(
                Ph.chats_teardrop,
                size: 12,
                color: _selectedTab == 1
                    ? theme.colors.baseWhite
                    : theme.colors.grey50.withValues(alpha: 0.64),
              ),
              const ThemeGap.xs(),
              const Text('Suivi du travail'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabContent() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(8),
        bottomLeft: Radius.circular(8),
        bottomRight: Radius.circular(8),
      ),
      child: SizedBox(
        height: 600, // Hauteur fixe pour le contenu du tab
        child: TabBarView(
          controller: _tabController,
          children: [
            InterventionDetails(intervention: _currentIntervention),
            WorkMonitoring(intervention: _currentIntervention),
          ],
        ),
      ),
    );
  }
}

