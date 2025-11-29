// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signature_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignatureDto {

/// ID local (peut être null si la signature n'a pas encore été sauvegardée localement)
 int? get localId;/// ID du serveur (peut être null si la signature n'a pas encore été synchronisée)
 String? get id;/// Nom du fichier
 String get filename;/// Données de la signature encodées en base64
 String get data;/// ID de l'intervention associée
 String get idIntervention;/// Date de création
 DateTime? get createdAt;/// Date de mise à jour
 DateTime? get updatedAt;/// Indique si la signature est synchronisée avec le serveur
 bool get isSync;
/// Create a copy of SignatureDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignatureDtoCopyWith<SignatureDto> get copyWith => _$SignatureDtoCopyWithImpl<SignatureDto>(this as SignatureDto, _$identity);

  /// Serializes this SignatureDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignatureDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,filename,data,idIntervention,createdAt,updatedAt,isSync);

@override
String toString() {
  return 'SignatureDto(localId: $localId, id: $id, filename: $filename, data: $data, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $SignatureDtoCopyWith<$Res>  {
  factory $SignatureDtoCopyWith(SignatureDto value, $Res Function(SignatureDto) _then) = _$SignatureDtoCopyWithImpl;
@useResult
$Res call({
 int? localId, String? id, String filename, String data, String idIntervention, DateTime? createdAt, DateTime? updatedAt, bool isSync
});




}
/// @nodoc
class _$SignatureDtoCopyWithImpl<$Res>
    implements $SignatureDtoCopyWith<$Res> {
  _$SignatureDtoCopyWithImpl(this._self, this._then);

  final SignatureDto _self;
  final $Res Function(SignatureDto) _then;

/// Create a copy of SignatureDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? filename = null,Object? data = null,Object? idIntervention = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isSync = null,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSync: null == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SignatureDto].
extension SignatureDtoPatterns on SignatureDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignatureDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignatureDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignatureDto value)  $default,){
final _that = this;
switch (_that) {
case _SignatureDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignatureDto value)?  $default,){
final _that = this;
switch (_that) {
case _SignatureDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? localId,  String? id,  String filename,  String data,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  bool isSync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignatureDto() when $default != null:
return $default(_that.localId,_that.id,_that.filename,_that.data,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? localId,  String? id,  String filename,  String data,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  bool isSync)  $default,) {final _that = this;
switch (_that) {
case _SignatureDto():
return $default(_that.localId,_that.id,_that.filename,_that.data,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? localId,  String? id,  String filename,  String data,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  bool isSync)?  $default,) {final _that = this;
switch (_that) {
case _SignatureDto() when $default != null:
return $default(_that.localId,_that.id,_that.filename,_that.data,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignatureDto implements SignatureDto {
  const _SignatureDto({this.localId, this.id, required this.filename, required this.data, required this.idIntervention, this.createdAt, this.updatedAt, this.isSync = false});
  factory _SignatureDto.fromJson(Map<String, dynamic> json) => _$SignatureDtoFromJson(json);

/// ID local (peut être null si la signature n'a pas encore été sauvegardée localement)
@override final  int? localId;
/// ID du serveur (peut être null si la signature n'a pas encore été synchronisée)
@override final  String? id;
/// Nom du fichier
@override final  String filename;
/// Données de la signature encodées en base64
@override final  String data;
/// ID de l'intervention associée
@override final  String idIntervention;
/// Date de création
@override final  DateTime? createdAt;
/// Date de mise à jour
@override final  DateTime? updatedAt;
/// Indique si la signature est synchronisée avec le serveur
@override@JsonKey() final  bool isSync;

/// Create a copy of SignatureDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignatureDtoCopyWith<_SignatureDto> get copyWith => __$SignatureDtoCopyWithImpl<_SignatureDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignatureDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignatureDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,filename,data,idIntervention,createdAt,updatedAt,isSync);

@override
String toString() {
  return 'SignatureDto(localId: $localId, id: $id, filename: $filename, data: $data, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$SignatureDtoCopyWith<$Res> implements $SignatureDtoCopyWith<$Res> {
  factory _$SignatureDtoCopyWith(_SignatureDto value, $Res Function(_SignatureDto) _then) = __$SignatureDtoCopyWithImpl;
@override @useResult
$Res call({
 int? localId, String? id, String filename, String data, String idIntervention, DateTime? createdAt, DateTime? updatedAt, bool isSync
});




}
/// @nodoc
class __$SignatureDtoCopyWithImpl<$Res>
    implements _$SignatureDtoCopyWith<$Res> {
  __$SignatureDtoCopyWithImpl(this._self, this._then);

  final _SignatureDto _self;
  final $Res Function(_SignatureDto) _then;

/// Create a copy of SignatureDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? filename = null,Object? data = null,Object? idIntervention = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isSync = null,}) {
  return _then(_SignatureDto(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSync: null == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
