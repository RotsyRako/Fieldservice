// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterventionDto _$InterventionDtoFromJson(Map<String, dynamic> json) =>
    _InterventionDto(
      localId: (json['localId'] as num?)?.toInt(),
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
      isSync: json['isSync'] as bool? ?? false,
    );

Map<String, dynamic> _$InterventionDtoToJson(_InterventionDto instance) =>
    <String, dynamic>{
      'localId': instance.localId,
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
      'isSync': instance.isSync,
    };
