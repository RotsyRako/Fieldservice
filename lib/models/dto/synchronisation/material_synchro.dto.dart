import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_synchro.dto.freezed.dart';
part 'material_synchro.dto.g.dart';

@freezed
abstract class MaterialSynchroDTO with _$MaterialSynchroDTO {
  const factory MaterialSynchroDTO({
    required int id,
    required String name,
    required double quantity,
  }) = _MaterialSynchroDTO;

  factory MaterialSynchroDTO.fromJson(Map<String, dynamic> json) => _$MaterialSynchroDTOFromJson(json);
}
