import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_dto.freezed.dart';
part 'image_dto.g.dart';

/// DTO (Data Transfer Object) pour les images
@freezed
abstract class ImageDto with _$ImageDto {
  const factory ImageDto({
    /// ID local (peut être null si l'image n'a pas encore été sauvegardée localement)
    int? localId,
    /// ID du serveur (peut être null si l'image n'a pas encore été synchronisée)
    String? id,
    /// Nom du fichier
    required String filename,
    /// Données de l'image encodées en base64
    required String data,
    /// ID de l'intervention associée
    required String idIntervention,
    /// Date de création
    DateTime? createdAt,
    /// Date de mise à jour
    DateTime? updatedAt,
    /// Indique si l'image est synchronisée avec le serveur
    @Default(false) bool isSync,
  }) = _ImageDto;

  factory ImageDto.fromJson(Map<String, dynamic> json) =>
      _$ImageDtoFromJson(json);
}

