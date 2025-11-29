import 'package:drift/drift.dart';
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/models/factory/base.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';

class InterventionFactory extends BaseFactory<Intervention, InterventionDto, InterventionsCompanion> {
  static final InterventionFactory _instance = InterventionFactory._internal();

  factory InterventionFactory() => _instance;
  
  InterventionFactory._internal();
  
  static InterventionFactory get instance => _instance;

  @override
  Intervention toDomainObject(InterventionDto dto) {
    return Intervention(
      localId: dto.localId ?? 0,
      id: dto.id,
      titre: dto.titre,
      dateStart: dto.dateStart,
      dateEnd: dto.dateEnd,
      status: dto.status,
      priority: dto.priority,
      customer: dto.customer,
      long: dto.long,
      lat: dto.lat,
      distance: dto.distance,
      description: dto.description,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      userId: dto.userId,
      isSync: dto.isSync,
    );
  }

  @override
  InterventionDto toDataTransfertObject(Intervention data) {
    return InterventionDto(
      localId: data.localId,
      id: data.id,
      titre: data.titre,
      dateStart: data.dateStart,
      dateEnd: data.dateEnd,
      status: data.status,
      priority: data.priority,
      customer: data.customer,
      long: data.long,
      lat: data.lat,
      distance: data.distance,
      description: data.description,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      userId: data.userId,
      isSync: data.isSync,
    );
  }

  @override
  InterventionsCompanion toCompanion(InterventionDto dto, {bool includeId = false}) {
    return InterventionsCompanion(
      localId: includeId && dto.localId != null
          ? Value(dto.localId!)
          : const Value.absent(),
      id: dto.id != null ? Value(dto.id!) : const Value.absent(),
      titre: Value(dto.titre),
      dateStart: Value(dto.dateStart),
      dateEnd: Value(dto.dateEnd),
      status: Value(dto.status),
      priority: Value(dto.priority),
      customer: Value(dto.customer),
      long: Value(dto.long),
      lat: Value(dto.lat),
      distance: Value(dto.distance),
      description: Value(dto.description),
      createdAt: dto.createdAt != null
          ? Value(dto.createdAt!)
          : const Value.absent(),
      updatedAt: dto.updatedAt != null
          ? Value(dto.updatedAt!)
          : const Value.absent(),
      userId: Value(dto.userId),
      isSync: Value(dto.isSync),
    );
  }
}

