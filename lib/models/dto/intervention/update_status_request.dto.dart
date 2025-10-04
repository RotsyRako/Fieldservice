import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_status_request.dto.freezed.dart';
part 'update_status_request.dto.g.dart';

@freezed
abstract class UpdateStatusRequestDTO with _$UpdateStatusRequestDTO {
  const factory UpdateStatusRequestDTO({
    required int statusId,
    required int interventionId,
  }) = _UpdateStatusRequestDTO;

  factory UpdateStatusRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$UpdateStatusRequestDTOFromJson(json);
}
