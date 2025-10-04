// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterventionResponseDto _$InterventionResponseDtoFromJson(
  Map<String, dynamic> json,
) => _InterventionResponseDto(
  success: json['success'] as bool,
  message: json['message'] as String,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => InterventionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$InterventionResponseDtoToJson(
  _InterventionResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
