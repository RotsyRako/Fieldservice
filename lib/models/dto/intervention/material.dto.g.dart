// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaterialDTO _$MaterialDTOFromJson(Map<String, dynamic> json) => _MaterialDTO(
  localId: (json['localId'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toDouble(),
  idIntervention: (json['idIntervention'] as num?)?.toInt(),
  isSync: json['isSync'] as bool?,
);

Map<String, dynamic> _$MaterialDTOToJson(_MaterialDTO instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'idIntervention': instance.idIntervention,
      'isSync': instance.isSync,
    };
