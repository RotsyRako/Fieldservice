// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterventionDTO _$InterventionDTOFromJson(Map<String, dynamic> json) =>
    _InterventionDTO(
      localId: (json['localId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      dateStart: json['dateStart'] as String?,
      dateEnd: json['dateEnd'] as String?,
      status: (json['status'] as num).toInt(),
      priority: json['priority'] as String,
      description: json['description'] as String,
      customer: json['customer'] as String,
      long: (json['long'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      telephone: json['telephone'] as String?,
      address: json['address'] as String,
      distance: (json['distance'] as num).toDouble(),
      materialRequired:
          (json['materialRequired'] as List<dynamic>?)
              ?.map(
                (e) => MaterialRequiredDTO.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      signature: json['signature'] as String?,
      isSync: json['isSync'] as bool?,
      timerStatus: (json['timerStatus'] as num?)?.toInt(),
      elapsedSeconds: (json['elapsedSeconds'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InterventionDTOToJson(_InterventionDTO instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'title': instance.title,
      'dateStart': instance.dateStart,
      'dateEnd': instance.dateEnd,
      'status': instance.status,
      'priority': instance.priority,
      'description': instance.description,
      'customer': instance.customer,
      'long': instance.long,
      'lat': instance.lat,
      'telephone': instance.telephone,
      'address': instance.address,
      'distance': instance.distance,
      'materialRequired': instance.materialRequired,
      'signature': instance.signature,
      'isSync': instance.isSync,
      'timerStatus': instance.timerStatus,
      'elapsedSeconds': instance.elapsedSeconds,
    };
