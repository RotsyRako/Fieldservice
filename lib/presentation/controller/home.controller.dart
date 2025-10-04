import 'package:arkup_edoo/models/constant/intervention_status_enum.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention_response.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/material_required.dto.dart';
import 'package:arkup_edoo/presentation/controller/base.controller.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:arkup_edoo/service/applying/local/intervention/intervention_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/material_local.sa.dart';
import 'package:arkup_edoo/service/applying/remote/intervention_remote.sa.dart';
import '../../service/applying/local/intervention/material_required_local.sa.dart';

class HomeController extends BaseController<List<InterventionDTO>> {
  HomeController(Ref ref) : super(ref, const AsyncValue.loading());

  Future<void> fetchInterventions() async {
    try {
      // final isConnected = await ref.read(connectionStatusProvider.future);
      // if (isConnected) {
      //   await synchronisation();
      // }
      final interventionSA = ref.read(interventionLocalSAProvider);
      final result = await interventionSA.findAll();

      print("intervention lenght =======> ${result.length}");
      state = AsyncValue.data(result);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<List<InterventionDTO>> getAllInterventionOdoo() async {
    try {
      List<InterventionDTO> interventions = [];
      final interventionRemoteService = ref.read(
        interventionRemoteServiceProvider,
      );
      final interventionLocalService = ref.read(interventionLocalSAProvider);
      final materialLocalService = ref.read(materialLocalSAProvider);
      final materialRequiredLocalService = ref.read(
        materialRequiredLocalSAProvider,
      );

      interventions = await interventionLocalService.findAll();

      print("intervention lenght =======> ${interventions.length}");

      if (interventions.isEmpty) {
        final InterventionResponseDto result =
            await interventionRemoteService.getAllIntervention();
        if (result.data!.isNotEmpty) {
          result.data?.forEach((intervention) async {
            InterventionDTO dto = intervention;

            if (dto.status == InterventionStatus.completed.id) {
              dto = dto.copyWith(isSync: true);
            } else {
              dto = dto.copyWith(isSync: false);
            }

            interventionLocalService.insertOnly(
              data: dto,
              dataId: (idIntervention) {
                if (intervention.materialRequired!.isNotEmpty) {
                  intervention.materialRequired?.forEach((material) {
                    MaterialRequiredDTO data = material;
                    final materialRequiredData = data.copyWith(
                      idIntervention: idIntervention,
                    );
                    materialRequiredLocalService.insertOnly(
                      data: materialRequiredData,
                    );
                  });
                }
              },
            );
          });
        }
        interventions = await interventionLocalService.findAll();
      }

      return interventions;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }

  void updateInterventionInList(InterventionDTO updated) {
    state = state.whenData((interventions) {
      final index = interventions.indexWhere((i) => i.id == updated.id);
      if (index != -1) {
        final newList = [...interventions];
        newList[index] = updated;
        return newList;
      }
      return interventions;
    });
  }

  Future<void> refetchList() async {
    final isConnected = await ref.read(connectionStatusProvider.future);

    if (isConnected) {
      setLoading(show: true, message: "Mise à jour des données locales...");

      final interventionRemoteService = ref.read(
        interventionRemoteServiceProvider,
      );
      final interventionLocalService = ref.read(interventionLocalSAProvider);
      final materialRequiredLocalService = ref.read(
        materialRequiredLocalSAProvider,
      );

      try {
        final InterventionResponseDto result =
            await interventionRemoteService.getAllIntervention();

        if (result.data?.isNotEmpty ?? false) {
          for (final intervention in result.data!) {
            var dto = intervention.copyWith(
              isSync: intervention.status == InterventionStatus.completed.id,
            );

            print("dto ==== > ${dto.toJson().toString()}");

            await interventionLocalService.insertOrUpdateByServerId(
              data: dto,
              dataId: (localId) async {
                // Supprimer tous les matériels liés
                final deletedCount = await materialRequiredLocalService
                    .repository
                    .deleteByInterventionId(localId);

                // Vérifier suppression
                final remainingMaterials = await materialRequiredLocalService
                    .repository
                    .findByInterventionId(localId);
                if (remainingMaterials.isEmpty) {
                  print(
                    "✅ Tous les matériels pour l'intervention $localId ont été supprimés",
                  );
                } else {
                  print(
                    "⚠️ Certains matériels n'ont pas été supprimés pour l'intervention $localId",
                  );
                }

                // Réinsérer la nouvelle liste
                if (intervention.materialRequired?.isNotEmpty ?? false) {
                  for (final material in intervention.materialRequired!) {
                    final materialData = material.copyWith(
                      idIntervention: localId,
                    );
                    await materialRequiredLocalService.insertOnly(
                      data: materialData,
                    );
                  }
                }
              },
            );
          }
        }

        await fetchInterventions();

        showSnackbar("Liste des interventions mise à jour avec succès");
      } catch (e, stack) {
        showSnackbar("Erreur lors du rafraîchissement", isError: true);
        state = AsyncValue.error(e, stack);
        print("❌ refetchList error: $e");
      } finally {
        setLoading(show: false);
      }
    }
  }

  InterventionDTO? getInterventionById(int id) {
    return state.whenOrNull(
      data: (list) => list.firstWhereOrNull((i) => i.localId == id),
    );
  }
}

final homeControllerProvider = StateNotifierProvider.autoDispose<
  HomeController,
  AsyncValue<List<InterventionDTO>>
>((ref) => HomeController(ref));
