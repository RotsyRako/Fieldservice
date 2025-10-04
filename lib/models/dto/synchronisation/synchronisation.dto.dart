import 'package:arkup_edoo/models/dto/synchronisation/comment_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/document_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/material_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/photo_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/signature_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/timesheet_synchro.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'synchronisation.dto.freezed.dart';
part 'synchronisation.dto.g.dart';

@freezed
abstract class SynchrositionDTO with _$SynchrositionDTO {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory SynchrositionDTO({
    int? id,
    int? status,
    SignatureSynchro? signature,
    List<MaterialSynchroDTO>? materials,
    List<TimesheetSynchroDTO>? timesheets,
    @JsonKey(name: 'images') List<PhotoSynchroDTO>? photos,
    List<DocumentSynchroDTO>? documents,
    List<CommentSynchroDTO>? comments,
  }) = _SynchrositionDTO;

  factory SynchrositionDTO.fromJson(Map<String, dynamic> json) =>
      _$SynchrositionDTOFromJson(json);
}
