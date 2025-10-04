// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentaire.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentaireDTO _$CommentaireDTOFromJson(Map<String, dynamic> json) =>
    _CommentaireDTO(
      localId: (json['localId'] as num?)?.toInt(),
      id: (json['id'] as num?)?.toInt(),
      user: json['user'] as String,
      comment: json['comment'] as String,
      date: DateTime.parse(json['date'] as String),
      idIntervention: (json['idIntervention'] as num).toInt(),
      pj: json['pj'] as String?,
      isSync: json['isSync'] as bool?,
    );

Map<String, dynamic> _$CommentaireDTOToJson(_CommentaireDTO instance) =>
    <String, dynamic>{
      'localId': instance.localId,
      'id': instance.id,
      'user': instance.user,
      'comment': instance.comment,
      'date': instance.date.toIso8601String(),
      'idIntervention': instance.idIntervention,
      'pj': instance.pj,
      'isSync': instance.isSync,
    };
