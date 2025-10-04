import 'package:freezed_annotation/freezed_annotation.dart';

part 'document.dto.freezed.dart';
part 'document.dto.g.dart';

@freezed
abstract class DocumentDTO with _$DocumentDTO {
  const factory DocumentDTO({
    int? localId,
    int? id,
    required String name,
    required String location,
    required int idIntervention,
  }) = _DocumentDTO;

  factory DocumentDTO.fromJson(Map<String, dynamic> json) => _$DocumentDTOFromJson(json);
}
