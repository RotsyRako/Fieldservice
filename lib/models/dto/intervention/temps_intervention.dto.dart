import 'package:freezed_annotation/freezed_annotation.dart';

part 'temps_intervention.dto.freezed.dart';
part 'temps_intervention.dto.g.dart';

@freezed
abstract class TempsInterventionDTO with _$TempsInterventionDTO {
  const factory TempsInterventionDTO({
    int? localId,
    int? id,
    required String date,
    required String temps,
    required String description,
    required int idIntervention,
  }) = _TempsInterventionDTO;

  factory TempsInterventionDTO.fromJson(Map<String, dynamic> json) =>
      _$TempsInterventionDTOFromJson(json);
}
