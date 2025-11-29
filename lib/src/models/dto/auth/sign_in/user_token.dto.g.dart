// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTokenDto _$UserTokenDtoFromJson(Map<String, dynamic> json) =>
    _UserTokenDto(
      id: json['id'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserTokenDtoToJson(_UserTokenDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'token': instance.token,
      'createdAt': instance.createdAt.toIso8601String(),
      'name': instance.name,
    };
