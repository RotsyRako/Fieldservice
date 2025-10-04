import 'package:freezed_annotation/freezed_annotation.dart';

part 'commentaire.dto.freezed.dart';
part 'commentaire.dto.g.dart';

@freezed
abstract class CommentaireDTO with _$CommentaireDTO {
  const factory CommentaireDTO({
    int? localId,
    int? id,
    required String user,
    required String comment,
    required DateTime date,
    required int idIntervention,
    String? pj,
  }) = _CommentaireDTO;

  factory CommentaireDTO.fromJson(Map<String, dynamic> json) => _$CommentaireDTOFromJson(json);
}
