import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:signature/signature.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button_icon_position.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/presentation/widget/status_app_bar.dart';
import 'package:field_service/src/presentation/controller/intervention/intervention.controller.dart';
import 'package:field_service/src/presentation/controller/home/home.controller.dart';
import 'package:field_service/src/routing/routes.dart';
import 'package:field_service/src/routing/app_router.dart';
import 'package:field_service/src/common/theme/widgets/theme_pop_up/theme_pop_up.dart';
import 'package:field_service/src/common/theme/widgets/theme_pop_up/theme_pop_up_type.dart';
import 'package:field_service/src/common/theme/widgets/theme_loader/theme_loader.dart';
import 'package:field_service/src/services/applying/local/signature/signature_local.service.dart';
import 'package:field_service/src/services/applying/local/intervention/intervention_local.service.dart';
import 'package:field_service/src/services/applying/remote/intervention/intervention_remote.sa.dart';
import 'package:field_service/src/services/technical/connection_service.dart';
import 'package:field_service/src/models/dto/intervention/intervention_sync_request.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_sync_item.dto.dart';
import 'package:field_service/src/services/applying/local/comment/comment_local.service.dart';
import 'package:field_service/src/services/applying/local/document/document_local.service.dart';
import 'package:field_service/src/services/applying/local/image/image_local.service.dart';
import 'package:field_service/src/services/applying/local/material/material_local.service.dart';
import 'package:field_service/src/services/applying/local/timesheet/timesheet_local.service.dart';

class SignatureView extends ConsumerStatefulWidget {
  const SignatureView({
    required this.intervention,
    super.key,
  });

  final InterventionDto intervention;

  @override
  ConsumerState<SignatureView> createState() => _SignatureViewState();
}

class _SignatureViewState extends ConsumerState<SignatureView> {
  late SignatureController _signatureController;

  @override
  void initState() {
    super.initState();
    _signatureController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
  }

  @override
  void dispose() {
    _signatureController.dispose();
    super.dispose();
  }

  /// Synchronise une seule intervention avec le serveur
  Future<void> _syncSingleIntervention({
    required WidgetRef ref,
    required String interventionId,
  }) async {
    // Récupérer tous les services nécessaires
    final interventionLocalService = ref.read(interventionLocalServiceProvider);
    final interventionRemoteService = ref.read(interventionRemoteServiceProvider);
    final commentLocalService = ref.read(commentLocalServiceProvider);
    final documentLocalService = ref.read(documentLocalServiceProvider);
    final imageLocalService = ref.read(imageLocalServiceProvider);
    final materialLocalService = ref.read(materialLocalServiceProvider);
    final signatureLocalService = ref.read(signatureLocalServiceProvider);
    final timesheetLocalService = ref.read(timesheetLocalServiceProvider);

    // Récupérer l'intervention
    final intervention = await interventionLocalService.findByServerId(interventionId);
    if (intervention == null) {
      throw Exception('Intervention introuvable');
    }

    // Récupérer tous les items pour cette intervention
    final comments = await commentLocalService.findByInterventionId(interventionId);
    final documents = await documentLocalService.findByInterventionId(interventionId);
    final images = await imageLocalService.findByInterventionId(interventionId);
    final materials = await materialLocalService.findByInterventionId(interventionId);
    final signatures = await signatureLocalService.findByInterventionId(interventionId);
    final timesheets = await timesheetLocalService.findByInterventionId(interventionId);

    // Convertir les DTOs en Map pour la synchronisation
    final commentsMap = comments.map((c) => c.toJson()).toList();
    final documentsMap = documents.map((d) => d.toJson()).toList();
    final imagesMap = images.map((i) => i.toJson()).toList();
    final materialsMap = materials.map((m) => m.toJson()).toList();
    final signaturesMap = signatures.map((s) => s.toJson()).toList();
    final timesheetsMap = timesheets.map((t) => t.toJson()).toList();

    // Prendre la première signature si elle existe (ou null)
    final signatureMap = signaturesMap.isNotEmpty ? signaturesMap.first : null;

    // Créer l'item de synchronisation
    final syncItem = InterventionSyncItemDto(
      id: interventionId,
      status: intervention.status,
      materials: materialsMap,
      timesheets: timesheetsMap,
      images: imagesMap,
      documents: documentsMap,
      signature: signatureMap,
      comments: commentsMap,
    );

    // Créer la requête de synchronisation avec un seul item
    final syncRequest = InterventionSyncRequestDto(data: [syncItem]);

    // Effectuer la synchronisation
    String? syncError;
    await interventionRemoteService.syncInterventions(
      request: syncRequest,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      throw Exception(syncError);
    }
  }

