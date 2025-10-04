// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_synchro.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MaterialSynchroDTO _$MaterialSynchroDTOFromJson(Map<String, dynamic> json) =>
    _MaterialSynchroDTO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
    );

Map<String, dynamic> _$MaterialSynchroDTOToJson(_MaterialSynchroDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'quantity': instance.quantity,
    };
