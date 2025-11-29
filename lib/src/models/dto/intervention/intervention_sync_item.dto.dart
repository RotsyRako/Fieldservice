import 'package:freezed_annotation/freezed_annotation.dart';

part 'intervention_sync_item.dto.freezed.dart';
part 'intervention_sync_item.dto.g.dart';

/// DTO pour un item d'intervention à synchroniser dans la requête
@freezed
abstract class InterventionSyncItemDto with _$InterventionSyncItemDto {
  const factory InterventionSyncItemDto({
    /// ID de l'intervention à synchroniser
    required String id,
    /// Statut de l'intervention (1=planifié, 2=en cours, 3=terminé)
    required int status,
    /// Liste des matériaux
    @Default([]) List<Map<String, dynamic>> materials,
    /// Liste des feuilles de temps
    @Default([]) List<Map<String, dynamic>> timesheets,
    /// Liste des images
    @Default([]) List<Map<String, dynamic>> images,
    /// Liste des documents
    @Default([]) List<Map<String, dynamic>> documents,
    /// Signature (objet ou null)
    Map<String, dynamic>? signature,
    /// Liste des commentaires
    @Default([]) List<Map<String, dynamic>> comments,
  }) = _InterventionSyncItemDto;

  factory InterventionSyncItemDto.fromJson(Map<String, dynamic> json) =>
      _$InterventionSyncItemDtoFromJson(json);
}

