// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PhotoDTO _$PhotoDTOFromJson(Map<String, dynamic> json) => _PhotoDTO(
  localId: (json['localId'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  location: json['location'] as String,
  idIntervention: (json['idIntervention'] as num).toInt(),
  isSync: json['isSync'] as bool?,
);

Map<String, dynamic> _$PhotoDTOToJson(_PhotoDTO instance) => <String, dynamic>{
  'localId': instance.localId,
  'id': instance.id,
  'name': instance.name,
  'location': instance.location,
  'idIntervention': instance.idIntervention,
  'isSync': instance.isSync,
};
