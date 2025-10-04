import 'package:arkup_edoo/models/dto/intervention/commentaire.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/document.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/material.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/photo.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suivi_travail_screen.dto.freezed.dart';
part 'suivi_travail_screen.dto.g.dart';

@freezed
abstract class SuiviScreenDTO with _$SuiviScreenDTO {
  const factory SuiviScreenDTO({
    required List<TempsInterventionDTO>? tempsIntervention,
    required List<PhotoDTO>? photos,
    required List<DocumentDTO>? documents,
    required List<CommentaireDTO>? comments,
    required List<MaterialDTO>? materials,
    
  }) = _SuiviScreenDTO;

  factory SuiviScreenDTO.fromJson(Map<String, dynamic> json) =>
      _$SuiviScreenDTOFromJson(json);
}

