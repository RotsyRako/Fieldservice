import 'package:drift/drift.dart';
import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:arkup_edoo/models/dto/intervention/document.dto.dart';

class DocumentFactory extends BaseFactory<DocumentDOData, DocumentDTO, DocumentDOCompanion> {
  static final DocumentFactory _instance = DocumentFactory._internal();
  factory DocumentFactory() => _instance;
  DocumentFactory._internal();
  static DocumentFactory get instance => _instance;

  @override
  DocumentDOData toDomainObject(DocumentDTO dto) {
    return DocumentDOData(
      localId: dto.localId!,
      id: dto.id!,
      name: dto.name,
      location: dto.location,
      idIntervention: dto.idIntervention,
    );
  }

  @override
  DocumentDTO toDataTransfertObject(DocumentDOData data) {
    return DocumentDTO(
      localId: data.localId,
      id: data.id,
      name: data.name,
      location: data.location,
      idIntervention: data.idIntervention,
    );
  }

  @override
  DocumentDOCompanion toCompanion(DocumentDTO dto, {bool includeId = false}) {
    return DocumentDOCompanion(
      localId: includeId && dto.localId != null ? Value(dto.localId!) : const Value.absent(),
      id: Value(dto.id),
      name: Value(dto.name),
      location: Value(dto.location),
      idIntervention: Value(dto.idIntervention),
    );
  }
}
