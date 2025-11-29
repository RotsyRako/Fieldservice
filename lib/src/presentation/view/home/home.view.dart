import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:field_service/src/localization/app_localizations_bootstrap.dart';
import 'package:field_service/src/localization/arb/app_localizations.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/common/theme/widgets/theme_reactive_text_field.dart';
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/presentation/controller/home/home.controller.dart';
import 'package:field_service/src/presentation/view/home/widget/intervention_card.dart';
import 'package:field_service/src/presentation/widget/status_app_bar.dart';
import 'package:field_service/src/routing/route_names.dart';
import 'package:field_service/src/services/applying/local/comment/comment_local.service.dart';
import 'package:field_service/src/services/applying/local/document/document_local.service.dart';
import 'package:field_service/src/services/applying/local/image/image_local.service.dart';
import 'package:field_service/src/services/applying/local/intervention/intervention_local.service.dart';
import 'package:field_service/src/services/applying/local/material/material_local.service.dart';
import 'package:field_service/src/services/applying/local/signature/signature_local.service.dart';
import 'package:field_service/src/services/applying/local/timesheet/timesheet_local.service.dart';
import 'package:field_service/src/services/applying/remote/comment/comment_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/document/document_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/image/image_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/intervention/intervention_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/material/material_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/signature/signature_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/timesheet/timesheet_remote.sa.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  // Créer le formulaire de recherche une seule fois
  late final FormGroup form = FormGroup({
    'search': FormControl<String>(),
  });

  bool _expandedOngoing = true;
  bool _expandedPlanned = true;
  bool _expandedCompleted = true;

  @override
  void initState() {
    super.initState();
  }

  /// Rafraîchit toutes les données depuis le serveur
  Future<void> _refreshData(WidgetRef ref) async {
    // Récupérer les services nécessaires
    final interventionLocalService = ref.read(interventionLocalServiceProvider);
    final interventionRemoteService = ref.read(interventionRemoteServiceProvider);
    final commentRemoteService = ref.read(commentRemoteServiceProvider);
    final commentLocalService = ref.read(commentLocalServiceProvider);
    final documentRemoteService = ref.read(documentRemoteServiceProvider);
    final documentLocalService = ref.read(documentLocalServiceProvider);
    final imageRemoteService = ref.read(imageRemoteServiceProvider);
    final imageLocalService = ref.read(imageLocalServiceProvider);
    final materialRemoteService = ref.read(materialRemoteServiceProvider);
    final materialLocalService = ref.read(materialLocalServiceProvider);
    final signatureRemoteService = ref.read(signatureRemoteServiceProvider);
    final signatureLocalService = ref.read(signatureLocalServiceProvider);
    final timesheetRemoteService = ref.read(timesheetRemoteServiceProvider);
    final timesheetLocalService = ref.read(timesheetLocalServiceProvider);

    // Extraire le userId depuis une intervention existante dans la base locale
    final interventions = await interventionLocalService.findAll();
    if (interventions.isEmpty) {
      // Pas d'interventions, on ne peut pas synchroniser sans userId
      return;
    }

    final userId = interventions.first.userId;

    // Synchroniser les interventions
    await _syncInterventions(
      remoteService: interventionRemoteService,
      localService: interventionLocalService,
      userId: userId,
    );

    // Synchroniser toutes les données liées pour chaque intervention
    final allInterventions = await interventionLocalService.findAll();
    for (final intervention in allInterventions) {
      if (intervention.id == null) continue;

      await _syncComments(
        remoteService: commentRemoteService,
        localService: commentLocalService,
        idIntervention: intervention.id!,
      );

      await _syncDocuments(
        remoteService: documentRemoteService,
        localService: documentLocalService,
        idIntervention: intervention.id!,
      );

      await _syncImages(
        remoteService: imageRemoteService,
        localService: imageLocalService,
        idIntervention: intervention.id!,
      );

      await _syncMaterials(
        remoteService: materialRemoteService,
        localService: materialLocalService,
        idIntervention: intervention.id!,
      );

      await _syncSignatures(
        remoteService: signatureRemoteService,
        localService: signatureLocalService,
        idIntervention: intervention.id!,
      );

      await _syncTimesheets(
        remoteService: timesheetRemoteService,
        localService: timesheetLocalService,
        idIntervention: intervention.id!,
      );
    }

    // Invalider le provider pour rafraîchir la liste
    ref.invalidate(homeControllerProvider);
  }

  Future<void> _syncInterventions({
    required InterventionRemoteService remoteService,
    required InterventionLocalService localService,
    required String userId,
  }) async {
    String? syncError;
    final interventions = await remoteService.fetchInterventions(
      userId: userId,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Intervention sync error: $syncError');
      return;
    }

    for (final remoteIntervention in interventions) {
      final sanitized = remoteIntervention.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (!_areInterventionsEqual(existing, candidate)) {
        await localService.updateOnly(candidate);
      }
    }
  }

  bool _areInterventionsEqual(
    InterventionDto a,
    InterventionDto b,
  ) {
    return a == b;
  }

  Future<void> _syncComments({
    required CommentRemoteService remoteService,
    required CommentLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final comments = await remoteService.fetchCommentsByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Comment sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteComment in comments) {
      final sanitized = remoteComment.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  Future<void> _syncDocuments({
    required DocumentRemoteService remoteService,
    required DocumentLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final documents = await remoteService.fetchDocumentsByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Document sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteDocument in documents) {
      final sanitized = remoteDocument.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  Future<void> _syncImages({
    required ImageRemoteService remoteService,
    required ImageLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final images = await remoteService.fetchImagesByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Image sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteImage in images) {
      final sanitized = remoteImage.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  Future<void> _syncMaterials({
    required MaterialRemoteService remoteService,
    required MaterialLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final materials = await remoteService.fetchMaterialsByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Material sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteMaterial in materials) {
      final sanitized = remoteMaterial.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  Future<void> _syncSignatures({
    required SignatureRemoteService remoteService,
    required SignatureLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final signatures = await remoteService.fetchSignaturesByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Signature sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteSignature in signatures) {
      final sanitized = remoteSignature.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  Future<void> _syncTimesheets({
    required TimesheetRemoteService remoteService,
    required TimesheetLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final timesheets = await remoteService.fetchTimesheetsByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Timesheet sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteTimesheet in timesheets) {
      final sanitized = remoteTimesheet.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final interventionsAsync = ref.watch(homeControllerProvider);

    return ReactiveFormBuilder(
      form: () => form,
      builder: (context, formGroup, child) {
        return Scaffold(
          body: Column(
            children: [
              // AppBar personnalisée
              const StatusAppBar(),
              // Contenu principal
              Expanded(
                  child: RefreshIndicator(
                    onRefresh: () => _refreshData(ref),
                  child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Titre
                          ThemeText.h5Bold(
                            l10n.myInterventions,
                          ),
                          const ThemeGap.sm(),
                          
                          // Barre de recherche et filtre
                          _buildSearchAndFilter(context, ref, form, theme, l10n),
                          const ThemeGap.l(),
                          
                          // Liste des interventions avec ReactiveFormConsumer
                          ReactiveFormConsumer(
                            builder: (context, formGroup, child) {
                              return interventionsAsync.when(
                                data: (interventions) {
                                  final searchQuery = form.control('search').value as String? ?? '';
                                  
                                  // Filtrer les interventions par titre
                                  final filteredInterventions = interventions.where((i) {
                                    if (searchQuery.isEmpty) return true;
                                    return i.titre.toLowerCase().contains(searchQuery.toLowerCase());
                                  }).toList();
                                  // Groupes par statut
                                  final enCours = filteredInterventions.where((i) => i.status == 2).toList();
                                  final planifiees = filteredInterventions.where((i) => i.status == 1).toList();
                                  final terminees = filteredInterventions.where((i) => i.status == 3).toList();

                                  final nothingToShow = enCours.isEmpty && planifiees.isEmpty && terminees.isEmpty;
                                  if (nothingToShow) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 24),
                                      child: Center(
                                        child: ThemeText.bodySmallRegular(
                                          l10n.noData,
                                          color: theme.colors.primary50,
                                        ),
                                      ),
                                    );
                                  }

                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // Section En cours (toujours affichée)
                                      _buildSectionHeader(
                                        context,
                                        l10n.ongoing,
                                        enCours.length,
                                        theme,
                                        isExpanded: _expandedOngoing,
                                        onTap: () {
                                          setState(() {
                                            _expandedOngoing = !_expandedOngoing;
                                          });
                                        },
                                      ),
                                      if (_expandedOngoing) ...[
                                        const ThemeGap.sm(),
                                        if (enCours.isEmpty)
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 12),
                                            child: ThemeText.bodyXSmallRegular(
                                              l10n.noData,
                                              color: theme.colors.primary50,
                                            ),
                                          )
                                        else
                                          ...enCours.map((intervention) => Padding(
                                            padding: const EdgeInsets.only(bottom: 12),
                                            child: InterventionCard(
                                              intervention: intervention,
                                              onTap: () {
                                                context.push(
                                                  '/home/${RouteNames.intervention}/${intervention.id}',
                                                  extra: intervention,
                                                );
                                              },
                                            ),
                                          )),
                                      ],
                                      const ThemeGap.l(),

                                      // Section Planifiées (toujours affichée)
                                      _buildSectionHeader(
                                        context,
                                        l10n.planned,
                                        planifiees.length,
                                        theme,
                                        isExpanded: _expandedPlanned,
                                        onTap: () {
                                          setState(() {
                                            _expandedPlanned = !_expandedPlanned;
                                          });
                                        },
                                      ),
                                      if (_expandedPlanned) ...[
                                        const ThemeGap.sm(),
                                        if (planifiees.isEmpty)
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 12),
                                            child: ThemeText.bodyXSmallRegular(
                                              l10n.noData,
                                              color: theme.colors.primary50,
                                            ),
                                          )
                                        else
                                          ...planifiees.map((intervention) => Padding(
                                            padding: const EdgeInsets.only(bottom: 12),
                                            child: InterventionCard(
                                              intervention: intervention,
                                              onTap: () {
                                                context.push(
                                                  '/home/${RouteNames.intervention}/${intervention.id}',
                                                  extra: intervention,
                                                );
                                              },
                                            ),
                                          )),
                                      ],
                                      const ThemeGap.l(),

                                      // Section Terminées (toujours affichée)
                                      _buildSectionHeader(
                                        context,
                                        l10n.completed,
                                        terminees.length,
                                        theme,
                                        isExpanded: _expandedCompleted,
                                        onTap: () {
                                          setState(() {
                                            _expandedCompleted = !_expandedCompleted;
                                          });
                                        },
                                      ),
                                      if (_expandedCompleted) ...[
                                        const ThemeGap.sm(),
                                        if (terminees.isEmpty)
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 12),
                                            child: ThemeText.bodyXSmallRegular(
                                              l10n.noData,
                                              color: theme.colors.primary50,
                                            ),
                                          )
                                        else
                                          ...terminees.map((intervention) => Padding(
                                            padding: const EdgeInsets.only(bottom: 12),
                                            child: InterventionCard(
                                              intervention: intervention,
                                              onTap: () {
                                                context.push(
                                                  '/home/${RouteNames.intervention}/${intervention.id}',
                                                  extra: intervention,
                                                );
                                              },
                                            ),
                                          )),
                                      ],
                                    ],
                                  );
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: (error, stack) => Center(
                              child: Text('Erreur: $error'),
                            ),
                          );
                            },
                          ),
                        ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchAndFilter(
    BuildContext context,
    WidgetRef ref,
    FormGroup form,
    ThemeData theme,
    AppLocalizations l10n,
  ) {
    return Row(
      children: [
        Expanded(
          child: ThemeReactiveTextField<String>(
            formControl: form.control('search') as FormControl<String>,
            hint: l10n.searchIntervention,
            leadingIcon: Ic.search,
            leadingIconPadding: const EdgeInsets.symmetric(horizontal: 12),
            leadingIconSize: 14,
            withBorder: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
        ),
        const ThemeGap.sm(),
        // Bouton filtre
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: theme.colors.baseWhite,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: theme.colors.grey50.withValues(alpha: 0.08),
            ),
          ),
          child: Icon(
            Icons.tune,
            color: theme.colors.primary50,
            size: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHeader(
    BuildContext context,
    String title,
    int count,
    ThemeData theme,
    {required bool isExpanded, required VoidCallback onTap}
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ThemeText.bodySmallBold(
                  title,
                ),
                const ThemeGap.xs(),
                ThemeText.bodyXSmallRegular(
                  '($count)',
                  color: theme.colors.primary50,
                ),
              ],
            ),
            Icon(
              isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: 16,
              color: theme.colors.primary50,
            ),
          ],
        ),
      ),
    );
  }
}
