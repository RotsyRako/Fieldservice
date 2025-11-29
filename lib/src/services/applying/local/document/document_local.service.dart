import 'package:field_service/src/models/dto/document/document_dto.dart';
import 'package:field_service/src/models/factory/document/document.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/document/document_local.repository.dart';
import 'package:field_service/src/services/applying/local/base_local.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'document_local.service.g.dart';

/// Service local pour la gestion des documents
/// 
/// Fournit les opérations CRUD au niveau service avec conversion entre DTOs et DOs.
class DocumentLocalService extends BaseLocalService<
    $DocumentsTable,
    Document,
    DocumentDto,
    DocumentsCompanion,
    DocumentFactory,
    DocumentLocalRepository> {
  
  DocumentLocalService({
    required DocumentFactory factory,
    required DocumentLocalRepository repository,
  }) {
    initialize(
      factory: factory,
      repository: repository,
    );
  }

  /// Récupère tous les documents pour une intervention donnée
  Future<List<DocumentDto>> findByInterventionId(String idIntervention) async {
    final results = await repository.getByInterventionId(idIntervention);
    return factory.toDataTransfertObjects(results);
  }
}

/// Provider Riverpod pour le service local des documents
@Riverpod(keepAlive: true)
DocumentLocalService documentLocalService(Ref ref) {
  final repository = ref.watch(documentLocalRepositoryProvider);
  final factory = DocumentFactory.instance;
  return DocumentLocalService(
    factory: factory,
    repository: repository,
  );
}

