// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_complete.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterventionCompleteDto _$InterventionCompleteDtoFromJson(
  Map<String, dynamic> json,
) => _InterventionCompleteDto(
  id: json['id'] as String?,
  titre: json['titre'] as String,
  dateStart: json['dateStart'] as String,
  dateEnd: json['dateEnd'] as String,
  status: (json['status'] as num).toInt(),
  priority: json['priority'] as String,
  customer: json['customer'] as String,
  long: (json['long'] as num).toDouble(),
  lat: (json['lat'] as num).toDouble(),
  distance: (json['distance'] as num).toDouble(),
  description: json['description'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  userId: json['userId'] as String,
  materiels:
      (json['materiels'] as List<dynamic>?)
          ?.map((e) => MaterialDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  timesheets:
      (json['timesheets'] as List<dynamic>?)
          ?.map((e) => TimesheetDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => ImageDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  documents:
      (json['documents'] as List<dynamic>?)
          ?.map((e) => DocumentDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  comments:
      (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  signatures:
      (json['signatures'] as List<dynamic>?)
          ?.map((e) => SignatureDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$InterventionCompleteDtoToJson(
  _InterventionCompleteDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'titre': instance.titre,
  'dateStart': instance.dateStart,
  'dateEnd': instance.dateEnd,
  'status': instance.status,
  'priority': instance.priority,
  'customer': instance.customer,
  'long': instance.long,
  'lat': instance.lat,
  'distance': instance.distance,
  'description': instance.description,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'userId': instance.userId,
  'materiels': instance.materiels,
  'timesheets': instance.timesheets,
  'images': instance.images,
  'documents': instance.documents,
  'comments': instance.comments,
  'signatures': instance.signatures,
};
