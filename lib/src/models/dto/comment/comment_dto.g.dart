// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => _CommentDto(
  localId: (json['localId'] as num?)?.toInt(),
  id: json['id'] as String?,
  message: json['message'] as String,
  attachmentData: json['attachmentData'] as String?,
  attachmentFilename: json['attachmentFilename'] as String?,
  idIntervention: json['idIntervention'] as String,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  date: json['date'] as String,
  isSync: json['isSync'] as bool? ?? false,
);

Map<String, dynamic> _$CommentDtoToJson(_CommentDto instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'message': instance.message,
      'attachmentData': instance.attachmentData,
      'attachmentFilename': instance.attachmentFilename,
      'idIntervention': instance.idIntervention,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'date': instance.date,
      'isSync': instance.isSync,
    };
