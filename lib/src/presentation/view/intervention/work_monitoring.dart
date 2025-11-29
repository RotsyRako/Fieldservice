import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_pop_up/theme_pop_up.dart';
import 'package:field_service/src/common/theme/widgets/theme_loader/theme_loader.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/models/dto/timesheet/timesheet_dto.dart';
import 'package:field_service/src/presentation/controller/intervention/intervention.controller.dart';
import 'package:field_service/src/presentation/view/intervention/widget/add_time_bottom_sheet.dart';
import 'package:field_service/src/presentation/view/intervention/widget/comments_section_widget.dart';
import 'package:field_service/src/presentation/view/intervention/widget/add_comment_bottom_sheet.dart';
import 'package:field_service/src/presentation/view/intervention/widget/documents_section_widget.dart';
import 'package:field_service/src/presentation/view/intervention/widget/edit_materials_bottom_sheet.dart';
import 'package:field_service/src/presentation/view/intervention/widget/materials_section_widget.dart';
import 'package:field_service/src/presentation/view/intervention/widget/photos_section_widget.dart';
import 'package:field_service/src/presentation/view/intervention/widget/add_photo_bottom_sheet.dart';
import 'package:field_service/src/presentation/view/intervention/widget/time_section_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:field_service/src/models/dto/material/material_dto.dart';
import 'package:field_service/src/models/dto/image/image_dto.dart';
import 'package:field_service/src/models/dto/document/document_dto.dart';
import 'package:field_service/src/models/dto/comment/comment_dto.dart';
import 'package:field_service/src/services/applying/local/material/material_local.service.dart';
import 'package:field_service/src/services/applying/local/timesheet/timesheet_local.service.dart';
import 'package:field_service/src/services/applying/local/image/image_local.service.dart';
import 'package:field_service/src/services/applying/local/document/document_local.service.dart';
import 'package:field_service/src/services/applying/local/comment/comment_local.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'work_monitoring.g.dart';

/// Provider pour récupérer les feuilles de temps d'une intervention
@riverpod
Future<List<TimesheetDto>> timesheetsByIntervention(
  Ref ref,
  String interventionId,
) async {
  try {
    final service = ref.watch(timesheetLocalServiceProvider);
    return await service.findByInterventionId(interventionId);
  } catch (e) {
    // En cas d'erreur, retourner une liste vide plutôt que de planter
    print('Erreur lors de la récupération des timesheets: $e');
    return [];
  }
}

/// Provider pour récupérer les matériaux d'une intervention
@riverpod
Future<List<MaterialDto>> materialsByIntervention(
  Ref ref,
  String interventionId,
) async {
  try {
    final service = ref.watch(materialLocalServiceProvider);
    return await service.findByInterventionId(interventionId);
  } catch (e) {
    // En cas d'erreur, retourner une liste vide plutôt que de planter
    print('Erreur lors de la récupération des matériaux: $e');
    return [];
  }
}

/// Provider pour récupérer les images d'une intervention
@riverpod
Future<List<ImageDto>> imagesByIntervention(
  Ref ref,
  String interventionId,
) async {
  try {
    final service = ref.watch(imageLocalServiceProvider);
    return await service.findByInterventionId(interventionId);
  } catch (e) {
    // En cas d'erreur, retourner une liste vide plutôt que de planter
    print('Erreur lors de la récupération des images: $e');
    return [];
  }
}

/// Provider pour récupérer les documents d'une intervention
@riverpod
Future<List<DocumentDto>> documentsByIntervention(
  Ref ref,
  String interventionId,
) async {
  try {
    final service = ref.watch(documentLocalServiceProvider);
    return await service.findByInterventionId(interventionId);
  } catch (e) {
    // En cas d'erreur, retourner une liste vide plutôt que de planter
    print('Erreur lors de la récupération des documents: $e');
    return [];
  }
}

/// Provider pour récupérer les commentaires d'une intervention
@riverpod
Future<List<CommentDto>> commentsByIntervention(
  Ref ref,
  String interventionId,
) async {
  try {
    final service = ref.watch(commentLocalServiceProvider);
    return await service.findByInterventionId(interventionId);
  } catch (e) {
    // En cas d'erreur, retourner une liste vide plutôt que de planter
    print('Erreur lors de la récupération des commentaires: $e');
    return [];
  }
}

