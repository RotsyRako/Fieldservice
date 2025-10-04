import 'package:freezed_annotation/freezed_annotation.dart';

part 'material.dto.freezed.dart';
part 'material.dto.g.dart';

@freezed
abstract class MaterialDTO with _$MaterialDTO {
  const factory MaterialDTO({
    int? localId,
    int? id,
    required String name,
    required double quantity,
    int? idIntervention,
  }) = _MaterialDTO;

  factory MaterialDTO.fromJson(Map<String, dynamic> json) => _$MaterialDTOFromJson(json);
}
