import 'package:drift/drift.dart';
import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';

class TempsInterventionFactory extends BaseFactory<TempsInterventionDOData, TempsInterventionDTO, TempsInterventionDOCompanion> {
  static final TempsInterventionFactory _instance = TempsInterventionFactory._internal();
  factory TempsInterventionFactory() => _instance;
  TempsInterventionFactory._internal();
  static TempsInterventionFactory get instance => _instance;

  @override
  TempsInterventionDOData toDomainObject(TempsInterventionDTO dto) {
    return TempsInterventionDOData(
      id: dto.id!,
      localId: dto.localId!,
      date: dto.date,
      temps: dto.temps,
      description: dto.description,
      idIntervention: dto.idIntervention,
    );
  }

  @override
  TempsInterventionDTO toDataTransfertObject(TempsInterventionDOData data) {
    return TempsInterventionDTO(
      localId: data.localId,
      id: data.id,
      date: data.date,
      temps: data.temps,
      description: data.description,
      idIntervention: data.idIntervention,
    );
  }

  @override
  TempsInterventionDOCompanion toCompanion(TempsInterventionDTO dto, {bool includeId = false}) {
    return TempsInterventionDOCompanion(
      localId: includeId && dto.localId != null ? Value(dto.localId!) : const Value.absent(),
      id: Value(dto.id),
      date: Value(dto.date),
      temps: Value(dto.temps),
      description: Value(dto.description),
      idIntervention: Value(dto.idIntervention),
    );
  }
}
