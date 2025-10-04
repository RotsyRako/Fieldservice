// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synchronisation.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SynchrositionDTO _$SynchrositionDTOFromJson(
  Map<String, dynamic> json,
) => _SynchrositionDTO(
  id: (json['id'] as num?)?.toInt(),
  status: (json['status'] as num?)?.toInt(),
  signature:
      json['signature'] == null
          ? null
          : SignatureSynchro.fromJson(
            json['signature'] as Map<String, dynamic>,
          ),
  materials:
      (json['materials'] as List<dynamic>?)
          ?.map((e) => MaterialSynchroDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
  timesheets:
      (json['timesheets'] as List<dynamic>?)
          ?.map((e) => TimesheetSynchroDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
  photos:
      (json['images'] as List<dynamic>?)
          ?.map((e) => PhotoSynchroDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
  documents:
      (json['documents'] as List<dynamic>?)
          ?.map((e) => DocumentSynchroDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
  comments:
      (json['comments'] as List<dynamic>?)
          ?.map((e) => CommentSynchroDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SynchrositionDTOToJson(
  _SynchrositionDTO instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.status case final value?) 'status': value,
  if (instance.signature?.toJson() case final value?) 'signature': value,
  if (instance.materials?.map((e) => e.toJson()).toList() case final value?)
    'materials': value,
  if (instance.timesheets?.map((e) => e.toJson()).toList() case final value?)
    'timesheets': value,
  if (instance.photos?.map((e) => e.toJson()).toList() case final value?)
    'images': value,
  if (instance.documents?.map((e) => e.toJson()).toList() case final value?)
    'documents': value,
  if (instance.comments?.map((e) => e.toJson()).toList() case final value?)
    'comments': value,
};
