import 'package:drift/drift.dart';
import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:arkup_edoo/models/dto/intervention/material_available.dto.dart';

class MaterialAvailableFactory extends BaseFactory<MaterialAvailableDOData, MaterialAvailableDTO, MaterialAvailableDOCompanion> {
  static final MaterialAvailableFactory _instance = MaterialAvailableFactory._internal();
  factory MaterialAvailableFactory() => _instance;
  MaterialAvailableFactory._internal();
  static MaterialAvailableFactory get instance => _instance;

  @override
  MaterialAvailableDOData toDomainObject(MaterialAvailableDTO dto) {
    return MaterialAvailableDOData(
      id: dto.id!,
      localId: dto.localId!,
      name: dto.name,
      quantity: dto.quantity
    );
  }

  @override
  MaterialAvailableDTO toDataTransfertObject(MaterialAvailableDOData data) {
    return MaterialAvailableDTO(
      localId: data.localId,
      id: data.id,
      name: data.name,
      quantity: data.quantity
    );
  }

  @override
  MaterialAvailableDOCompanion toCompanion(MaterialAvailableDTO dto, {bool includeId = false}) {
    return MaterialAvailableDOCompanion(
      localId: includeId && dto.localId != null ? Value(dto.localId!) : const Value.absent(),
      id: Value(dto.id),
      name: Value(dto.name),
      quantity: Value(dto.quantity)
    );
  }
}
