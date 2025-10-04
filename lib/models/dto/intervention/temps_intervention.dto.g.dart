// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temps_intervention.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TempsInterventionDTO _$TempsInterventionDTOFromJson(
  Map<String, dynamic> json,
) => _TempsInterventionDTO(
  localId: (json['localId'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  date: json['date'] as String,
  temps: json['temps'] as String,
  description: json['description'] as String,
  idIntervention: (json['idIntervention'] as num).toInt(),
  isSync: json['isSync'] as bool?,
);

Map<String, dynamic> _$TempsInterventionDTOToJson(
  _TempsInterventionDTO instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'id': instance.id,
  'date': instance.date,
  'temps': instance.temps,
  'description': instance.description,
  'idIntervention': instance.idIntervention,
  'isSync': instance.isSync,
};
