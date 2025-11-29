import 'package:drift/drift.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/base_local.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'document_local.repository.g.dart';

// Les types $DocumentsTable et Document sont générés dans app_database.g.dart
// qui est un part de app_database.dart, donc ils sont accessibles via app_database.dart

/// Repository local pour la gestion des documents
class DocumentLocalRepository extends BaseLocalRepository<$DocumentsTable, Document> {
  DocumentLocalRepository(super.database);

  @override
  TableInfo<$DocumentsTable, Document> get table => db.documents;

  /// Récupère tous les documents pour une intervention donnée
  Future<List<Document>> getByInterventionId(String idIntervention) async {
    final query = db.select(table)
      ..where((tbl) => tbl.idIntervention.equals(idIntervention));
    return await query.get();
  }
}

/// Provider Riverpod pour le repository local des documents
@Riverpod(keepAlive: true)
DocumentLocalRepository documentLocalRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return DocumentLocalRepository(database);
}

