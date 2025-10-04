import 'package:arkup_edoo/models/dto/synchronisation/synchronisation.dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'synchronisation_request.dto.freezed.dart';
part 'synchronisation_request.dto.g.dart';

@freezed
abstract class SynchrositionRequestDTO with _$SynchrositionRequestDTO {
  @JsonSerializable(includeIfNull: false, explicitToJson: true)
  const factory SynchrositionRequestDTO({
    List<SynchrositionDTO>? data,
  }) = _SynchrositionRequestDTO;

  factory SynchrositionRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$SynchrositionRequestDTOFromJson(json);
}
