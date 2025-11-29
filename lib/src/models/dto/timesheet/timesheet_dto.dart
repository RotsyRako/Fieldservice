import 'package:freezed_annotation/freezed_annotation.dart';

part 'timesheet_dto.freezed.dart';
part 'timesheet_dto.g.dart';

/// DTO (Data Transfer Object) pour les feuilles de temps
@freezed
abstract class TimesheetDto with _$TimesheetDto {
  const factory TimesheetDto({
    /// ID local (peut être null si la feuille de temps n'a pas encore été sauvegardée localement)
    int? localId,
    /// ID du serveur (peut être null si la feuille de temps n'a pas encore été synchronisée)
    String? id,
    /// Description du travail
    required String description,
    /// Temps alloué en heures
    required double timeAllocated,
    /// Date du travail
    required String date,
    /// ID de l'intervention associée
    required String idIntervention,
    /// Date de création
    DateTime? createdAt,
    /// Date de mise à jour
    DateTime? updatedAt,
    /// Indique si la feuille de temps est synchronisée avec le serveur
    @Default(false) bool isSync,
  }) = _TimesheetDto;

  factory TimesheetDto.fromJson(Map<String, dynamic> json) =>
      _$TimesheetDtoFromJson(json);
}

