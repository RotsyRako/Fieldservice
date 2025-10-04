import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_available.dto.freezed.dart';
part 'material_available.dto.g.dart';

@freezed
abstract class MaterialAvailableDTO with _$MaterialAvailableDTO {
  const factory MaterialAvailableDTO({
    int? localId,
    int? id,
    required String name,
    required double quantity,
  }) = _MaterialAvailableDTO;

  factory MaterialAvailableDTO.fromJson(Map<String, dynamic> json) => _$MaterialAvailableDTOFromJson(json);
}
