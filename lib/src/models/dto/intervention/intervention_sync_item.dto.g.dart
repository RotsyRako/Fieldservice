// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_sync_item.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterventionSyncItemDto _$InterventionSyncItemDtoFromJson(
  Map<String, dynamic> json,
) => _InterventionSyncItemDto(
  id: json['id'] as String,
  status: (json['status'] as num).toInt(),
  materials:
      (json['materials'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  timesheets:
      (json['timesheets'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  documents:
      (json['documents'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
  signature: json['signature'] as Map<String, dynamic>?,
  comments:
      (json['comments'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList() ??
      const [],
);

Map<String, dynamic> _$InterventionSyncItemDtoToJson(
  _InterventionSyncItemDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'status': instance.status,
  'materials': instance.materials,
  'timesheets': instance.timesheets,
  'images': instance.images,
  'documents': instance.documents,
  'signature': instance.signature,
  'comments': instance.comments,
};
