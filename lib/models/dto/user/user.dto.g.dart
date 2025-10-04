// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDTO _$UserDTOFromJson(Map<String, dynamic> json) => _UserDTO(
  localId: (json['localId'] as num?)?.toInt(),
  id: (json['id'] as num?)?.toInt(),
  email: json['email'] as String,
  name: json['name'] as String,
  password: json['password'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$UserDTOToJson(_UserDTO instance) => <String, dynamic>{
  'localId': instance.localId,
  'id': instance.id,
  'email': instance.email,
  'name': instance.name,
  'password': instance.password,
  'token': instance.token,
};
