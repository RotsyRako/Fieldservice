// controller/login.controller.dart
import 'package:arkup_edoo/models/constant/intervention_status_enum.dart';
import 'package:arkup_edoo/models/constant/routes.dart';
import 'package:arkup_edoo/models/dto/auth/login_request.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention_response.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/material.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/material_available_response.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/material_required.dto.dart';
import 'package:arkup_edoo/presentation/controller/base.controller.dart';
import 'package:arkup_edoo/repository/secure_storage.dart';
import 'package:arkup_edoo/service/applying/local/intervention/comment_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/document_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/intervention_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/material_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/photo_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/temps_intervention_local.sa.dart';
import 'package:arkup_edoo/service/applying/remote/intervention_remote.sa.dart';
import 'package:arkup_edoo/service/applying/remote/login_remote.sa.dart';
import 'package:arkup_edoo/service/applying/remote/material_available_remote.sa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';

import '../../models/dto/intervention/material_available.dto.dart';
import '../../service/applying/local/intervention/material_available_local.sa.dart';
import '../../service/applying/local/intervention/material_required_local.sa.dart';

final loginControllerProvider =
    StateNotifierProvider<LoginController, AsyncValue<void>>(
      (ref) => LoginController(ref),
    );

class LoginController extends BaseController<void> {
  LoginController(Ref ref) : super(ref, const AsyncValue.data(null));

  final _hasFetchedProvider = StateProvider<bool>((ref) => false);

  Future<void> login(LoginRequestDTO request, BuildContext context) async {
    try {
      final isConnected = await ref.read(connectionStatusProvider.future);
      if (!isConnected) {
        showSnackbar("Pas de connexion internet", isError: true);
        return;
      }
    } catch (e) {
      showSnackbar("Erreur lors de la vérification de la connexion", isError: true);
      return;
    }

  setLoading(show: true);
  
  try {
    final loginResponseDto = await ref
        .read(loginRemoteServiceProvider)
        .login(request: request);
        
    if (loginResponseDto.success && loginResponseDto.data?.token.isNotEmpty == true) {
      final storage = ref.read(secureStorageProvider);
      await storage.saveAccessToken(loginResponseDto.data!.token);
      
      // Attendre que le refetch soit complet avant de naviguer
      await refetchList(); 
      
      if (context.mounted) {
        setLoading(show: false);
        // Réinitialiser l'état avant navigation
        ref.invalidate(_hasFetchedProvider);
        context.go(Routes.home);
      }
    } else {
      setLoading(show: false);
      showSnackbar(loginResponseDto.message, isError: true);
    }
  } catch (e) {
    setLoading(show: false);
    showSnackbar("Erreur lors de la connexion", isError: true);
  }
}

  Future<void> refetchList() async {

    try {
      // Lire tous les services locaux
      final interventionLocalService = ref.read(interventionLocalSAProvider);
      final materialLocalService = ref.read(materialLocalSAProvider);
      final tempsInterventionLocalSA = ref.read(
        tempsinterventionLocalSAProvider,
      );
      final photoLocalSA = ref.read(photoLocalSAProvider);
      final documentLocalSA = ref.read(documentLocalSAProvider);
      final commentLocalSA = ref.read(commentLocalSAProvider);

      // Supprimer le contenu de chaque table
      await materialLocalService.repository.db
          .delete(materialLocalService.repository.table)
          .go();
      await interventionLocalService.repository.db
          .delete(interventionLocalService.repository.table)
          .go();
      await tempsInterventionLocalSA.repository.db
          .delete(tempsInterventionLocalSA.repository.table)
          .go();
      await photoLocalSA.repository.db
          .delete(photoLocalSA.repository.table)
          .go();
      await documentLocalSA.repository.db
          .delete(documentLocalSA.repository.table)
          .go();
      await commentLocalSA.repository.db
          .delete(commentLocalSA.repository.table)
          .go();

      // Recharger les interventions depuis le serveur
      await getAllInterventionOdoo();

      showSnackbar("Liste des interventions mise à jour avec succès");
    } catch (e, stack) {
      showSnackbar("Erreur lors du rafraîchissement", isError: true);
      state = AsyncValue.error(e, stack);
      print("❌ refetchList error: $e");
    } 
  }

  getAllInterventionOdoo() async {
    try {
      final interventionRemoteService = ref.read(interventionRemoteServiceProvider,);
      final interventionLocalService = ref.read(interventionLocalSAProvider);
      final materialLocalService = ref.read(materialLocalSAProvider);
      final materialRequiredLocalService = ref.read(materialRequiredLocalSAProvider);
      final materialAvailableRemoteService = ref.read(materialAvailableRemoteServiceProvider);
      final materialAvailableLocalService = ref.read(materialAvailableLocalSAProvider);

      final InterventionResponseDto result = await interventionRemoteService.getAllIntervention();
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
                  materialRequiredLocalService.insertOnly(data: materialRequiredData);
                });
              }
            },
          );
        });
      }

      final MaterialAvailableResponseDto materialAvailables = await materialAvailableRemoteService.getAllMaterialAvailable();
      if (materialAvailables.data!.isNotEmpty) {
        materialAvailables.data?.forEach((materialAvailable) async {
          MaterialAvailableDTO dto = materialAvailable;

          materialAvailableLocalService.insertOnly(data: dto,);
        });
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      rethrow;
    }
  }
}