  Future<void> _handleValidate() async {
    if (_signatureController.isEmpty) {
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Veuillez signer avant de valider'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    final interventionId = widget.intervention.id;
    if (interventionId == null) {
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Impossible de valider : intervention sans ID'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Exporter la signature
    final Uint8List? signatureData = await _signatureController.toPngBytes();
    
    if (signatureData == null) {
      if (!mounted) return;
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erreur lors de l\'exportation de la signature'),
          duration: Duration(seconds: 2),
        ),
      );
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
                  'Validation de la signature...',
                  color: Theme.of(context).colors.baseBlack,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      // Capturer les services AVANT les opérations asynchrones
      final signatureService = ref.read(signatureLocalServiceProvider);
      final interventionService = ref.read(interventionLocalServiceProvider);
      final interventionRemoteService = ref.read(interventionRemoteServiceProvider);
      final controller = ref.read(
        interventionControllerProvider(interventionId).notifier,
      );

      final success = await controller.validateAndSaveSignature(
        interventionId: interventionId,
        signatureBytes: signatureData,
        signatureService: signatureService, // Passer le service capturé
        interventionService: interventionService, // Passer le service capturé
        interventionRemoteService: interventionRemoteService, // Passer le service capturé
      );

      // Fermer le loader
      if (mounted) {
        Navigator.of(context).pop();
      }

      if (!mounted) return;
      
      if (success) {
        // Invalider le provider pour rafraîchir la liste des interventions
        ref.invalidate(homeControllerProvider);
        
        // Naviguer immédiatement vers la page d'accueil
        context.go(Routes.home.location);
        
        // Vérifier la connexion internet et synchroniser en arrière-plan
        final connectionService = ref.read(connectionServiceProvider);
        final isOnline = await connectionService.checkConnection();
        
        bool syncSuccess = false;
        if (isOnline) {
          // Synchroniser cette intervention avec le serveur
          try {
            await _syncSingleIntervention(
              ref: ref,
              interventionId: interventionId,
            );
            syncSuccess = true;
          } catch (syncError) {
            // Erreur de synchronisation, mais la signature est déjà sauvegardée localement
            print('Erreur lors de la synchronisation: $syncError');
            syncSuccess = false;
          }
        }
        
        // Afficher un popup seulement si la synchronisation a réussi
        if (syncSuccess) {
          // Attendre un peu pour que la navigation se termine
          await Future.delayed(const Duration(milliseconds: 300));
          
          // Utiliser le contexte global via le navigator key
          final navigatorKey = ref.read(navigatorKeyProvider);
          final navContext = navigatorKey.currentContext;
          if (navContext != null) {
            await showPopup(
              context: navContext,
              type: ThemePopUpType.success,
              title: 'Synchronisation réussie',
              message: 'La signature a été synchronisée avec succès',
              buttonLabel: 'OK',
            );
          }
        }
        // Si pas d'internet ou erreur de sync, pas de popup, juste navigation
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Erreur lors de la validation de la signature'),
              duration: Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      // Fermer le loader si toujours ouvert
      if (mounted) {
        try {
          Navigator.of(context).pop();
        } catch (_) {}
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceFirst('Exception: ', '')),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          const StatusAppBar(),
          
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // En-tête avec bouton retour
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => context.pop(),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ThemeText.h5Bold(widget.intervention.titre),
                              const ThemeGap.xs(),
                              // Dates
                              Row(
                                children: [
                                  ThemeText.bodySmallBold(
                                    widget.intervention.dateStart,
                                    color: theme.colors.grey50,
                                  ),
                                  const ThemeGap.xs(),
                                  Iconify(
                                    Ph.arrow_right,
                                    size: 12,
                                    color: theme.colors.primary50,
                                  ),
                                  const ThemeGap.xs(),
                                  ThemeText.bodySmallBold(
                                    widget.intervention.dateEnd,
                                    color: theme.colors.grey50,
                                  ),
                                ],
                              ),
                              const ThemeGap.xs(),
                              // Client
                              ThemeText.bodySmallBold(
                                widget.intervention.customer,
                                color: theme.colors.grey50.withValues(alpha: 0.64),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const ThemeGap.l(),
                    
                    // Zone de signature
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemeText.bodySmallBold('Signature du client'),
                        const ThemeGap.xs(),
                        // Zone de dessin
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: theme.colors.baseWhite,
                            border: Border.all(
                              color: theme.colors.grey50.withValues(alpha: 0.08),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Signature(
                              controller: _signatureController,
                              height: 200,
                              backgroundColor: theme.colors.baseWhite,
                            ),
                          ),
                        ),
                        const ThemeGap.l(),
                        
                        // Bouton de validation
                        ThemeButton.primary(
                          icon: Ic.check,
                          label: 'Valider la signature',
                          iconPosition: ThemeButtonIconPosition.left,
                          onPressed: _handleValidate,
                          fullWidth: true,
                          radius: BorderRadius.circular(8),
                          horizontalPadding: 12,
                          verticalPadding: 8,
                        ),
                      ],
                    ),
                    
                    const ThemeGap.xl(),
                    
                    // Message de synchronisation
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Iconify(
                            Ph.link,
                            size: 10,
                            color: theme.colors.primary50,
                          ),
                          const ThemeGap.xs(),
                          ThemeText.bodyXSmallSemiBold(
                            'Informations synchronisées',
                            color: theme.colors.primary50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

