import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_pj_synchro.dto.freezed.dart';
part 'comment_pj_synchro.dto.g.dart';

@freezed
abstract class CommentPjSynchroDTO with _$CommentPjSynchroDTO {
  const factory CommentPjSynchroDTO({
    required String filename,
    required String data,
  }) = _CommentPjSynchroDTO;

  factory CommentPjSynchroDTO.fromJson(Map<String, dynamic> json) => _$CommentPjSynchroDTOFromJson(json);
}
