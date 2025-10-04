import 'dart:io';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/presentation/controller/signature.controller.dart';
import 'package:arkup_edoo/presentation/views/base.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:signature/signature.dart';
import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/widgets/dataRangeDisplay.widget.dart';

 

class SignatureScreen extends BaseScreen {
  const SignatureScreen({super.key, required this.intervention});

  final InterventionDTO intervention;
  

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    final controller = ref.read(signatureControllerProvider.notifier);
 
    print("signature =========> ${intervention.toJson().toString()}");

    return BaseScreen.baseScaffoldView(
      ref: ref,
      context: context,
      withHeader: true,
      headerTitle: intervention.title,
      useSafeArea: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DateRangeDisplay(
                    startDate: intervention.dateStart ?? "",
                    endDate: intervention.dateEnd ?? "",
                  ),
                  const SizedBox(height: 5),
                  Text(
                    intervention.description,
                    style: const TextStyle(color: ThemeColors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// === Titre Signature + bouton effacer si pas encore signé
            Row(
              children: [
                const Text(
                  "Signature du client",
                  style: TextStyle(color: ThemeColors.green),
                ),
                const Spacer(),
                if (intervention.signature == null)
                  GestureDetector(
                    onTap: () {
                      controller.signatureController.clear();
                    },
                    child: const Icon(
                      Icons.cleaning_services,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 6),

            /// === Affichage soit de l'image, soit du champ de signature
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                color: Colors.white,
                height: 317,
                width: double.infinity,
                child: intervention.signature != null
                    ? Image.file(
                        File(intervention.signature!),
                        fit: BoxFit.contain,
                      )
                    : Signature(
                        key: const Key('signature'),
                        controller: controller.signatureController,
                        backgroundColor: Colors.transparent,
                      ),
              ),
            ),

            const SizedBox(height: 24),

            if (intervention.signature == null)
              Button.elevated(
                onPressed: () async {
                  final timers = await controller.getTimer(intervention.localId!);
                  if (timers.isNotEmpty) {
                    await controller.saveSignatureAndIntervention(context, intervention);
                  } else {
                    controller.showSnackbar("Ajouter les temps d'intervention avant de signer");
                  }
                },
                buttonTitle: "Valider la signature",
                isGradient: false,
                icon: const Icon(Icons.check, color: ThemeColors.white),
              ),
          ],
        ),
      ),
    );
  }
}
