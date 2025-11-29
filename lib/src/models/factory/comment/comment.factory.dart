import 'package:drift/drift.dart';
import 'package:field_service/src/models/dto/comment/comment_dto.dart';
import 'package:field_service/src/models/factory/base.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';

class CommentFactory extends BaseFactory<Comment, CommentDto, CommentsCompanion> {
  static final CommentFactory _instance = CommentFactory._internal();

  factory CommentFactory() => _instance;
  
  CommentFactory._internal();
  
  static CommentFactory get instance => _instance;

  @override
  Comment toDomainObject(CommentDto dto) {
    return Comment(
      localId: dto.localId ?? 0,
      id: dto.id,
      message: dto.message,
      attachmentData: dto.attachmentData,
      attachmentFilename: dto.attachmentFilename,
      idIntervention: dto.idIntervention,
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt,
      date: dto.date,
      isSync: dto.isSync,
    );
  }

  @override
  CommentDto toDataTransfertObject(Comment data) {
    return CommentDto(
      localId: data.localId,
      id: data.id,
      message: data.message,
      attachmentData: data.attachmentData,
      attachmentFilename: data.attachmentFilename,
      idIntervention: data.idIntervention,
      createdAt: data.createdAt,
      updatedAt: data.updatedAt,
      date: data.date,
      isSync: data.isSync,
    );
  }

  @override
  CommentsCompanion toCompanion(CommentDto dto, {bool includeId = false}) {
    return CommentsCompanion(
      localId: includeId && dto.localId != null
          ? Value(dto.localId!)
          : const Value.absent(),
      id: dto.id != null ? Value(dto.id!) : const Value.absent(),
      message: Value(dto.message),
      attachmentData: dto.attachmentData != null
          ? Value(dto.attachmentData!)
          : const Value.absent(),
      attachmentFilename: dto.attachmentFilename != null
          ? Value(dto.attachmentFilename!)
          : const Value.absent(),
      idIntervention: Value(dto.idIntervention),
      createdAt: dto.createdAt != null
          ? Value(dto.createdAt!)
          : const Value.absent(),
      updatedAt: dto.updatedAt != null
          ? Value(dto.updatedAt!)
          : const Value.absent(),
      date: Value(dto.date),
      isSync: Value(dto.isSync),
    );
  }
}

