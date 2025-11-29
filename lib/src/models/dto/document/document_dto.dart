import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_dto.freezed.dart';
part 'document_dto.g.dart';

/// DTO (Data Transfer Object) pour les documents
@freezed
abstract class DocumentDto with _$DocumentDto {
  const factory DocumentDto({
    /// ID local (peut être null si le document n'a pas encore été sauvegardé localement)
    int? localId,
    /// ID du serveur (peut être null si le document n'a pas encore été synchronisé)
    String? id,
    /// Nom du fichier
    required String filename,
    /// Données du document encodées en base64
    required String data,
    /// ID de l'intervention associée
    required String idIntervention,
    /// Date de création
    DateTime? createdAt,
    /// Date de mise à jour
    DateTime? updatedAt,
    /// Indique si le document est synchronisé avec le serveur
    @Default(false) bool isSync,
  }) = _DocumentDto;

  factory DocumentDto.fromJson(Map<String, dynamic> json) =>
      _$DocumentDtoFromJson(json);
}

