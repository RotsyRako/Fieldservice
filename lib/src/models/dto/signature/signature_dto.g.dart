// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SignatureDto _$SignatureDtoFromJson(Map<String, dynamic> json) =>
    _SignatureDto(
      localId: (json['localId'] as num?)?.toInt(),
      id: json['id'] as String?,
      filename: json['filename'] as String,
      data: json['data'] as String,
      idIntervention: json['idIntervention'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      isSync: json['isSync'] as bool? ?? false,
    );

Map<String, dynamic> _$SignatureDtoToJson(_SignatureDto instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'filename': instance.filename,
      'data': instance.data,
      'idIntervention': instance.idIntervention,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'isSync': instance.isSync,
    };
