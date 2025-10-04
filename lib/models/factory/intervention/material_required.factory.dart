import 'package:drift/drift.dart';
import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:arkup_edoo/models/dto/intervention/material_required.dto.dart';

class MaterialRequiredFactory extends BaseFactory<MaterialRequiredDOData, MaterialRequiredDTO, MaterialRequiredDOCompanion> {
  static final MaterialRequiredFactory _instance = MaterialRequiredFactory._internal();
  factory MaterialRequiredFactory() => _instance;
  MaterialRequiredFactory._internal();
  static MaterialRequiredFactory get instance => _instance;

  @override
  MaterialRequiredDOData toDomainObject(MaterialRequiredDTO dto) {
    return MaterialRequiredDOData(
      id: dto.id!,
      localId: dto.localId!,
      name: dto.name,
      idIntervention: dto.idIntervention ?? 0,
    );
  }

  @override
  MaterialRequiredDTO toDataTransfertObject(MaterialRequiredDOData data) {
    return MaterialRequiredDTO(
      localId: data.localId,
      id: data.id,
      name: data.name,
      idIntervention: data.idIntervention,
    );
  }

  @override
  MaterialRequiredDOCompanion toCompanion(MaterialRequiredDTO dto, {bool includeId = false}) {
    return MaterialRequiredDOCompanion(
      localId: includeId && dto.localId != null ? Value(dto.localId!) : const Value.absent(),
      id: Value(dto.id),
      name: Value(dto.name),
      idIntervention: Value(dto.idIntervention ?? 0),
    );
  }
}
