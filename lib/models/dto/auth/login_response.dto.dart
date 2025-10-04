import 'package:arkup_edoo/models/dto/auth/user_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.dto.freezed.dart';
part 'login_response.dto.g.dart';

@freezed
abstract class LoginResponseDto with _$LoginResponseDto {
  const factory LoginResponseDto({
    required bool success,
    required String message,
    UserDto? data,
  }) = _LoginResponseDto;

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);
}
