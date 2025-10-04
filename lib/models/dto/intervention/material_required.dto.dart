import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_required.dto.freezed.dart';
part 'material_required.dto.g.dart';

@freezed
abstract class MaterialRequiredDTO with _$MaterialRequiredDTO {
  const factory MaterialRequiredDTO({
    int? localId,
    int? id,
    required String name,
    int? idIntervention,
  }) = _MaterialRequiredDTO;

  factory MaterialRequiredDTO.fromJson(Map<String, dynamic> json) => _$MaterialRequiredDTOFromJson(json);
}
