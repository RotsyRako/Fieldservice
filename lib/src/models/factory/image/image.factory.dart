import 'package:drift/drift.dart';
import 'package:field_service/src/models/dto/image/image_dto.dart';
import 'package:field_service/src/models/factory/base.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';

class ImageFactory extends BaseFactory<Image, ImageDto, ImagesCompanion> {
  static final ImageFactory _instance = ImageFactory._internal();

  factory ImageFactory() => _instance;
  
  ImageFactory._internal();
  
  static ImageFactory get instance => _instance;

  @override
  Image toDomainObject(ImageDto dto) {
    return Image(
      localId: dto.localId ?? 0,
      id: dto.id,
      filename: dto.filename,
      data: dto.data,
      idIntervention: dto.idIntervention,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      isSync: dto.isSync,
    );
  }

  @override
  ImageDto toDataTransfertObject(Image data) {
    return ImageDto(
      localId: data.localId,
      id: data.id,
      filename: data.filename,
      data: data.data,
      idIntervention: data.idIntervention,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      isSync: data.isSync,
    );
  }

  @override
  ImagesCompanion toCompanion(ImageDto dto, {bool includeId = false}) {
    return ImagesCompanion(
      localId: includeId && dto.localId != null
          ? Value(dto.localId!)
          : const Value.absent(),
      id: dto.id != null ? Value(dto.id!) : const Value.absent(),
      filename: Value(dto.filename),
      data: Value(dto.data),
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

