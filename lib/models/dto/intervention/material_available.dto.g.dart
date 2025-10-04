// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_available.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaterialAvailableDTO _$MaterialAvailableDTOFromJson(
  Map<String, dynamic> json,
) => _MaterialAvailableDTO(
  localId: (json['localId'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toDouble(),
);

Map<String, dynamic> _$MaterialAvailableDTOToJson(
  _MaterialAvailableDTO instance,
) => <String, dynamic>{
  'localId': instance.localId,
  'id': instance.id,
  'name': instance.name,
  'quantity': instance.quantity,
};
