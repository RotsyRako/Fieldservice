// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_token.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserTokenDto {

 String get id; String get email; String get token; DateTime get createdAt; String get name;
/// Create a copy of UserTokenDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserTokenDtoCopyWith<UserTokenDto> get copyWith => _$UserTokenDtoCopyWithImpl<UserTokenDto>(this as UserTokenDto, _$identity);

  /// Serializes this UserTokenDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserTokenDto&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.token, token) || other.token == token)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,token,createdAt,name);

@override
String toString() {
  return 'UserTokenDto(id: $id, email: $email, token: $token, createdAt: $createdAt, name: $name)';
}


}

/// @nodoc
abstract mixin class $UserTokenDtoCopyWith<$Res>  {
  factory $UserTokenDtoCopyWith(UserTokenDto value, $Res Function(UserTokenDto) _then) = _$UserTokenDtoCopyWithImpl;
@useResult
$Res call({
 String id, String email, String token, DateTime createdAt, String name
});




}
/// @nodoc
class _$UserTokenDtoCopyWithImpl<$Res>
    implements $UserTokenDtoCopyWith<$Res> {
  _$UserTokenDtoCopyWithImpl(this._self, this._then);

  final UserTokenDto _self;
  final $Res Function(UserTokenDto) _then;

/// Create a copy of UserTokenDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? token = null,Object? createdAt = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserTokenDto].
extension UserTokenDtoPatterns on UserTokenDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserTokenDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserTokenDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserTokenDto value)  $default,){
final _that = this;
switch (_that) {
case _UserTokenDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserTokenDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserTokenDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email,  String token,  DateTime createdAt,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserTokenDto() when $default != null:
return $default(_that.id,_that.email,_that.token,_that.createdAt,_that.name);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email,  String token,  DateTime createdAt,  String name)  $default,) {final _that = this;
switch (_that) {
case _UserTokenDto():
return $default(_that.id,_that.email,_that.token,_that.createdAt,_that.name);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email,  String token,  DateTime createdAt,  String name)?  $default,) {final _that = this;
switch (_that) {
case _UserTokenDto() when $default != null:
return $default(_that.id,_that.email,_that.token,_that.createdAt,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserTokenDto implements UserTokenDto {
  const _UserTokenDto({required this.id, required this.email, required this.token, required this.createdAt, required this.name});
  factory _UserTokenDto.fromJson(Map<String, dynamic> json) => _$UserTokenDtoFromJson(json);

@override final  String id;
@override final  String email;
@override final  String token;
@override final  DateTime createdAt;
@override final  String name;

/// Create a copy of UserTokenDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserTokenDtoCopyWith<_UserTokenDto> get copyWith => __$UserTokenDtoCopyWithImpl<_UserTokenDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserTokenDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserTokenDto&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.token, token) || other.token == token)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,token,createdAt,name);

@override
String toString() {
  return 'UserTokenDto(id: $id, email: $email, token: $token, createdAt: $createdAt, name: $name)';
}


}

/// @nodoc
abstract mixin class _$UserTokenDtoCopyWith<$Res> implements $UserTokenDtoCopyWith<$Res> {
  factory _$UserTokenDtoCopyWith(_UserTokenDto value, $Res Function(_UserTokenDto) _then) = __$UserTokenDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String email, String token, DateTime createdAt, String name
});




}
/// @nodoc
class __$UserTokenDtoCopyWithImpl<$Res>
    implements _$UserTokenDtoCopyWith<$Res> {
  __$UserTokenDtoCopyWithImpl(this._self, this._then);

  final _UserTokenDto _self;
  final $Res Function(_UserTokenDto) _then;

/// Create a copy of UserTokenDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? token = null,Object? createdAt = null,Object? name = null,}) {
  return _then(_UserTokenDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
