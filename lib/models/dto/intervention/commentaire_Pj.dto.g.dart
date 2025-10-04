// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentaire_Pj.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentairePjDTO _$CommentairePjDTOFromJson(Map<String, dynamic> json) =>
    _CommentairePjDTO(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$CommentairePjDTOToJson(_CommentairePjDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
    };
