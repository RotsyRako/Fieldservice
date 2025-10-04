import 'package:drift/drift.dart';
import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:arkup_edoo/models/dto/intervention/photo.dto.dart';

class PhotoFactory extends BaseFactory<PhotoDOData, PhotoDTO, PhotoDOCompanion> {
  static final PhotoFactory _instance = PhotoFactory._internal();
  factory PhotoFactory() => _instance;
  PhotoFactory._internal();
  static PhotoFactory get instance => _instance;

  @override
  PhotoDOData toDomainObject(PhotoDTO dto) {
    return PhotoDOData(
      id: dto.id!,
      localId: dto.localId!,
      name: dto.name,
      location: dto.location,
      idIntervention: dto.idIntervention,
    );
  }

  @override
  PhotoDTO toDataTransfertObject(PhotoDOData data) {
    return PhotoDTO(
      localId: data.localId,
      id: data.id,
      name: data.name,
      location: data.location,
      idIntervention: data.idIntervention,
    );
  }

  @override
  PhotoDOCompanion toCompanion(PhotoDTO dto, {bool includeId = false}) {
    return PhotoDOCompanion(
      localId: includeId && dto.localId != null ? Value(dto.localId!) : const Value.absent(),
      id: Value(dto.id),
      name: Value(dto.name),
      location: Value(dto.location),
      idIntervention: Value(dto.idIntervention),
    );
  }
}
