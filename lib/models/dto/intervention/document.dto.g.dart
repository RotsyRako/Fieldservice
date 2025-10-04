// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DocumentDTO _$DocumentDTOFromJson(Map<String, dynamic> json) => _DocumentDTO(
  localId: (json['localId'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  location: json['location'] as String,
  idIntervention: (json['idIntervention'] as num).toInt(),
  isSync: json['isSync'] as bool?,
);

Map<String, dynamic> _$DocumentDTOToJson(_DocumentDTO instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'idIntervention': instance.idIntervention,
      'isSync': instance.isSync,
    };
