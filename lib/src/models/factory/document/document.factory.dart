import 'package:drift/drift.dart';
import 'package:field_service/src/models/dto/document/document_dto.dart';
import 'package:field_service/src/models/factory/base.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';

class DocumentFactory extends BaseFactory<Document, DocumentDto, DocumentsCompanion> {
  static final DocumentFactory _instance = DocumentFactory._internal();

  factory DocumentFactory() => _instance;
  
  DocumentFactory._internal();
  
  static DocumentFactory get instance => _instance;

  @override
  Document toDomainObject(DocumentDto dto) {
    return Document(
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
  DocumentDto toDataTransfertObject(Document data) {
    return DocumentDto(
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
  DocumentsCompanion toCompanion(DocumentDto dto, {bool includeId = false}) {
    return DocumentsCompanion(
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

