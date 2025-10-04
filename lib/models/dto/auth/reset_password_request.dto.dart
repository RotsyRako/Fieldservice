import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_request.dto.freezed.dart';
part 'reset_password_request.dto.g.dart';

@freezed
abstract class ResetPasswordRequestDTO with _$ResetPasswordRequestDTO {
  const factory ResetPasswordRequestDTO({
    required String email,
  }) = _ResetPasswordRequestDTO;

  factory ResetPasswordRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordRequestDTOFromJson(json);
}