/// Provider pour gérer l'état du timer par intervention
@riverpod
class TimerState extends _$TimerState {
  @override
  bool build(String interventionId) => false;

  void start() {
    state = true;
  }
  
  void stop() {
    state = false;
  }
}

class WorkMonitoring extends ConsumerStatefulWidget {
  const WorkMonitoring({
    required this.intervention,
    super.key,
  });

  final InterventionDto intervention;

  @override
  ConsumerState<WorkMonitoring> createState() => _WorkMonitoringState();
}

class _WorkMonitoringState extends ConsumerState<WorkMonitoring> {
  bool _timeExpanded = true;
  bool _materialExpanded = true;
  bool _photosExpanded = true;
  bool _documentsExpanded = true;
  bool _commentsExpanded = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final interventionId = widget.intervention.id;
    
    // Masquer les boutons si l'intervention est planifiée (status 1) ou terminée (status 3)
    final isReadOnly = widget.intervention.status == 1 || widget.intervention.status == 3;
    
    // Récupérer l'état du timer depuis le provider
    final isTimerActive = interventionId != null
        ? ref.watch(timerStateProvider(interventionId))
        : false;
    
    // Récupérer les images depuis le provider
    final imagesAsync = interventionId != null
        ? ref.watch(imagesByInterventionProvider(interventionId))
        : null;
    
    // Récupérer les documents depuis le provider
    final documentsAsync = interventionId != null
        ? ref.watch(documentsByInterventionProvider(interventionId))
        : null;
    
    // Récupérer les commentaires depuis le provider
    final commentsAsync = interventionId != null
        ? ref.watch(commentsByInterventionProvider(interventionId))
        : null;
    
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colors.baseWhite,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Temps d'intervention
            if (interventionId != null)
              TimeSectionWidget(
                interventionId: interventionId,
                isExpanded: _timeExpanded,
                isTimerActive: isTimerActive,
                isReadOnly: isReadOnly,
                onToggleExpanded: () {
                  setState(() {
                    _timeExpanded = !_timeExpanded;
                  });
                },
                onStartTimer: _startTimer,
                onStopTimer: _stopTimer,
                onTimerComplete: _handleTimerComplete,
                onAddTime: () => _showAddTimeBottomSheet(theme, allowManualEdit: true),
                onDeleteTime: (timesheet) => _handleDeleteTimesheet(theme, timesheet),
                onEditTime: (timesheet) => _handleEditTimesheet(theme, timesheet),
              ),
            const ThemeGap.l(),
            
            // Matériels utilisés
            if (interventionId != null)
              MaterialsSectionWidget(
                interventionId: interventionId,
                isExpanded: _materialExpanded,
                isReadOnly: isReadOnly,
                onToggleExpanded: () {
                  setState(() {
                    _materialExpanded = !_materialExpanded;
                  });
                },
                onEditMaterials: () => _showEditMaterialsBottomSheet(theme),
              ),
            const ThemeGap.l(),
            
            // Photos
            PhotosSectionWidget(
              isExpanded: _photosExpanded,
              isReadOnly: isReadOnly,
              onToggleExpanded: () {
                setState(() {
                  _photosExpanded = !_photosExpanded;
                });
              },
              images: imagesAsync?.value ?? [],
              onAddPhoto: () => _showAddPhotoBottomSheet(theme),
              onDeletePhoto: (image) => _handleDeleteImage(theme, image),
            ),
            const ThemeGap.l(),
            
            // Documents
            DocumentsSectionWidget(
              isExpanded: _documentsExpanded,
              isReadOnly: isReadOnly,
              onToggleExpanded: () {
                setState(() {
                  _documentsExpanded = !_documentsExpanded;
                });
              },
              documents: documentsAsync?.value ?? [],
              onAddDocument: () => _handleAddDocument(theme),
              onDeleteDocument: (document) => _handleDeleteDocument(theme, document),
            ),
            const ThemeGap.l(),
            
