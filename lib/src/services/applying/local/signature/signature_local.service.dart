import 'package:field_service/src/models/dto/signature/signature_dto.dart';
import 'package:field_service/src/models/factory/signature/signature.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/signature/signature_local.repository.dart';
import 'package:field_service/src/services/applying/local/base_local.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signature_local.service.g.dart';

/// Service local pour la gestion des signatures
/// 
/// Fournit les opérations CRUD au niveau service avec conversion entre DTOs et DOs.
class SignatureLocalService extends BaseLocalService<
    $SignaturesTable,
    Signature,
    SignatureDto,
    SignaturesCompanion,
    SignatureFactory,
    SignatureLocalRepository> {
  
  SignatureLocalService({
    required SignatureFactory factory,
    required SignatureLocalRepository repository,
  }) {
    initialize(
      factory: factory,
      repository: repository,
    );
  }

  /// Récupère toutes les signatures pour une intervention donnée
  Future<List<SignatureDto>> findByInterventionId(String idIntervention) async {
    final results = await repository.getByInterventionId(idIntervention);
    return factory.toDataTransfertObjects(results);
  }
}

/// Provider Riverpod pour le service local des signatures
@Riverpod(keepAlive: true)
SignatureLocalService signatureLocalService(Ref ref) {
  final repository = ref.watch(signatureLocalRepositoryProvider);
  final factory = SignatureFactory.instance;
  return SignatureLocalService(
    factory: factory,
    repository: repository,
  );
}

