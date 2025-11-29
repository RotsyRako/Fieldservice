// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentDto {

/// ID local (peut être null si le document n'a pas encore été sauvegardé localement)
 int? get localId;/// ID du serveur (peut être null si le document n'a pas encore été synchronisé)
 String? get id;/// Nom du fichier
 String get filename;/// Données du document encodées en base64
 String get data;/// ID de l'intervention associée
 String get idIntervention;/// Date de création
 DateTime? get createdAt;/// Date de mise à jour
 DateTime? get updatedAt;/// Indique si le document est synchronisé avec le serveur
 bool get isSync;
/// Create a copy of DocumentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentDtoCopyWith<DocumentDto> get copyWith => _$DocumentDtoCopyWithImpl<DocumentDto>(this as DocumentDto, _$identity);

  /// Serializes this DocumentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,filename,data,idIntervention,createdAt,updatedAt,isSync);

@override
String toString() {
  return 'DocumentDto(localId: $localId, id: $id, filename: $filename, data: $data, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $DocumentDtoCopyWith<$Res>  {
  factory $DocumentDtoCopyWith(DocumentDto value, $Res Function(DocumentDto) _then) = _$DocumentDtoCopyWithImpl;
@useResult
$Res call({
 int? localId, String? id, String filename, String data, String idIntervention, DateTime? createdAt, DateTime? updatedAt, bool isSync
});




}
/// @nodoc
class _$DocumentDtoCopyWithImpl<$Res>
    implements $DocumentDtoCopyWith<$Res> {
  _$DocumentDtoCopyWithImpl(this._self, this._then);

  final DocumentDto _self;
  final $Res Function(DocumentDto) _then;

/// Create a copy of DocumentDto
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


/// Adds pattern-matching-related methods to [DocumentDto].
extension DocumentDtoPatterns on DocumentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DocumentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DocumentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DocumentDto value)  $default,){
final _that = this;
switch (_that) {
case _DocumentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DocumentDto value)?  $default,){
final _that = this;
switch (_that) {
case _DocumentDto() when $default != null:
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
case _DocumentDto() when $default != null:
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
case _DocumentDto():
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
case _DocumentDto() when $default != null:
return $default(_that.localId,_that.id,_that.filename,_that.data,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DocumentDto implements DocumentDto {
  const _DocumentDto({this.localId, this.id, required this.filename, required this.data, required this.idIntervention, this.createdAt, this.updatedAt, this.isSync = false});
  factory _DocumentDto.fromJson(Map<String, dynamic> json) => _$DocumentDtoFromJson(json);

/// ID local (peut être null si le document n'a pas encore été sauvegardé localement)
@override final  int? localId;
/// ID du serveur (peut être null si le document n'a pas encore été synchronisé)
@override final  String? id;
/// Nom du fichier
@override final  String filename;
/// Données du document encodées en base64
@override final  String data;
/// ID de l'intervention associée
@override final  String idIntervention;
/// Date de création
@override final  DateTime? createdAt;
/// Date de mise à jour
@override final  DateTime? updatedAt;
/// Indique si le document est synchronisé avec le serveur
@override@JsonKey() final  bool isSync;

/// Create a copy of DocumentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentDtoCopyWith<_DocumentDto> get copyWith => __$DocumentDtoCopyWithImpl<_DocumentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,filename,data,idIntervention,createdAt,updatedAt,isSync);

@override
String toString() {
  return 'DocumentDto(localId: $localId, id: $id, filename: $filename, data: $data, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$DocumentDtoCopyWith<$Res> implements $DocumentDtoCopyWith<$Res> {
  factory _$DocumentDtoCopyWith(_DocumentDto value, $Res Function(_DocumentDto) _then) = __$DocumentDtoCopyWithImpl;
@override @useResult
$Res call({
 int? localId, String? id, String filename, String data, String idIntervention, DateTime? createdAt, DateTime? updatedAt, bool isSync
});




}
/// @nodoc
class __$DocumentDtoCopyWithImpl<$Res>
    implements _$DocumentDtoCopyWith<$Res> {
  __$DocumentDtoCopyWithImpl(this._self, this._then);

  final _DocumentDto _self;
  final $Res Function(_DocumentDto) _then;

/// Create a copy of DocumentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? filename = null,Object? data = null,Object? idIntervention = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isSync = null,}) {
  return _then(_DocumentDto(
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
