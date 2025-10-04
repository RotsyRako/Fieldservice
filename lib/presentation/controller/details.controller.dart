import 'package:arkup_edoo/common/utils/app.utils.dart';
import 'package:go_router/go_router.dart';
import 'dart:io';
import 'dart:convert';
import 'package:arkup_edoo/models/dto/intervention/commentaire.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/document.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/material.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/photo.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/comment_pj_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/comment_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/document_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/material_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/photo_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/signature_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation_request.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/timesheet_synchro.dto.dart';
import 'package:arkup_edoo/presentation/controller/home.controller.dart';
import 'package:intl/intl.dart';
import 'package:arkup_edoo/service/applying/local/intervention/comment_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/document_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/material_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/photo_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/temps_intervention_local.sa.dart';
import 'package:arkup_edoo/service/applying/remote/synchronisation_remote.sa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/presentation/controller/base.controller.dart';
import 'package:arkup_edoo/models/constant/intervention_status_enum.dart';
import 'package:arkup_edoo/service/applying/local/intervention/intervention_local.sa.dart';

import '../../models/dto/intervention/update_status_request.dto.dart';
import '../../service/applying/remote/update_status_remote.sa.dart';
import '../../service/technical/connection.st.dart';

final detailsControllerProvider =
    StateNotifierProvider.autoDispose<DetailsController, AsyncValue<int>>(
      (ref) => DetailsController(ref),
    );

class DetailsController extends BaseController<int> {
  DetailsController(Ref ref) : super(ref, const AsyncValue.loading());

  Future<bool> updateStatusIntervention(InterventionDTO intervention) async {
    setLoading(show: true);
    final interventionLocalService = ref.read(interventionLocalSAProvider);
    final updatedIntervention = intervention.copyWith(
      status: InterventionStatus.inProgress.id,
    );

    await interventionLocalService.insertOrUpdate(data: updatedIntervention);
    final homeController = ref.read(homeControllerProvider.notifier);
    homeController.updateInterventionInList(updatedIntervention);

    final isConnected = await ref.read(connectionStatusProvider.future);
    if (isConnected && intervention.id.isNotNull) {
      final request = UpdateStatusRequestDTO(
        statusId: InterventionStatus.inProgress.id,
        interventionId: intervention.id!,
      );
      await ref
          .read(updateStatusRemoteServiceProvider)
          .updateStatus(request: request);
    }

    setLoading(show: false);
    return true;
  }

  Future<void> saveTimer(TempsInterventionDTO dto, InterventionDTO intervention) async {
    final sa = ref.read(tempsinterventionLocalSAProvider);
    final isConnected = await ref.read(connectionStatusProvider.future);
    
    try {
      await sa
          .insertOrUpdate(
            data: dto,
            completion: (ok) async {
          if (!ok) {
            showSnackbar(
              "Erreur lors de l'enregistrement du temps",
              isError: true,
            );
            return;
          }

          showSnackbar("Temps d'intervention enregistré dans la base locale");

          if (isConnected) {
            final result = await synchro();

            if (result) {
              updateIntervention(intervention, true);
              showSnackbar("Intervention synchronisé");
            } else {
              showSnackbar("Échec de la synchronisation", isError: true);
            }
          } else {
            updateIntervention(intervention, false);
          }
        },
          )
          .catchError((error) {
            showSnackbar(
              "Erreur lors de l'enregistrement du temps",
              isError: true,
            );
            print("❌ saveTimer error: $error");
          });
    } catch (e) {
      showSnackbar("Temps d'intervention non ajouté", isError: true);
      print("❌ saveTimer exception: $e");
    }
  }

    updateIntervention(InterventionDTO intervention, bool status) async {
    final homeController = ref.read(homeControllerProvider.notifier);
    final updatedIntervention = intervention.copyWith(isSync: status);
    homeController.updateInterventionInList(updatedIntervention);
  }

  Future<void> synchronisation(
    BuildContext context,
    InterventionDTO intervention,
  ) async {
    try {
      final isConnected = await ref.read(connectionStatusProvider.future);

      if (isConnected) {
        setLoading(show: true, message: "Synchronisation en cours...");

        final result = await synchro();

        if (result) {
          updateIntervention(intervention, true);
          showSnackbar("Intervention synchronisé");
        } else {
          showSnackbar("Échec de la synchronisation", isError: true);
        }
      } else {
        updateIntervention(intervention, false);
        showSnackbar("Pas de connexion internet");
      }
    } catch (e) {
      showSnackbar("Erreur imprévue : ${e.toString()}", isError: true);
      print("error synch ========= ${e.toString()}");
    } finally {
      setLoading(show: false);
    }
  }
  
}
