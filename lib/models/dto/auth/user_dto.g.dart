// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDto _$UserDtoFromJson(Map<String, dynamic> json) => _UserDto(
  userId: (json['userId'] as num).toInt(),
  email: json['email'] as String,
  name: json['name'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$UserDtoToJson(_UserDto instance) => <String, dynamic>{
  'userId': instance.userId,
  'email': instance.email,
  'name': instance.name,
  'token': instance.token,
};