            // Commentaires
            CommentsSectionWidget(
              isExpanded: _commentsExpanded,
              isReadOnly: isReadOnly,
              onToggleExpanded: () {
                setState(() {
                  _commentsExpanded = !_commentsExpanded;
                });
              },
              comments: commentsAsync?.value ?? [],
              onAddComment: () => _showAddCommentBottomSheet(theme),
              onDeleteComment: (comment) => _handleDeleteComment(theme, comment),
            ),
          ],
        ),
      ),
    );
  }

  
  void _startTimer() {
    final interventionId = widget.intervention.id;
    if (interventionId != null) {
      ref.read(timerStateProvider(interventionId).notifier).start();
    }
  }

  void _stopTimer() {
    final interventionId = widget.intervention.id;
    if (interventionId != null) {
      ref.read(timerStateProvider(interventionId).notifier).stop();
    }
  }

  Future<void> _handleTimerComplete(Duration duration) async {
    _stopTimer();
    
    if (!mounted) return;
    
    // Afficher le bottom sheet avec les données pré-remplies
    await _showAddTimeBottomSheet(
      Theme.of(context),
      duration: duration,
      allowManualEdit: false,
    );
  }

  Future<void> _showAddTimeBottomSheet(
    ThemeData theme, {
    Duration? duration,
    required bool allowManualEdit,
  }) async {
    if (!mounted) return;
    
    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de sauvegarder : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTimeBottomSheet(
        duration: duration ?? Duration.zero,
        allowManualEdit: allowManualEdit,
        onSave: (date, timeSpent, description) async {
          await _saveTimesheet(interventionId, date, timeSpent, description);
        },
      ),
    );
  }

  Future<void> _saveTimesheet(
    String interventionId,
    String date,
    String timeSpent,
    String? description,
  ) async {
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
        
        // Rafraîchir le provider pour mettre à jour la liste
        // Utiliser refresh au lieu de invalidate pour forcer un rafraîchissement immédiat
        try {
          final _ = await ref.refresh(timesheetsByInterventionProvider(interventionId).future);
        } catch (e) {
          // En cas d'erreur, invalider quand même pour permettre un nouveau chargement
          ref.invalidate(timesheetsByInterventionProvider(interventionId));
          print('Erreur lors du rafraîchissement: $e');
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Temps enregistré avec succès'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur lors de l\'enregistrement'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _handleDeleteTimesheet(ThemeData theme, TimesheetDto timesheet) async {
    if (timesheet.localId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de supprimer : timesheet sans ID local'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Afficher le popup de confirmation
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ThemePopUp.error(
        title: 'Supprimer le temps',
        message: 'Êtes-vous sûr de vouloir supprimer ce temps passé ? Cette action est irréversible.',
        bottomBuilder: (color, dismiss) {
          return Row(
            children: [
              Expanded(
                child: ThemeButton.secondary(
                  label: 'Annuler',
                  onPressed: dismiss,
                  fullWidth: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ThemeButton.primary(
                  label: 'Supprimer',
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  fullWidth: true,
                  forceSingleLine: true,
                ),
              ),
            ],
          );
        },
      ),
    );

    if (confirmed != true || !mounted) return;

    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de supprimer : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final controller = ref.read(
      interventionControllerProvider(interventionId).notifier,
    );

    final success = await controller.deleteTimesheet(timesheet.localId!);

    if (mounted) {
      if (success) {
        // Attendre un peu pour s'assurer que la suppression est terminée
        await Future.delayed(const Duration(milliseconds: 200));
        
        // Rafraîchir le provider pour mettre à jour la liste
        try {
          final _ = await ref.refresh(timesheetsByInterventionProvider(interventionId).future);
        } catch (e) {
          ref.invalidate(timesheetsByInterventionProvider(interventionId));
          print('Erreur lors du rafraîchissement: $e');
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Temps supprimé avec succès'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur lors de la suppression'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _handleEditTimesheet(ThemeData theme, TimesheetDto timesheet) async {
    if (timesheet.localId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de modifier : timesheet sans ID local'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de modifier : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Ouvrir le bottom sheet en mode édition
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddTimeBottomSheet(
        duration: Duration.zero, // Non utilisé en mode édition
        allowManualEdit: true, // Permettre la modification manuelle
        timesheetToEdit: timesheet,
        onSave: (date, timeSpent, description) async {
          await _updateTimesheet(
            interventionId,
            timesheet.localId!,
            date,
            timeSpent,
            description,
          );
        },
      ),
    );
  }

  Future<void> _updateTimesheet(
    String interventionId,
    int localId,
    String date,
    String timeSpent,
    String? description,
  ) async {
    final controller = ref.read(
      interventionControllerProvider(interventionId).notifier,
    );

    final success = await controller.updateTimesheet(
      localId: localId,
      date: date,
      timeSpent: timeSpent,
      description: description,
    );

    if (mounted) {
      if (success) {
        // Attendre un peu pour s'assurer que la mise à jour est terminée
        await Future.delayed(const Duration(milliseconds: 200));
        
        // Rafraîchir le provider pour mettre à jour la liste
        try {
          final _ = await ref.refresh(timesheetsByInterventionProvider(interventionId).future);
        } catch (e) {
          ref.invalidate(timesheetsByInterventionProvider(interventionId));
          print('Erreur lors du rafraîchissement: $e');
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Temps modifié avec succès'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur lors de la modification'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _showEditMaterialsBottomSheet(ThemeData theme) async {
    if (!mounted) return;
    
    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de modifier : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => EditMaterialsBottomSheet(
        interventionId: interventionId,
        onSave: () async {
          // Attendre un peu pour s'assurer que la sauvegarde est terminée
          await Future.delayed(const Duration(milliseconds: 200));
          
          // Rafraîchir le provider pour mettre à jour la liste
          if (mounted) {
            try {
              final _ = await ref.refresh(materialsByInterventionProvider(interventionId).future);
            } catch (e) {
              ref.invalidate(materialsByInterventionProvider(interventionId));
              print('Erreur lors du rafraîchissement: $e');
            }
          }
        },
      ),
    );
  }

  Future<void> _showAddPhotoBottomSheet(ThemeData theme) async {
    if (!mounted) return;
    
    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible d\'ajouter une photo : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddPhotoBottomSheet(
        onSelectSource: (source) async {
          await _handleAddPhoto(interventionId, source);
        },
      ),
    );
  }

  Future<void> _handleAddPhoto(String interventionId, ImageSource source) async {
    if (!mounted) return;

    try {
      // Capturer le service AVANT les opérations asynchrones
      // pour pouvoir l'utiliser même si le widget est disposé après
      final imageService = ref.read(imageLocalServiceProvider);

      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        imageQuality: 85,
      );

      if (image == null) {
        return;
      }

      if (!mounted) return;

      // Afficher le loader pendant la sauvegarde
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => PopScope(
          canPop: false, // Empêcher la fermeture pendant le chargement
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colors.baseWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ThemeLoader.animated(
                    radius: 40,
                    color: Theme.of(context).colors.primary100,
                  ),
                  const SizedBox(height: 16),
                  ThemeText.bodyMediumSemiBold(
                    'Enregistrement de la photo...',
                    color: Theme.of(context).colors.baseBlack,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Capturer le contrôleur maintenant que l'image est sélectionnée
      final controller = ref.read(
        interventionControllerProvider(interventionId).notifier,
      );

      final success = await controller.saveImage(
        interventionId: interventionId,
        imagePath: image.path,
        source: source,
        imageService: imageService, // Passer le service capturé
      );

      // Fermer le loader
      if (mounted) {
        Navigator.of(context).pop();
      }

      if (mounted) {
        if (success) {
          // Attendre un peu pour s'assurer que l'insertion est terminée
          await Future.delayed(const Duration(milliseconds: 200));
          
          // Rafraîchir le provider pour mettre à jour la liste
          try {
            final _ = await ref.refresh(imagesByInterventionProvider(interventionId).future);
          } catch (e) {
            ref.invalidate(imagesByInterventionProvider(interventionId));
            print('Erreur lors du rafraîchissement: $e');
          }
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Photo enregistrée avec succès'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erreur lors de l\'enregistrement de la photo'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _handleDeleteImage(ThemeData theme, ImageDto image) async {
    if (image.localId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de supprimer : image sans ID local'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Afficher le popup de confirmation
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ThemePopUp.error(
        title: 'Supprimer la photo',
        message: 'Êtes-vous sûr de vouloir supprimer cette photo ? Cette action est irréversible.',
        bottomBuilder: (color, dismiss) {
          return Row(
            children: [
              Expanded(
                child: ThemeButton.secondary(
                  label: 'Annuler',
                  onPressed: dismiss,
                  fullWidth: true,
                  forceSingleLine: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ThemeButton.primary(
                  label: 'Supprimer',
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  fullWidth: true,
                  forceSingleLine: true,
                ),
              ),
            ],
          );
        },
      ),
    );

    if (confirmed != true || !mounted) return;

    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de supprimer : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final controller = ref.read(
      interventionControllerProvider(interventionId).notifier,
    );

    final success = await controller.deleteImage(image.localId!);

    if (mounted) {
      if (success) {
        // Attendre un peu pour s'assurer que la suppression est terminée
        await Future.delayed(const Duration(milliseconds: 200));
        
        // Rafraîchir le provider pour mettre à jour la liste
        try {
          final _ = await ref.refresh(imagesByInterventionProvider(interventionId).future);
        } catch (e) {
          ref.invalidate(imagesByInterventionProvider(interventionId));
          print('Erreur lors du rafraîchissement: $e');
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Photo supprimée avec succès'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur lors de la suppression'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _handleAddDocument(ThemeData theme) async {
    if (!mounted) return;
    
    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible d\'ajouter un document : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    try {
      // Capturer le service AVANT les opérations asynchrones
      final documentService = ref.read(documentLocalServiceProvider);

      // Sélectionner un fichier PDF
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result == null || result.files.single.path == null) {
        return;
      }

      final filePath = result.files.single.path!;

      if (!mounted) return;

      // Afficher le loader pendant la sauvegarde
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => PopScope(
          canPop: false, // Empêcher la fermeture pendant le chargement
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colors.baseWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ThemeLoader.animated(
                    radius: 40,
                    color: Theme.of(context).colors.primary100,
                  ),
                  const SizedBox(height: 16),
                  ThemeText.bodyMediumSemiBold(
                    'Enregistrement du document...',
                    color: Theme.of(context).colors.baseBlack,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Capturer le contrôleur maintenant que le fichier est sélectionné
      final controller = ref.read(
        interventionControllerProvider(interventionId).notifier,
      );

      final success = await controller.saveDocument(
        interventionId: interventionId,
        filePath: filePath,
        documentService: documentService, // Passer le service capturé
      );

      // Fermer le loader
      if (mounted) {
        Navigator.of(context).pop();
      }

      if (mounted) {
        if (success) {
          // Attendre un peu pour s'assurer que l'insertion est terminée
          await Future.delayed(const Duration(milliseconds: 200));
          
          // Rafraîchir le provider pour mettre à jour la liste
          try {
            final _ = await ref.refresh(documentsByInterventionProvider(interventionId).future);
          } catch (e) {
            ref.invalidate(documentsByInterventionProvider(interventionId));
            print('Erreur lors du rafraîchissement: $e');
          }
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Document enregistré avec succès'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erreur lors de l\'enregistrement du document'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        // Fermer le loader si toujours ouvert
        try {
          Navigator.of(context).pop();
        } catch (_) {}
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _handleDeleteDocument(ThemeData theme, DocumentDto document) async {
    if (document.localId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de supprimer : document sans ID local'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Afficher le popup de confirmation
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ThemePopUp.error(
        title: 'Supprimer le document',
        message: 'Êtes-vous sûr de vouloir supprimer ce document ? Cette action est irréversible.',
        bottomBuilder: (color, dismiss) {
          return Row(
            children: [
              Expanded(
                child: ThemeButton.secondary(
                  label: 'Annuler',
                  onPressed: dismiss,
                  fullWidth: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ThemeButton.primary(
                  label: 'Supprimer',
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  fullWidth: true,
                  forceSingleLine: true,
                ),
              ),
            ],
          );
        },
      ),
    );

    if (confirmed != true || !mounted) return;

    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de supprimer : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final controller = ref.read(
      interventionControllerProvider(interventionId).notifier,
    );

    final success = await controller.deleteDocument(document.localId!);

    if (mounted) {
      if (success) {
        // Attendre un peu pour s'assurer que la suppression est terminée
        await Future.delayed(const Duration(milliseconds: 200));
        
        // Rafraîchir le provider pour mettre à jour la liste
        try {
          final _ = await ref.refresh(documentsByInterventionProvider(interventionId).future);
        } catch (e) {
          ref.invalidate(documentsByInterventionProvider(interventionId));
          print('Erreur lors du rafraîchissement: $e');
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Document supprimé avec succès'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur lors de la suppression'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _showAddCommentBottomSheet(ThemeData theme) async {
    if (!mounted) return;
    
    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible d\'ajouter un commentaire : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AddCommentBottomSheet(
        onSave: (message, imagePath) async {
          await _handleAddComment(interventionId, message, imagePath);
        },
      ),
    );
  }

  Future<void> _handleAddComment(
    String interventionId,
    String message,
    String? imagePath,
  ) async {
    if (!mounted) return;

    try {
      // Capturer le service AVANT les opérations asynchrones
      final commentService = ref.read(commentLocalServiceProvider);

      // Afficher le loader pendant la sauvegarde
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => PopScope(
          canPop: false, // Empêcher la fermeture pendant le chargement
          child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colors.baseWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ThemeLoader.animated(
                    radius: 40,
                    color: Theme.of(context).colors.primary100,
                  ),
                  const SizedBox(height: 16),
                  ThemeText.bodyMediumSemiBold(
                    'Enregistrement du commentaire...',
                    color: Theme.of(context).colors.baseBlack,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      // Capturer le contrôleur maintenant
      final controller = ref.read(
        interventionControllerProvider(interventionId).notifier,
      );

      final success = await controller.saveComment(
        interventionId: interventionId,
        message: message,
        imagePath: imagePath,
        commentService: commentService, // Passer le service capturé
      );

      // Fermer le loader
      if (mounted) {
        Navigator.of(context).pop();
      }

      if (mounted) {
        if (success) {
          // Attendre un peu pour s'assurer que l'insertion est terminée
          await Future.delayed(const Duration(milliseconds: 200));
          
          // Rafraîchir le provider pour mettre à jour la liste
          try {
            final _ = await ref.refresh(commentsByInterventionProvider(interventionId).future);
          } catch (e) {
            ref.invalidate(commentsByInterventionProvider(interventionId));
            print('Erreur lors du rafraîchissement: $e');
          }
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Commentaire enregistré avec succès'),
              duration: Duration(seconds: 2),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erreur lors de l\'enregistrement du commentaire'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        // Fermer le loader si toujours ouvert
        try {
          Navigator.of(context).pop();
        } catch (_) {}
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _handleDeleteComment(ThemeData theme, CommentDto comment) async {
    if (comment.localId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de supprimer : commentaire sans ID local'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Afficher le popup de confirmation
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => ThemePopUp.error(
        title: 'Supprimer le commentaire',
        message: 'Êtes-vous sûr de vouloir supprimer ce commentaire ? Cette action est irréversible.',
        bottomBuilder: (color, dismiss) {
          return Row(
            children: [
              Expanded(
                child: ThemeButton.secondary(
                  label: 'Annuler',
                  onPressed: dismiss,
                  fullWidth: true,
                  forceSingleLine: true,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ThemeButton.primary(
                  label: 'Supprimer',
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  fullWidth: true,
                  forceSingleLine: true,
                ),
              ),
            ],
          );
        },
      ),
    );

    if (confirmed != true || !mounted) return;

    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de supprimer : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final controller = ref.read(
      interventionControllerProvider(interventionId).notifier,
    );

    final success = await controller.deleteComment(comment.localId!);

    if (mounted) {
      if (success) {
        // Attendre un peu pour s'assurer que la suppression est terminée
        await Future.delayed(const Duration(milliseconds: 200));
        
        // Rafraîchir le provider pour mettre à jour la liste
        try {
          final _ = await ref.refresh(commentsByInterventionProvider(interventionId).future);
        } catch (e) {
          ref.invalidate(commentsByInterventionProvider(interventionId));
          print('Erreur lors du rafraîchissement: $e');
        }
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Commentaire supprimé avec succès'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Erreur lors de la suppression'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

}

