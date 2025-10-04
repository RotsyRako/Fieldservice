import 'package:freezed_annotation/freezed_annotation.dart';

part 'commentaire_Pj.dto.freezed.dart';
part 'commentaire_Pj.dto.g.dart';

@freezed
abstract class CommentairePjDTO with _$CommentairePjDTO {
  const factory CommentairePjDTO({
    required int id,
    required String name,
    required String location,
  }) = _CommentairePjDTO;

  factory CommentairePjDTO.fromJson(Map<String, dynamic> json) => _$CommentairePjDTOFromJson(json);
}
