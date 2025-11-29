import 'dart:async';
import 'dart:io';

import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_list_response.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_update_response.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_sync_request.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_sync_response.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_complete.dto.dart';
import 'package:field_service/src/repository/remote/intervention/intervention_remote.repository.dart';
import 'package:field_service/src/services/applying/local/intervention/intervention_local.service.dart';
import 'package:field_service/src/services/applying/remote/base_remote.sa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'intervention_remote.sa.g.dart';

class InterventionRemoteService extends BaseRemoteService {
  InterventionRemoteService({
    required InterventionRemoteRepository interventionRemoteRepository,
    required InterventionLocalService interventionLocalService,
  })  : _interventionRemoteRepository = interventionRemoteRepository,
        _interventionLocalService = interventionLocalService,
        super(
          baseRemoteRepository:
              interventionRemoteRepository.baseRemoteRepository,
        );

  final InterventionRemoteRepository _interventionRemoteRepository;
  final InterventionLocalService _interventionLocalService;

  Future<List<InterventionDto>> fetchInterventions({
    String? userId,
    LoadingCallback? loading,
    OnSuccessCallback<List<InterventionDto>>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    final completer = Completer<List<InterventionDto>>();

    await executeOperation<InterventionListResponseDto>(
      operation: () async => _interventionRemoteRepository.fetchInterventions(
        userId: userId,
      ),
      loading: loading,
      onSuccess: (response) {
        final data = response.data;
        if (!completer.isCompleted) {
          completer.complete(data);
        }
        onSuccess?.call(data);
      },
      onFailure: (message) {
        if (!completer.isCompleted) {
          completer.complete(const <InterventionDto>[]);
        }
        onFailure?.call(message);
      },
      defaultErrorMessage: defaultErrorMessage,
    );

    if (!completer.isCompleted) {
      completer.complete(const <InterventionDto>[]);
    }

    return completer.future;
  }

  /// Met à jour le statut d'une intervention (offline-first).
  /// 
  /// Cette méthode suit une approche offline-first :
  /// 1. Met toujours à jour la base locale en premier
  /// 2. Si internet est disponible, essaie de mettre à jour l'API
  /// 3. Si l'API réussit, marque l'intervention comme synchronisée (isSync: true)
  /// 4. Si l'API échoue (pas d'internet), marque l'intervention comme non synchronisée (isSync: false)
  /// 
  /// [intervention] : L'intervention à mettre à jour.
  /// [newStatus] : Le nouveau statut (1=planifié, 2=en cours, 3=terminé).
  /// [loading] : Callback pour mettre à jour l'état de chargement.
  /// [onSuccess] : Callback appelé en cas de succès.
  /// [onFailure] : Callback appelé en cas d'échec (uniquement pour l'API, la base locale est toujours mise à jour).
  /// [defaultErrorMessage] : Message d'erreur par défaut.
  /// 
  /// Retourne l'intervention mise à jour (depuis la base locale).
  Future<InterventionDto> updateStatusOfflineFirst({
    required InterventionDto intervention,
    required int newStatus,
    LoadingCallback? loading,
    OnSuccessCallback<InterventionDto>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    // Étape 1 : Toujours mettre à jour la base locale en premier
    // Mettre à jour la base locale avec isSync: false (sera mis à jour si l'API réussit)
    InterventionDto updatedLocalIntervention = await _interventionLocalService.updateStatus(
      intervention: intervention,
      newStatus: newStatus,
      isSync: false,
    );

    // Si l'intervention n'a pas d'ID serveur, on ne peut pas synchroniser avec l'API
    final serverId = updatedLocalIntervention.id;
    if (serverId == null) {
      loading?.call(false);
      onSuccess?.call(updatedLocalIntervention);
      return updatedLocalIntervention;
    }

    // Étape 2 : Essayer de mettre à jour l'API si internet est disponible
    try {
      loading?.call(true);
      
      final response = await _interventionRemoteRepository.updateStatus(
        interventionId: serverId,
        status: newStatus,
      );

      // Étape 3 : Si l'API réussit, mettre à jour la base locale avec les données du serveur et isSync: true
      final serverIntervention = response.data;
      updatedLocalIntervention = await _interventionLocalService.updateStatus(
        intervention: serverIntervention.copyWith(
          localId: updatedLocalIntervention.localId,
          isSync: true,
        ),
        newStatus: newStatus,
        isSync: true,
      );

      loading?.call(false);
      onSuccess?.call(updatedLocalIntervention);
      return updatedLocalIntervention;
    } on SocketException {
      // Pas de connexion internet - c'est normal, on continue avec la base locale
      loading?.call(false);
      onFailure?.call('Pas de connexion internet. Les modifications ont été sauvegardées localement et seront synchronisées plus tard.');
      return updatedLocalIntervention;
    } on RemoteException catch (e) {
      // Erreur de l'API mais on garde la mise à jour locale
      loading?.call(false);
      onFailure?.call(e.remoteMessage);
      return updatedLocalIntervention;
    } catch (e) {
      // Autre erreur
      loading?.call(false);
      final errorMessage = e.toString();
      onFailure?.call(errorMessage);
      return updatedLocalIntervention;
    }
  }

  /// Met à jour le statut d'une intervention via l'API uniquement (ancienne méthode, gardée pour compatibilité).
  /// 
  /// Utilisez [updateStatusOfflineFirst] pour une approche offline-first.
  Future<InterventionDto?> updateStatus({
    required String interventionId,
    required int status,
    LoadingCallback? loading,
    OnSuccessCallback<InterventionDto>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    final completer = Completer<InterventionDto?>();

    await executeOperation<InterventionUpdateResponseDto>(
      operation: () async => _interventionRemoteRepository.updateStatus(
        interventionId: interventionId,
        status: status,
      ),
      loading: loading,
      onSuccess: (response) {
        final data = response.data;
        if (!completer.isCompleted) {
          completer.complete(data);
        }
        onSuccess?.call(data);
      },
      onFailure: (message) {
        if (!completer.isCompleted) {
          completer.complete(null);
        }
        onFailure?.call(message);
      },
      defaultErrorMessage: defaultErrorMessage ?? 'Impossible de mettre à jour le statut de l\'intervention',
    );

    if (!completer.isCompleted) {
      completer.complete(null);
    }

    return completer.future;
  }

  /// Synchronise une ou plusieurs interventions avec le serveur.
  ///
  /// [request] : DTO contenant la liste des interventions à synchroniser.
  /// [loading] : Callback pour mettre à jour l'état de chargement.
  /// [onSuccess] : Callback appelé en cas de succès avec la liste des interventions synchronisées.
  /// [onFailure] : Callback appelé en cas d'échec.
  /// [defaultErrorMessage] : Message d'erreur par défaut.
  ///
  /// Retourne la liste des interventions synchronisées avec toutes leurs données.
  Future<List<InterventionCompleteDto>> syncInterventions({
    required InterventionSyncRequestDto request,
    LoadingCallback? loading,
    OnSuccessCallback<List<InterventionCompleteDto>>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    final completer = Completer<List<InterventionCompleteDto>>();

    await executeOperation<InterventionSyncResponseDto>(
      operation: () async => _interventionRemoteRepository.syncInterventions(
        request: request,
      ),
      loading: loading,
      onSuccess: (response) {
        final data = response.data;
        if (!completer.isCompleted) {
          completer.complete(data);
        }
        onSuccess?.call(data);
      },
      onFailure: (message) {
        if (!completer.isCompleted) {
          completer.complete(const <InterventionCompleteDto>[]);
        }
        onFailure?.call(message);
      },
      defaultErrorMessage: defaultErrorMessage ?? 'Impossible de synchroniser les interventions',
    );

    if (!completer.isCompleted) {
      completer.complete(const <InterventionCompleteDto>[]);
    }

    return completer.future;
  }
}

@Riverpod(keepAlive: true)
InterventionRemoteService interventionRemoteService(Ref ref) {
  final repository = ref.watch(interventionRemoteRepositoryProvider);
  final localService = ref.watch(interventionLocalServiceProvider);
  return InterventionRemoteService(
    interventionRemoteRepository: repository,
    interventionLocalService: localService,
  );
}
