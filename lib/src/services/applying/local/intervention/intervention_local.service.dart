import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/models/factory/intervention/intervention.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/intervention/intervention_local.repository.dart';
import 'package:field_service/src/services/applying/local/base_local.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'intervention_local.service.g.dart';

/// Service local pour la gestion des interventions
/// 
/// Fournit les opérations CRUD au niveau service avec conversion entre DTOs et DOs.
class InterventionLocalService extends BaseLocalService<
    $InterventionsTable,
    Intervention,
    InterventionDto,
    InterventionsCompanion,
    InterventionFactory,
    InterventionLocalRepository> {
  
  InterventionLocalService({
    required InterventionFactory factory,
    required InterventionLocalRepository repository,
  }) {
    initialize(
      factory: factory,
      repository: repository,
    );
  }

  /// Met à jour le statut d'une intervention dans la base locale.
  /// 
  /// [intervention] : L'intervention à mettre à jour.
  /// [newStatus] : Le nouveau statut (1=planifié, 2=en cours, 3=terminé).
  /// [isSync] : Indique si l'intervention est synchronisée avec le serveur.
  /// 
  /// Retourne l'intervention mise à jour.
  Future<InterventionDto> updateStatus({
    required InterventionDto intervention,
    required int newStatus,
    bool isSync = false,
  }) async {
    // Créer une copie de l'intervention avec le nouveau statut
    final updatedIntervention = intervention.copyWith(
      status: newStatus,
      isSync: isSync,
      updatedAt: DateTime.now(),
    );

    // Si l'intervention a un ID serveur, utiliser insertOrUpdateByServerId
    // Sinon, utiliser insertOrUpdate avec localId
    if (updatedIntervention.id != null) {
      await insertOrUpdateByServerId(updatedIntervention);
      // Récupérer l'intervention mise à jour pour retourner toutes les données
      final result = await findByServerId(updatedIntervention.id!);
      return result ?? updatedIntervention;
    } else {
      // Si pas d'ID serveur, utiliser le localId
      await insertOrUpdate(updatedIntervention);
      // Récupérer l'intervention mise à jour
      if (updatedIntervention.localId != null) {
        final result = await findById(updatedIntervention.localId!);
        return result ?? updatedIntervention;
      }
      return updatedIntervention;
    }
  }
}

/// Provider Riverpod pour le service local des interventions
@Riverpod(keepAlive: true)
InterventionLocalService interventionLocalService(Ref ref) {
  final repository = ref.watch(interventionLocalRepositoryProvider);
  final factory = InterventionFactory.instance;
  return InterventionLocalService(
    factory: factory,
    repository: repository,
  );
}
