import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:field_service/src/models/dto/material/material_dto.dart';
import 'package:field_service/src/models/dto/timesheet/timesheet_dto.dart';
import 'package:field_service/src/models/dto/image/image_dto.dart';
import 'package:field_service/src/models/dto/document/document_dto.dart';
import 'package:field_service/src/models/dto/comment/comment_dto.dart';
import 'package:field_service/src/models/dto/signature/signature_dto.dart';

part 'intervention_complete.dto.freezed.dart';
part 'intervention_complete.dto.g.dart';

/// DTO pour une intervention complète avec toutes ses relations
/// Utilisé pour les réponses de synchronisation
@freezed
abstract class InterventionCompleteDto with _$InterventionCompleteDto {
  const factory InterventionCompleteDto({
    /// ID de l'intervention
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
    /// Liste des matériaux
    @Default([]) @JsonKey(name: 'materiels') List<MaterialDto> materiels,
    /// Liste des feuilles de temps
    @Default([]) List<TimesheetDto> timesheets,
    /// Liste des images
    @Default([]) List<ImageDto> images,
    /// Liste des documents
    @Default([]) List<DocumentDto> documents,
    /// Liste des commentaires
    @Default([]) List<CommentDto> comments,
    /// Liste des signatures
    @Default([]) List<SignatureDto> signatures,
  }) = _InterventionCompleteDto;

  factory InterventionCompleteDto.fromJson(Map<String, dynamic> json) =>
      _$InterventionCompleteDtoFromJson(json);
}

