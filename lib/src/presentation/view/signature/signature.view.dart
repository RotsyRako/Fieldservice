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
import 'package:field_service/src/common/theme/widgets/theme_loader/theme_loader.dart';
import 'package:field_service/src/services/applying/local/signature/signature_local.service.dart';
import 'package:field_service/src/services/applying/local/intervention/intervention_local.service.dart';
import 'package:field_service/src/services/applying/remote/intervention/intervention_remote.sa.dart';

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

      if (mounted) {
        if (success) {
          // Invalider le provider pour rafraîchir la liste des interventions
          ref.invalidate(homeControllerProvider);
          
          // Naviguer directement vers la page d'accueil
          context.go(Routes.home.location);
          
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Signature validée avec succès'),
              duration: Duration(seconds: 2),
              backgroundColor: Color(0xFF9963AD),
            ),
          );
        } else {
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

