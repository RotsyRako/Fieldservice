import 'package:drift/drift.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/base_local.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'intervention_local.repository.g.dart';

// Les types $InterventionsTable et Intervention sont générés dans app_database.g.dart
// qui est un part de app_database.dart, donc ils sont accessibles via app_database.dart

/// Repository local pour la gestion des interventions
class InterventionLocalRepository extends BaseLocalRepository<$InterventionsTable, Intervention> {
  InterventionLocalRepository(super.database);

  @override
  TableInfo<$InterventionsTable, Intervention> get table => db.interventions;
}

/// Provider Riverpod pour le repository local des interventions
@Riverpod(keepAlive: true)
InterventionLocalRepository interventionLocalRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return InterventionLocalRepository(database);
}
