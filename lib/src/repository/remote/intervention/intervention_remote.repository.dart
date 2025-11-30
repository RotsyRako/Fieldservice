import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/models/constants/urls.dart';
import 'package:field_service/src/models/dto/intervention/intervention_list_response.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_update_response.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_sync_request.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_sync_response.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_estimate_response.dto.dart';
import 'package:field_service/src/repository/remote/base_remote.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'intervention_remote.repository.g.dart';

/// Repository pour la récupération distante des interventions.
class InterventionRemoteRepository {
  InterventionRemoteRepository({
    required this.baseRemoteRepository,
  });

  final BaseRemoteRepository baseRemoteRepository;

  /// Récupère la liste des interventions.
  ///
  /// [userId] permet de filtrer les interventions par utilisateur si fourni.
  Future<InterventionListResponseDto> fetchInterventions({String? userId}) async {
    final params = (userId != null && userId.isNotEmpty)
        ? <String, String>{'userId': userId}
        : null;

    final response = await baseRemoteRepository.get(
      "${Urls.urls.interventionsByUser}/$userId",
      params: params,
    );

    if (response is Map<String, dynamic>) {
      final success = response['success'];
      if (success is bool && !success) {
        throw RemoteException(
          remoteMessage:
              response['message'] as String? ??
                  'Impossible de récupérer les interventions',
        );
      }

      return InterventionListResponseDto.fromJson(response);
    }

    throw RemoteException(
      remoteMessage: 'Réponse inattendue du serveur lors de la récupération des interventions',
    );
  }

  /// Met à jour le statut d'une intervention.
  ///
  /// [interventionId] : ID de l'intervention à mettre à jour.
  /// [status] : Nouveau statut (1=planifié, 2=en cours, 3=terminé).
  Future<InterventionUpdateResponseDto> updateStatus({
    required String interventionId,
    required int status,
  }) async {
    final response = await baseRemoteRepository.put(
      Urls.urls.updateStatus(interventionId),
      body: {
        'id': interventionId,
        'status': status,
      },
    );

    if (response is Map<String, dynamic>) {
      final success = response['success'];
      if (success is bool && !success) {
        throw RemoteException(
          remoteMessage:
              response['message'] as String? ??
                  'Impossible de mettre à jour le statut de l\'intervention',
        );
      }

      return InterventionUpdateResponseDto.fromJson(response);
    }

    throw RemoteException(
      remoteMessage: 'Réponse inattendue du serveur lors de la mise à jour du statut',
    );
  }

  /// Synchronise une ou plusieurs interventions avec le serveur.
  ///
  /// [request] : DTO contenant la liste des interventions à synchroniser.
  ///
  /// Retourne une réponse contenant les interventions synchronisées avec toutes leurs données.
  Future<InterventionSyncResponseDto> syncInterventions({
    required InterventionSyncRequestDto request,
  }) async {
    final response = await baseRemoteRepository.post(
      Urls.urls.synchro,
      body: request.toJson(),
    );

    if (response is Map<String, dynamic>) {
      final success = response['success'];
      if (success is bool && !success) {
        throw RemoteException(
          remoteMessage:
              response['message'] as String? ??
                  'Impossible de synchroniser les interventions',
        );
      }

      return InterventionSyncResponseDto.fromJson(response);
    }

    throw RemoteException(
      remoteMessage: 'Réponse inattendue du serveur lors de la synchronisation des interventions',
    );
  }

  /// Génère une estimation pour une intervention.
  ///
  /// [interventionId] : ID de l'intervention pour laquelle générer l'estimation.
  ///
  /// Retourne une réponse contenant l'estimation (temps estimé, raisonnement, confiance).
  Future<InterventionEstimateResponseDto> estimateIntervention({
    required String interventionId,
  }) async {
    final response = await baseRemoteRepository.post(
      Urls.urls.estimateIntervention(interventionId),
      body: <String, dynamic>{},
    );

    if (response is Map<String, dynamic>) {
      final success = response['success'];
      if (success is bool && !success) {
        throw RemoteException(
          remoteMessage:
              response['message'] as String? ??
                  'Impossible de générer l\'estimation de l\'intervention',
        );
      }

      return InterventionEstimateResponseDto.fromJson(response);
    }

    throw RemoteException(
      remoteMessage: 'Réponse inattendue du serveur lors de la génération de l\'estimation',
    );
  }
}

@Riverpod(keepAlive: true)
InterventionRemoteRepository interventionRemoteRepository(Ref ref) {
  final baseRemoteRepo = ref.watch(baseRemoteRepositoryProvider);
  return InterventionRemoteRepository(
    baseRemoteRepository: baseRemoteRepo,
  );
}
