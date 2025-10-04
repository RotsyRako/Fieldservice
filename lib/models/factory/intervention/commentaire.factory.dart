import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:drift/drift.dart';

import 'package:arkup_edoo/models/dto/intervention/commentaire.dto.dart';

class CommentaireFactory extends BaseFactory<CommentaireDOData, CommentaireDTO, CommentaireDOCompanion> {
  static final CommentaireFactory _instance = CommentaireFactory._internal();
  factory CommentaireFactory() => _instance;
  CommentaireFactory._internal();
  static CommentaireFactory get instance => _instance;

  @override
  CommentaireDOData toDomainObject(CommentaireDTO dto) {
    return CommentaireDOData(
        localId: dto.localId!,
        id: dto.id!,
        user: dto.user,
        comment: dto.comment,
        date: dto.date,
        idIntervention: dto.idIntervention,
        pj: dto.pj
    );
  }

  @override
  CommentaireDTO toDataTransfertObject(CommentaireDOData data) {
    return CommentaireDTO(
        localId: data.localId,
        id: data.id,
        user: data.user,
        comment: data.comment,
        date: data.date,
        idIntervention: data.idIntervention,
        pj: data.pj
    );
  }

  @override
  CommentaireDOCompanion toCompanion(CommentaireDTO dto, {bool includeId = false}) {
    return CommentaireDOCompanion(
      localId: includeId && dto.localId != null ? Value(dto.localId!) : const Value.absent(),
      id: Value(dto.id),
      user: Value(dto.user),
      comment: Value(dto.comment),
      date: Value(dto.date),
      idIntervention: Value(dto.idIntervention),
      pj: Value(dto.pj),
    );
  }
}
