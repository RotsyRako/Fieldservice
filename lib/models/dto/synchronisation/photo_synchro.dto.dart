import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_synchro.dto.freezed.dart';
part 'photo_synchro.dto.g.dart';

@freezed
abstract class PhotoSynchroDTO with _$PhotoSynchroDTO {
  const factory PhotoSynchroDTO({
    required String filename,
    required String data,
  }) = _PhotoDTO;

  factory PhotoSynchroDTO.fromJson(Map<String, dynamic> json) => _$PhotoSynchroDTOFromJson(json);
}
