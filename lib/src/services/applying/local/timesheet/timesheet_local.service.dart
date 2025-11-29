import 'package:field_service/src/models/dto/timesheet/timesheet_dto.dart';
import 'package:field_service/src/models/factory/timesheet/timesheet.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/timesheet/timesheet_local.repository.dart';
import 'package:field_service/src/services/applying/local/base_local.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timesheet_local.service.g.dart';

/// Service local pour la gestion des feuilles de temps
/// 
/// Fournit les opérations CRUD au niveau service avec conversion entre DTOs et DOs.
class TimesheetLocalService extends BaseLocalService<
    $TimesheetsTable,
    Timesheet,
    TimesheetDto,
    TimesheetsCompanion,
    TimesheetFactory,
    TimesheetLocalRepository> {
  
  TimesheetLocalService({
    required TimesheetFactory factory,
    required TimesheetLocalRepository repository,
  }) {
    initialize(
      factory: factory,
      repository: repository,
    );
  }

  /// Récupère toutes les feuilles de temps pour une intervention donnée
  Future<List<TimesheetDto>> findByInterventionId(String idIntervention) async {
    final results = await repository.getByInterventionId(idIntervention);
    return factory.toDataTransfertObjects(results);
  }
}

/// Provider Riverpod pour le service local des feuilles de temps
@Riverpod(keepAlive: true)
TimesheetLocalService timesheetLocalService(Ref ref) {
  final repository = ref.watch(timesheetLocalRepositoryProvider);
  final factory = TimesheetFactory.instance;
  return TimesheetLocalService(
    factory: factory,
    repository: repository,
  );
}

