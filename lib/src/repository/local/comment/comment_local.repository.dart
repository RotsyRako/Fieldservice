import 'package:drift/drift.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/base_local.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_local.repository.g.dart';

// Les types $CommentsTable et Comment sont générés dans app_database.g.dart
// qui est un part de app_database.dart, donc ils sont accessibles via app_database.dart

/// Repository local pour la gestion des commentaires
class CommentLocalRepository extends BaseLocalRepository<$CommentsTable, Comment> {
  CommentLocalRepository(super.database);

  @override
  TableInfo<$CommentsTable, Comment> get table => db.comments;

  /// Récupère tous les commentaires pour une intervention donnée
  Future<List<Comment>> getByInterventionId(String idIntervention) async {
    final query = db.select(table)
      ..where((tbl) => tbl.idIntervention.equals(idIntervention));
    return await query.get();
  }
}

/// Provider Riverpod pour le repository local des commentaires
@Riverpod(keepAlive: true)
CommentLocalRepository commentLocalRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return CommentLocalRepository(database);
}

