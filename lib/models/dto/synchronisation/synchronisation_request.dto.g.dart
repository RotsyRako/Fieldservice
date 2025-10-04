// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synchronisation_request.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SynchrositionRequestDTO _$SynchrositionRequestDTOFromJson(
  Map<String, dynamic> json,
) => _SynchrositionRequestDTO(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => SynchrositionDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$SynchrositionRequestDTOToJson(
  _SynchrositionRequestDTO instance,
) => <String, dynamic>{
  if (instance.data?.map((e) => e.toJson()).toList() case final value?)
    'data': value,
};
