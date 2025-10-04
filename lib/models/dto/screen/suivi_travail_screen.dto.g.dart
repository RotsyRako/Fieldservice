// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suivi_travail_screen.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SuiviScreenDTO _$SuiviScreenDTOFromJson(Map<String, dynamic> json) =>
    _SuiviScreenDTO(
      tempsIntervention:
          (json['tempsIntervention'] as List<dynamic>?)
              ?.map(
                (e) => TempsInterventionDTO.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      photos:
          (json['photos'] as List<dynamic>?)
              ?.map((e) => PhotoDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      documents:
          (json['documents'] as List<dynamic>?)
              ?.map((e) => DocumentDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      comments:
          (json['comments'] as List<dynamic>?)
              ?.map((e) => CommentaireDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
      materials:
          (json['materials'] as List<dynamic>?)
              ?.map((e) => MaterialDTO.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$SuiviScreenDTOToJson(_SuiviScreenDTO instance) =>
    <String, dynamic>{
      'tempsIntervention': instance.tempsIntervention,
      'photos': instance.photos,
      'documents': instance.documents,
      'comments': instance.comments,
      'materials': instance.materials,
    };
