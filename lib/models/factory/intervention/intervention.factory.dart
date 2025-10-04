import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:arkup_edoo/models/constant/timer_status.enum.dart';
import 'package:drift/drift.dart';

class InterventionFactory extends BaseFactory<InterventionDOData, InterventionDTO, InterventionDOCompanion> {

  static final InterventionFactory _instance = InterventionFactory._internal();

  factory InterventionFactory() => _instance;
  InterventionFactory._internal();
  static InterventionFactory get instance => _instance;

  @override
  InterventionDOData toDomainObject(InterventionDTO dto) {
    return InterventionDOData(
          localId: dto.localId!,
          id: dto.id!,
          title: dto.title,
          dateStart: dto.dateStart,
          dateEnd: dto.dateEnd,
          status: dto.status,
          priority: dto.priority,
          customer: dto.customer,
          long: dto.long,
          lat: dto.lat,
          address: dto.address,
          description: dto.description,
          telephone: dto.telephone ?? "",
          distance: dto.distance,
          signature: dto.signature,
          isSync: dto.isSync,
          timerStatus: dto.timerStatus != null ? TimerStatus.values[dto.timerStatus!] : null,
          elapsedSeconds: dto.elapsedSeconds
      );
  }

  @override
  InterventionDTO toDataTransfertObject(InterventionDOData data) {
    return InterventionDTO(
      localId: data.localId,
      id: data.id,
      title: data.title,
      dateStart: data.dateStart,
      dateEnd: data.dateEnd,
      status: data.status,
      priority: data.priority,
      customer: data.customer,
      long: data.long,
      lat: data.lat,
      address: data.address,
      description: data.description,
      telephone: data.telephone,
      distance: data.distance,
      signature: data.signature,
      isSync: data.isSync,
      timerStatus: data.timerStatus?.index,
      elapsedSeconds: data.elapsedSeconds
    );
  }

  @override
  InterventionDOCompanion toCompanion(InterventionDTO dto, {bool includeId = false}) {
    return InterventionDOCompanion(
      localId: includeId && dto.localId != null ? Value(dto.localId!) : const Value.absent(),
      id: Value(dto.id),
      title: Value(dto.title),
      dateStart: Value(dto.dateStart),
      dateEnd: Value(dto.dateEnd),
      status: Value(dto.status),
      priority: Value(dto.priority),
      customer: Value(dto.customer),
      long: Value(dto.long),
      lat: Value(dto.lat),
      address: Value(dto.address),
      description: Value(dto.description),
      telephone: Value(dto.telephone ?? ""),
      distance: Value(dto.distance),
      signature: dto.signature != null ? Value(dto.signature!) : const Value(null),
      isSync: Value(dto.isSync),
      timerStatus: Value(dto.timerStatus != null ? TimerStatus.values[dto.timerStatus!] : null),
      elapsedSeconds: Value(dto.elapsedSeconds)
    );
  }
}
