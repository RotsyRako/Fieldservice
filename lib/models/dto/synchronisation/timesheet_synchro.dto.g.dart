// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_synchro.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimesheetSynchroDTO _$TimesheetSynchroDTOFromJson(Map<String, dynamic> json) =>
    _TimesheetSynchroDTO(
      date: json['date'] as String,
      timeAllocated: (json['timeAllocated'] as num).toDouble(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$TimesheetSynchroDTOToJson(
  _TimesheetSynchroDTO instance,
) => <String, dynamic>{
  'date': instance.date,
  'timeAllocated': instance.timeAllocated,
  'description': instance.description,
};
