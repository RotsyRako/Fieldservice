import 'package:drift/drift.dart';
import 'package:field_service/src/models/dto/material/material_dto.dart';
import 'package:field_service/src/models/factory/base.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';

class MaterialFactory extends BaseFactory<Material, MaterialDto, MaterialsCompanion> {
  static final MaterialFactory _instance = MaterialFactory._internal();

  factory MaterialFactory() => _instance;
  
  MaterialFactory._internal();
  
  static MaterialFactory get instance => _instance;

  @override
  Material toDomainObject(MaterialDto dto) {
    return Material(
      localId: dto.localId ?? 0,
      id: dto.id,
      name: dto.name,
      quantity: dto.quantity,
      idIntervention: dto.idIntervention,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      isSync: dto.isSync,
    );
  }

  @override
  MaterialDto toDataTransfertObject(Material data) {
    return MaterialDto(
      localId: data.localId,
      id: data.id,
      name: data.name,
      quantity: data.quantity,
      idIntervention: data.idIntervention,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      isSync: data.isSync,
    );
  }

  @override
  MaterialsCompanion toCompanion(MaterialDto dto, {bool includeId = false}) {
    return MaterialsCompanion(
      localId: includeId && dto.localId != null
          ? Value(dto.localId!)
          : const Value.absent(),
      id: dto.id != null ? Value(dto.id!) : const Value.absent(),
      name: Value(dto.name),
      quantity: Value(dto.quantity),
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

