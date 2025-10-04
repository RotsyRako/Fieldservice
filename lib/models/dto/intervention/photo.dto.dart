import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.dto.freezed.dart';
part 'photo.dto.g.dart';

@freezed
abstract class PhotoDTO with _$PhotoDTO {
  const factory PhotoDTO({
    int? localId,
    int? id,
    required String name,
    required String location,
    required int idIntervention,
  }) = _PhotoDTO;

  factory PhotoDTO.fromJson(Map<String, dynamic> json) => _$PhotoDTOFromJson(json);
}
