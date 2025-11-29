import 'package:field_service/src/models/dto/material/material_dto.dart';
import 'package:field_service/src/models/factory/material/material.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/material/material_local.repository.dart';
import 'package:field_service/src/services/applying/local/base_local.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_local.service.g.dart';

/// Service local pour la gestion des matériaux
/// 
/// Fournit les opérations CRUD au niveau service avec conversion entre DTOs et DOs.
class MaterialLocalService extends BaseLocalService<
    $MaterialsTable,
    Material,
    MaterialDto,
    MaterialsCompanion,
    MaterialFactory,
    MaterialLocalRepository> {
  
  MaterialLocalService({
    required MaterialFactory factory,
    required MaterialLocalRepository repository,
  }) {
    initialize(
      factory: factory,
      repository: repository,
    );
  }

  /// Récupère tous les matériaux pour une intervention donnée
  Future<List<MaterialDto>> findByInterventionId(String idIntervention) async {
    final results = await repository.getByInterventionId(idIntervention);
    return factory.toDataTransfertObjects(results);
  }
}

/// Provider Riverpod pour le service local des matériaux
@Riverpod(keepAlive: true)
MaterialLocalService materialLocalService(Ref ref) {
  final repository = ref.watch(materialLocalRepositoryProvider);
  final factory = MaterialFactory.instance;
  return MaterialLocalService(
    factory: factory,
    repository: repository,
  );
}

