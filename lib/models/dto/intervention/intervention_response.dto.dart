
import 'package:freezed_annotation/freezed_annotation.dart';

import 'intervention.dto.dart';

part 'intervention_response.dto.freezed.dart';
part 'intervention_response.dto.g.dart';

@freezed
abstract class InterventionResponseDto with _$InterventionResponseDto {
  const factory InterventionResponseDto({
    required bool success,
    required String message,
    List<InterventionDTO>? data,
  }) = _InterventionResponseDto;

  factory InterventionResponseDto.fromJson(Map<String, dynamic> json) =>
      _$InterventionResponseDtoFromJson(json);
}
