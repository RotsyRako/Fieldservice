import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_token.dto.freezed.dart';
part 'user_token.dto.g.dart';

@freezed
abstract class UserTokenDto with _$UserTokenDto {
  const factory UserTokenDto({
    required String id,
    required String email,
    required String token,
    required DateTime createdAt,
    required String name,
  }) = _UserTokenDto;

  factory UserTokenDto.fromJson(Map<String, dynamic> json) =>
      _$UserTokenDtoFromJson(json);
}

