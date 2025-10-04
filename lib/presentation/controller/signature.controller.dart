import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:arkup_edoo/common/utils/app.utils.dart';
import 'package:arkup_edoo/models/constant/intervention_status_enum.dart';
import 'package:arkup_edoo/models/constant/routes.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/presentation/controller/home.controller.dart';
import 'package:arkup_edoo/service/applying/local/intervention/intervention_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/temps_intervention_local.sa.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:signature/signature.dart';
import 'package:arkup_edoo/presentation/controller/base.controller.dart';

final signatureControllerProvider = StateNotifierProvider<CustomSignatureController, AsyncValue<void>>(
      (ref) => CustomSignatureController(ref),
);

class CustomSignatureController extends BaseController<void> {
  late final SignatureController signatureController;

  CustomSignatureController(Ref ref) : super(ref, const AsyncValue.data(null)) {
    signatureController = SignatureController(
      penStrokeWidth: 1,
      penColor: Colors.black,
      exportBackgroundColor: Colors.transparent,
      exportPenColor: Colors.black,
      onDrawStart: () => log('onDrawStart called!'),
      onDrawEnd: () => log('onDrawEnd called!'),
    );
  }

  getTimer(int id) async {
    final sa = ref.read(tempsinterventionLocalSAProvider);

    return await sa.findByInterventionId(id);
  }

  syncIntervention() {

  }

 Future<void> saveIntervention(BuildContext context, InterventionDTO dto) async {
  final localSA = ref.read(interventionLocalSAProvider);
  // final synchroSA = ref.read(sychronisationRemoteServiceProvider);
  final homeController = ref.read(homeControllerProvider.notifier);

  try {
    await localSA.updateOnly(
      data: dto,
      completion: (ok) async {
        if (!ok) {
          showSnackbar(
            "Erreur lors de l'enregistrement de l'intervention",
            isError: true,
          );
          return;
        }

        final isConnected = await ref.read(connectionStatusProvider.future);

        if(isConnected) {
          final result = await synchro();
          if(result){
              updateIntervention(dto, true);
          }else{
            updateIntervention(dto, false);
          }
          context.goNamed(Routes.home);
        }else{
          homeController.updateInterventionInList(dto);
          context.goNamed(Routes.home);
        }
      },
    );
  } catch (e) {
    showSnackbar("Erreur inattendue lors de l'enregistrement", isError: true);
    print("❌ saveIntervention exception: $e");
    context.goNamed(Routes.home); // ✅ Naviguer même en cas d'erreur
  }
}

  Future<void> saveSignatureAndIntervention(BuildContext context, InterventionDTO dto) async {
  try {
    if (!signatureController.isNotEmpty) {
      showSnackbar("Veuillez signer avant de valider", isError: true);
      return;
    }

    // Exporter la signature en image PNG
    final image = await signatureController.toImage();
    if (image == null) {
      showSnackbar("Erreur lors de la génération de l'image", isError: true);
      return;
    }

    final bytes = await image.toByteData(format: ImageByteFormat.png);
    if (bytes == null) {
      showSnackbar("Erreur lors de la conversion de la signature", isError: true);
      return;
    }

    // Créer un fichier local (attention à bien utiliser .png ici aussi)
    final directory = await getApplicationDocumentsDirectory();
    final fileName = 'signature_${dto.localId}.png'; // cohérence du format
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);
    await file.writeAsBytes(bytes.buffer.asUint8List());

    // Créer un nouveau DTO avec la signature
    InterventionDTO updatedDTO = dto.copyWith(signature: filePath, status : InterventionStatus.completed.id);

    print("🔁 updatedDTO: ${updatedDTO.toJson()}");
    

    // Sauvegarder l'intervention
    await saveIntervention(context, updatedDTO);

    signatureController.clear();

  } catch (e) {
    showSnackbar("Erreur lors de la sauvegarde de la signature", isError: true);
    print("❌ saveSignature error: $e");
  }
}  

   updateIntervention(InterventionDTO intervention, bool status) async {
    final homeController = ref.read(homeControllerProvider.notifier);
    final updatedIntervention = intervention.copyWith(isSync: status);
    homeController.updateInterventionInList(updatedIntervention);
  }
}
