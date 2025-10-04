// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_required.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaterialRequiredDTO _$MaterialRequiredDTOFromJson(Map<String, dynamic> json) =>
    _MaterialRequiredDTO(
      localId: (json['localId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String,
      idIntervention: (json['idIntervention'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MaterialRequiredDTOToJson(
  _MaterialRequiredDTO instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'id': instance.id,
  'name': instance.name,
  'idIntervention': instance.idIntervention,
};
