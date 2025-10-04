
import 'package:freezed_annotation/freezed_annotation.dart';

import 'material_available.dto.dart';

part 'material_available_response.dto.freezed.dart';
part 'material_available_response.dto.g.dart';

@freezed
abstract class MaterialAvailableResponseDto with _$MaterialAvailableResponseDto {
  const factory MaterialAvailableResponseDto({
    required bool success,
    required String message,
    List<MaterialAvailableDTO>? data,
  }) = _MaterialAvailableResponseDto;

  factory MaterialAvailableResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialAvailableResponseDtoFromJson(json);
}
