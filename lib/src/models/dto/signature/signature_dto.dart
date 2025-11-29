import 'package:freezed_annotation/freezed_annotation.dart';

part 'signature_dto.freezed.dart';
part 'signature_dto.g.dart';

/// DTO (Data Transfer Object) pour les signatures
@freezed
abstract class SignatureDto with _$SignatureDto {
  const factory SignatureDto({
    /// ID local (peut être null si la signature n'a pas encore été sauvegardée localement)
    int? localId,
    /// ID du serveur (peut être null si la signature n'a pas encore été synchronisée)
    String? id,
    /// Nom du fichier
    required String filename,
    /// Données de la signature encodées en base64
    required String data,
    /// ID de l'intervention associée
    required String idIntervention,
    /// Date de création
    DateTime? createdAt,
    /// Date de mise à jour
    DateTime? updatedAt,
    /// Indique si la signature est synchronisée avec le serveur
    @Default(false) bool isSync,
  }) = _SignatureDto;

  factory SignatureDto.fromJson(Map<String, dynamic> json) =>
      _$SignatureDtoFromJson(json);
}

