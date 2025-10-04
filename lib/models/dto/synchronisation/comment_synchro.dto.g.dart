// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_synchro.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CommentSynchroDTO _$CommentSynchroDTOFromJson(Map<String, dynamic> json) =>
    _CommentSynchroDTO(
      message: json['message'] as String,
      dateCreated: json['dateCreated'] as String,
      attachmentFiles:
          (json['attachmentFiles'] as List<dynamic>?)
              ?.map(
                (e) => CommentPjSynchroDTO.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$CommentSynchroDTOToJson(_CommentSynchroDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'dateCreated': instance.dateCreated,
      'attachmentFiles': instance.attachmentFiles,
    };
