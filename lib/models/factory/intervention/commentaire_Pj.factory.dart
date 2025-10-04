import 'package:drift/drift.dart';
import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:arkup_edoo/models/dto/intervention/commentaire_Pj.dto.dart';

class CommentairePjFactory extends BaseFactory<CommentairePjDOData, CommentairePjDTO, CommentairePjDOCompanion> {
  static final CommentairePjFactory _instance = CommentairePjFactory._internal();
  factory CommentairePjFactory() => _instance;
  CommentairePjFactory._internal();
  static CommentairePjFactory get instance => _instance;

  @override
  CommentairePjDOData toDomainObject(CommentairePjDTO dto) {
    return CommentairePjDOData(localId: dto.id, name: dto.name, location: dto.location);
  }

  @override
  CommentairePjDTO toDataTransfertObject(CommentairePjDOData data) {
    return CommentairePjDTO(id: data.id!, name: data.name, location: data.location);
  }

  @override
  CommentairePjDOCompanion toCompanion(CommentairePjDTO dto, {bool includeId = false}) {
    return CommentairePjDOCompanion(
      id: includeId ? Value(dto.id) : const Value.absent(),
      name: Value(dto.name),
      location: Value(dto.location),
    );
  }
}
