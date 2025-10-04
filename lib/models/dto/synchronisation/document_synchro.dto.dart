import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_synchro.dto.freezed.dart';
part 'document_synchro.dto.g.dart';

@freezed
abstract class DocumentSynchroDTO with _$DocumentSynchroDTO {
  const factory DocumentSynchroDTO({
    required String filename,
    required String data,
  }) = _DocumentSynchroDTO;

  factory DocumentSynchroDTO.fromJson(Map<String, dynamic> json) => _$DocumentSynchroDTOFromJson(json);
}
