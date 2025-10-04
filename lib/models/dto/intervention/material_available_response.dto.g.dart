// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_available_response.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaterialAvailableResponseDto _$MaterialAvailableResponseDtoFromJson(
  Map<String, dynamic> json,
) => _MaterialAvailableResponseDto(
  success: json['success'] as bool,
  message: json['message'] as String,
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => MaterialAvailableDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$MaterialAvailableResponseDtoToJson(
  _MaterialAvailableResponseDto instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
