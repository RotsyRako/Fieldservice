import 'package:arkup_edoo/models/dto/intervention/material_required.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'material.dto.dart';

part 'intervention.dto.freezed.dart';
part 'intervention.dto.g.dart';

@freezed
abstract class InterventionDTO with _$InterventionDTO {
  const factory InterventionDTO({
    int? localId,
    int? id, 
    required String title,
    String? dateStart,
    String? dateEnd,
    required int status,
    required String priority, // La réponse envoie "0"/"1" comme String
    required String description,
    required String customer,
    required double long,
    required double lat,
    String? telephone,
    required String address,
    required double distance,
    List<MaterialRequiredDTO>? materialRequired,
    String? signature,
    bool? isSync,
    int? timerStatus,
    int? elapsedSeconds
  }) = _InterventionDTO;

  factory InterventionDTO.fromJson(Map<String, dynamic> json) =>
      _$InterventionDTOFromJson(json);

}
