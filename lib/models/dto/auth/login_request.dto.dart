import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request.dto.freezed.dart';
part 'login_request.dto.g.dart';

@freezed
abstract class LoginRequestDTO with _$LoginRequestDTO {
  const factory LoginRequestDTO({
    required String email,
    required String password,
  }) = _LoginRequestDTO;

  factory LoginRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDTOFromJson(json);
}
