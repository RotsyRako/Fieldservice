// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimesheetDto _$TimesheetDtoFromJson(Map<String, dynamic> json) =>
    _TimesheetDto(
      localId: (json['localId'] as num?)?.toInt(),
      id: json['id'] as String?,
      description: json['description'] as String,
      timeAllocated: (json['timeAllocated'] as num).toDouble(),
      date: json['date'] as String,
      idIntervention: json['idIntervention'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isSync: json['isSync'] as bool? ?? false,
    );

Map<String, dynamic> _$TimesheetDtoToJson(_TimesheetDto instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'description': instance.description,
      'timeAllocated': instance.timeAllocated,
      'date': instance.date,
      'idIntervention': instance.idIntervention,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isSync': instance.isSync,
    };
