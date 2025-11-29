import 'package:drift/drift.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/base_local.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_local.repository.g.dart';

// Les types $MaterialsTable et Material sont générés dans app_database.g.dart
// qui est un part de app_database.dart, donc ils sont accessibles via app_database.dart

/// Repository local pour la gestion des matériaux
class MaterialLocalRepository extends BaseLocalRepository<$MaterialsTable, Material> {
  MaterialLocalRepository(super.database);

  @override
  TableInfo<$MaterialsTable, Material> get table => db.materials;

  /// Récupère tous les matériaux pour une intervention donnée
  Future<List<Material>> getByInterventionId(String idIntervention) async {
    final query = db.select(table)
      ..where((tbl) => tbl.idIntervention.equals(idIntervention));
    return await query.get();
  }
}

/// Provider Riverpod pour le repository local des matériaux
@Riverpod(keepAlive: true)
MaterialLocalRepository materialLocalRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return MaterialLocalRepository(database);
}

