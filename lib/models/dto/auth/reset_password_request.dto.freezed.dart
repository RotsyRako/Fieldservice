// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_request.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResetPasswordRequestDTO {

 String get email;
/// Create a copy of ResetPasswordRequestDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResetPasswordRequestDTOCopyWith<ResetPasswordRequestDTO> get copyWith => _$ResetPasswordRequestDTOCopyWithImpl<ResetPasswordRequestDTO>(this as ResetPasswordRequestDTO, _$identity);

  /// Serializes this ResetPasswordRequestDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResetPasswordRequestDTO&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ResetPasswordRequestDTO(email: $email)';
}


}

/// @nodoc
abstract mixin class $ResetPasswordRequestDTOCopyWith<$Res>  {
  factory $ResetPasswordRequestDTOCopyWith(ResetPasswordRequestDTO value, $Res Function(ResetPasswordRequestDTO) _then) = _$ResetPasswordRequestDTOCopyWithImpl;
@useResult
$Res call({
 String email
});




}
/// @nodoc
class _$ResetPasswordRequestDTOCopyWithImpl<$Res>
    implements $ResetPasswordRequestDTOCopyWith<$Res> {
  _$ResetPasswordRequestDTOCopyWithImpl(this._self, this._then);

  final ResetPasswordRequestDTO _self;
  final $Res Function(ResetPasswordRequestDTO) _then;

/// Create a copy of ResetPasswordRequestDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ResetPasswordRequestDTO implements ResetPasswordRequestDTO {
  const _ResetPasswordRequestDTO({required this.email});
  factory _ResetPasswordRequestDTO.fromJson(Map<String, dynamic> json) => _$ResetPasswordRequestDTOFromJson(json);

@override final  String email;

/// Create a copy of ResetPasswordRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResetPasswordRequestDTOCopyWith<_ResetPasswordRequestDTO> get copyWith => __$ResetPasswordRequestDTOCopyWithImpl<_ResetPasswordRequestDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResetPasswordRequestDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetPasswordRequestDTO&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email);

@override
String toString() {
  return 'ResetPasswordRequestDTO(email: $email)';
}


}

/// @nodoc
abstract mixin class _$ResetPasswordRequestDTOCopyWith<$Res> implements $ResetPasswordRequestDTOCopyWith<$Res> {
  factory _$ResetPasswordRequestDTOCopyWith(_ResetPasswordRequestDTO value, $Res Function(_ResetPasswordRequestDTO) _then) = __$ResetPasswordRequestDTOCopyWithImpl;
@override @useResult
$Res call({
 String email
});




}
/// @nodoc
class __$ResetPasswordRequestDTOCopyWithImpl<$Res>
    implements _$ResetPasswordRequestDTOCopyWith<$Res> {
  __$ResetPasswordRequestDTOCopyWithImpl(this._self, this._then);

  final _ResetPasswordRequestDTO _self;
  final $Res Function(_ResetPasswordRequestDTO) _then;

/// Create a copy of ResetPasswordRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,}) {
  return _then(_ResetPasswordRequestDTO(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
