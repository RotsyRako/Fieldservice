import 'package:drift/drift.dart';
import 'package:field_service/src/models/dto/timesheet/timesheet_dto.dart';
import 'package:field_service/src/models/factory/base.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';

class TimesheetFactory extends BaseFactory<Timesheet, TimesheetDto, TimesheetsCompanion> {
  static final TimesheetFactory _instance = TimesheetFactory._internal();

  factory TimesheetFactory() => _instance;
  
  TimesheetFactory._internal();
  
  static TimesheetFactory get instance => _instance;

  @override
  Timesheet toDomainObject(TimesheetDto dto) {
    return Timesheet(
      localId: dto.localId ?? 0,
      id: dto.id,
      description: dto.description,
      timeAllocated: dto.timeAllocated,
      date: dto.date,
      idIntervention: dto.idIntervention,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      isSync: dto.isSync,
    );
  }

  @override
  TimesheetDto toDataTransfertObject(Timesheet data) {
    // Vérifier que les champs requis ne sont pas null
    if (data.description.isEmpty || data.date.isEmpty || data.idIntervention.isEmpty) {
      throw Exception('Données invalides dans Timesheet: description, date ou idIntervention est vide');
    }
    
    return TimesheetDto(
      localId: data.localId,
      id: data.id,
      description: data.description,
      timeAllocated: data.timeAllocated,
      date: data.date,
      idIntervention: data.idIntervention,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      isSync: data.isSync,
    );
  }

  @override
  TimesheetsCompanion toCompanion(TimesheetDto dto, {bool includeId = false}) {
    return TimesheetsCompanion(
      localId: includeId && dto.localId != null
          ? Value(dto.localId!)
          : const Value.absent(),
      id: dto.id != null ? Value(dto.id!) : const Value.absent(),
      description: Value(dto.description),
      timeAllocated: Value(dto.timeAllocated),
      date: Value(dto.date),
      idIntervention: Value(dto.idIntervention),
      createdAt: dto.createdAt != null
          ? Value(dto.createdAt!)
          : const Value.absent(),
      updatedAt: dto.updatedAt != null
          ? Value(dto.updatedAt!)
          : const Value.absent(),
      isSync: Value(dto.isSync),
    );
  }
}

