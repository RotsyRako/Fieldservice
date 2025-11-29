// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImageDto {

/// ID local (peut être null si l'image n'a pas encore été sauvegardée localement)
 int? get localId;/// ID du serveur (peut être null si l'image n'a pas encore été synchronisée)
 String? get id;/// Nom du fichier
 String get filename;/// Données de l'image encodées en base64
 String get data;/// ID de l'intervention associée
 String get idIntervention;/// Date de création
 DateTime? get createdAt;/// Date de mise à jour
 DateTime? get updatedAt;/// Indique si l'image est synchronisée avec le serveur
 bool get isSync;
/// Create a copy of ImageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageDtoCopyWith<ImageDto> get copyWith => _$ImageDtoCopyWithImpl<ImageDto>(this as ImageDto, _$identity);

  /// Serializes this ImageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,filename,data,idIntervention,createdAt,updatedAt,isSync);

@override
String toString() {
  return 'ImageDto(localId: $localId, id: $id, filename: $filename, data: $data, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $ImageDtoCopyWith<$Res>  {
  factory $ImageDtoCopyWith(ImageDto value, $Res Function(ImageDto) _then) = _$ImageDtoCopyWithImpl;
@useResult
$Res call({
 int? localId, String? id, String filename, String data, String idIntervention, DateTime? createdAt, DateTime? updatedAt, bool isSync
});




}
/// @nodoc
class _$ImageDtoCopyWithImpl<$Res>
    implements $ImageDtoCopyWith<$Res> {
  _$ImageDtoCopyWithImpl(this._self, this._then);

  final ImageDto _self;
  final $Res Function(ImageDto) _then;

/// Create a copy of ImageDto
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


/// Adds pattern-matching-related methods to [ImageDto].
extension ImageDtoPatterns on ImageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImageDto value)  $default,){
final _that = this;
switch (_that) {
case _ImageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImageDto value)?  $default,){
final _that = this;
switch (_that) {
case _ImageDto() when $default != null:
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
case _ImageDto() when $default != null:
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
case _ImageDto():
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
case _ImageDto() when $default != null:
return $default(_that.localId,_that.id,_that.filename,_that.data,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImageDto implements ImageDto {
  const _ImageDto({this.localId, this.id, required this.filename, required this.data, required this.idIntervention, this.createdAt, this.updatedAt, this.isSync = false});
  factory _ImageDto.fromJson(Map<String, dynamic> json) => _$ImageDtoFromJson(json);

/// ID local (peut être null si l'image n'a pas encore été sauvegardée localement)
@override final  int? localId;
/// ID du serveur (peut être null si l'image n'a pas encore été synchronisée)
@override final  String? id;
/// Nom du fichier
@override final  String filename;
/// Données de l'image encodées en base64
@override final  String data;
/// ID de l'intervention associée
@override final  String idIntervention;
/// Date de création
@override final  DateTime? createdAt;
/// Date de mise à jour
@override final  DateTime? updatedAt;
/// Indique si l'image est synchronisée avec le serveur
@override@JsonKey() final  bool isSync;

/// Create a copy of ImageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageDtoCopyWith<_ImageDto> get copyWith => __$ImageDtoCopyWithImpl<_ImageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImageDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,filename,data,idIntervention,createdAt,updatedAt,isSync);

@override
String toString() {
  return 'ImageDto(localId: $localId, id: $id, filename: $filename, data: $data, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$ImageDtoCopyWith<$Res> implements $ImageDtoCopyWith<$Res> {
  factory _$ImageDtoCopyWith(_ImageDto value, $Res Function(_ImageDto) _then) = __$ImageDtoCopyWithImpl;
@override @useResult
$Res call({
 int? localId, String? id, String filename, String data, String idIntervention, DateTime? createdAt, DateTime? updatedAt, bool isSync
});




}
/// @nodoc
class __$ImageDtoCopyWithImpl<$Res>
    implements _$ImageDtoCopyWith<$Res> {
  __$ImageDtoCopyWithImpl(this._self, this._then);

  final _ImageDto _self;
  final $Res Function(_ImageDto) _then;

/// Create a copy of ImageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? filename = null,Object? data = null,Object? idIntervention = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isSync = null,}) {
  return _then(_ImageDto(
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
