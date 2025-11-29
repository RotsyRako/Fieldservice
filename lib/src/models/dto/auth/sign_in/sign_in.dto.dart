import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in.dto.freezed.dart';
part 'sign_in.dto.g.dart';

/// DTO (Data Transfer Object) pour les interventions
@freezed
abstract class SignInDto with _$SignInDto {
  const factory SignInDto({
    /// Token d'accès
    required String email,
    /// Mot de passe
    required String password,
  }) = _SignInDto;

  factory SignInDto.fromJson(Map<String, dynamic> json) =>
      _$SignInDtoFromJson(json);
}
