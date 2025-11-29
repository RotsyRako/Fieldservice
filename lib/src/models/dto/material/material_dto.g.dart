// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaterialDto _$MaterialDtoFromJson(Map<String, dynamic> json) => _MaterialDto(
  localId: (json['localId'] as num?)?.toInt(),
  id: json['id'] as String?,
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toInt(),
  idIntervention: json['idIntervention'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  isSync: json['isSync'] as bool? ?? false,
);

Map<String, dynamic> _$MaterialDtoToJson(_MaterialDto instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
      'idIntervention': instance.idIntervention,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isSync': instance.isSync,
    };
