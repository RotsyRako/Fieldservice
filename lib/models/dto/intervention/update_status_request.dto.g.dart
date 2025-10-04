// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_status_request.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateStatusRequestDTO _$UpdateStatusRequestDTOFromJson(
  Map<String, dynamic> json,
) => _UpdateStatusRequestDTO(
  statusId: (json['statusId'] as num).toInt(),
  interventionId: (json['interventionId'] as num).toInt(),
);

Map<String, dynamic> _$UpdateStatusRequestDTOToJson(
  _UpdateStatusRequestDTO instance,
) => <String, dynamic>{
  'statusId': instance.statusId,
  'interventionId': instance.interventionId,
};
