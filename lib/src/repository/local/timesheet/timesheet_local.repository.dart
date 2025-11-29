import 'package:drift/drift.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/base_local.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timesheet_local.repository.g.dart';

// Les types $TimesheetsTable et Timesheet sont générés dans app_database.g.dart
// qui est un part de app_database.dart, donc ils sont accessibles via app_database.dart

/// Repository local pour la gestion des feuilles de temps
class TimesheetLocalRepository extends BaseLocalRepository<$TimesheetsTable, Timesheet> {
  TimesheetLocalRepository(super.database);

  @override
  TableInfo<$TimesheetsTable, Timesheet> get table => db.timesheets;

  /// Récupère toutes les feuilles de temps pour une intervention donnée
  Future<List<Timesheet>> getByInterventionId(String idIntervention) async {
    final query = db.select(table)
      ..where((tbl) => tbl.idIntervention.equals(idIntervention));
    return await query.get();
  }
}

/// Provider Riverpod pour le repository local des feuilles de temps
@Riverpod(keepAlive: true)
TimesheetLocalRepository timesheetLocalRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return TimesheetLocalRepository(database);
}

