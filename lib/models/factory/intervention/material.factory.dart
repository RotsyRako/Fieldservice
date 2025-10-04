import 'package:drift/drift.dart';
import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:arkup_edoo/models/dto/intervention/material.dto.dart';

class MaterialFactory extends BaseFactory<MaterialDOData, MaterialDTO, MaterialDOCompanion> {
  static final MaterialFactory _instance = MaterialFactory._internal();
  factory MaterialFactory() => _instance;
  MaterialFactory._internal();
  static MaterialFactory get instance => _instance;

  @override
  MaterialDOData toDomainObject(MaterialDTO dto) {
    return MaterialDOData(
      id: dto.id!,
      localId: dto.localId!,
      name: dto.name,
      quantity: dto.quantity,
      idIntervention: dto.idIntervention ?? 0,
    );
  }

  @override
  MaterialDTO toDataTransfertObject(MaterialDOData data) {
    return MaterialDTO(
      localId: data.localId,
      id: data.id,
      name: data.name,
      quantity: data.quantity,
      idIntervention: data.idIntervention,
    );
  }

  @override
  MaterialDOCompanion toCompanion(MaterialDTO dto, {bool includeId = false}) {
    return MaterialDOCompanion(
      localId: includeId && dto.localId != null ? Value(dto.localId!) : const Value.absent(),
      id: Value(dto.id),
      name: Value(dto.name),
      quantity: Value(dto.quantity),
      idIntervention: Value(dto.idIntervention ?? 0),
    );
  }
}
