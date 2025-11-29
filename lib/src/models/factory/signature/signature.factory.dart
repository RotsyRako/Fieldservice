import 'package:drift/drift.dart';
import 'package:field_service/src/models/dto/signature/signature_dto.dart';
import 'package:field_service/src/models/factory/base.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';

class SignatureFactory extends BaseFactory<Signature, SignatureDto, SignaturesCompanion> {
  static final SignatureFactory _instance = SignatureFactory._internal();

  factory SignatureFactory() => _instance;
  
  SignatureFactory._internal();
  
  static SignatureFactory get instance => _instance;

  @override
  Signature toDomainObject(SignatureDto dto) {
    return Signature(
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
  SignatureDto toDataTransfertObject(Signature data) {
    return SignatureDto(
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
  SignaturesCompanion toCompanion(SignatureDto dto, {bool includeId = false}) {
    return SignaturesCompanion(
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

