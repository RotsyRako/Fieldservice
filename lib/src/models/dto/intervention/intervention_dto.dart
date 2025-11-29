import 'package:freezed_annotation/freezed_annotation.dart';

part 'intervention_dto.freezed.dart';
part 'intervention_dto.g.dart';

/// DTO (Data Transfer Object) pour les interventions
@freezed
abstract class InterventionDto with _$InterventionDto {
  const factory InterventionDto({
    /// ID local (peut être null si l'intervention n'a pas encore été sauvegardée localement)
    int? localId,
    /// ID du serveur (peut être null si l'intervention n'a pas encore été synchronisée)
    String? id,
    /// Titre de l'intervention
    required String titre,
    /// Date de début au format string
    required String dateStart,
    /// Date de fin au format string
    required String dateEnd,
    /// Statut de l'intervention (1=planifié, 2=en cours, 3=terminé)
    required int status,
    /// Priorité (haute, moyenne, basse)
    required String priority,
    /// Nom du client
    required String customer,
    /// Longitude
    required double long,
    /// Latitude
    required double lat,
    /// Distance en km
    required double distance,
    /// Description de l'intervention
    required String description,
    /// Date de création
    DateTime? createdAt,
    /// Date de mise à jour
    DateTime? updatedAt,
    /// ID de l'utilisateur
    required String userId,
    /// Indique si l'intervention est synchronisée avec le serveur
    @Default(false) bool isSync,
  }) = _InterventionDto;

  factory InterventionDto.fromJson(Map<String, dynamic> json) =>
      _$InterventionDtoFromJson(json);
}
