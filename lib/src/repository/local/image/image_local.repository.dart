import 'package:drift/drift.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/base_local.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_local.repository.g.dart';

// Les types $ImagesTable et Image sont générés dans app_database.g.dart
// qui est un part de app_database.dart, donc ils sont accessibles via app_database.dart

/// Repository local pour la gestion des images
class ImageLocalRepository extends BaseLocalRepository<$ImagesTable, Image> {
  ImageLocalRepository(super.database);

  @override
  TableInfo<$ImagesTable, Image> get table => db.images;

  /// Récupère toutes les images pour une intervention donnée
  Future<List<Image>> getByInterventionId(String idIntervention) async {
    final query = db.select(table)
      ..where((tbl) => tbl.idIntervention.equals(idIntervention));
    return await query.get();
  }
}

/// Provider Riverpod pour le repository local des images
@Riverpod(keepAlive: true)
ImageLocalRepository imageLocalRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return ImageLocalRepository(database);
}

