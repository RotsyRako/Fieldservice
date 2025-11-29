// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_sync_request.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterventionSyncRequestDto _$InterventionSyncRequestDtoFromJson(
  Map<String, dynamic> json,
) => _InterventionSyncRequestDto(
  data: (json['data'] as List<dynamic>)
      .map((e) => InterventionSyncItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$InterventionSyncRequestDtoToJson(
  _InterventionSyncRequestDto instance,
) => <String, dynamic>{'data': instance.data};
