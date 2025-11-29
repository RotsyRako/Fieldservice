import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_dto.freezed.dart';
part 'comment_dto.g.dart';

/// DTO (Data Transfer Object) pour les commentaires
@freezed
abstract class CommentDto with _$CommentDto {
  const factory CommentDto({
    /// ID local (peut être null si le commentaire n'a pas encore été sauvegardé localement)
    int? localId,
    /// ID du serveur (peut être null si le commentaire n'a pas encore été synchronisé)
    String? id,
    /// Message du commentaire
    required String message,
    /// Données de la pièce jointe encodées en base64
    String? attachmentData,
    /// Nom du fichier de la pièce jointe
    String? attachmentFilename,
    /// ID de l'intervention associée
    required String idIntervention,
    /// Date de création
    DateTime? createdAt,
    /// Date de mise à jour
    DateTime? updatedAt,
    /// Date du commentaire
    required String date,
    /// Indique si le commentaire est synchronisé avec le serveur
    @Default(false) bool isSync,
  }) = _CommentDto;

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);
}

