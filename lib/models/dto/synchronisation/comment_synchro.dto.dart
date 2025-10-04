import 'package:arkup_edoo/models/dto/synchronisation/comment_pj_synchro.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_synchro.dto.freezed.dart';
part 'comment_synchro.dto.g.dart';

@freezed
abstract class CommentSynchroDTO with _$CommentSynchroDTO {
  const factory CommentSynchroDTO({
    required String message,
    required String dateCreated,
    List<CommentPjSynchroDTO>? attachmentFiles
  }) = _CommentSynchroDTO;

  factory CommentSynchroDTO.fromJson(Map<String, dynamic> json) => _$CommentSynchroDTOFromJson(json);
}
