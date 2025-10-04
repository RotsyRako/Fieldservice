import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.dto.freezed.dart';
part 'user.dto.g.dart';

@freezed
abstract class UserDTO with _$UserDTO {
  const factory UserDTO({
    int? localId,
    int? id,
    required String email,
    required String name,
    required String password,
    required String token,
  }) = _UserDTO;

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
}

