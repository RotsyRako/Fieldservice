import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_dto.freezed.dart';
part 'material_dto.g.dart';

/// DTO (Data Transfer Object) pour les matériaux
@freezed
abstract class MaterialDto with _$MaterialDto {
  const factory MaterialDto({
    /// ID local (peut être null si le matériau n'a pas encore été sauvegardé localement)
    int? localId,
    /// ID du serveur (peut être null si le matériau n'a pas encore été synchronisé)
    String? id,
    /// Nom du matériau
    required String name,
    /// Quantité
    required int quantity,
    /// ID de l'intervention associée
    required String idIntervention,
    /// Date de création
    DateTime? createdAt,
    /// Date de mise à jour
    DateTime? updatedAt,
    /// Indique si le matériau est synchronisé avec le serveur
    @Default(false) bool isSync,
  }) = _MaterialDto;

  factory MaterialDto.fromJson(Map<String, dynamic> json) =>
      _$MaterialDtoFromJson(json);
}

