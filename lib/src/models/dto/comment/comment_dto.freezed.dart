// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentDto {

/// ID local (peut être null si le commentaire n'a pas encore été sauvegardé localement)
 int? get localId;/// ID du serveur (peut être null si le commentaire n'a pas encore été synchronisé)
 String? get id;/// Message du commentaire
 String get message;/// Données de la pièce jointe encodées en base64
 String? get attachmentData;/// Nom du fichier de la pièce jointe
 String? get attachmentFilename;/// ID de l'intervention associée
 String get idIntervention;/// Date de création
 DateTime? get createdAt;/// Date de mise à jour
 DateTime? get updatedAt;/// Date du commentaire
 String get date;/// Indique si le commentaire est synchronisé avec le serveur
 bool get isSync;
/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentDtoCopyWith<CommentDto> get copyWith => _$CommentDtoCopyWithImpl<CommentDto>(this as CommentDto, _$identity);

  /// Serializes this CommentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.attachmentData, attachmentData) || other.attachmentData == attachmentData)&&(identical(other.attachmentFilename, attachmentFilename) || other.attachmentFilename == attachmentFilename)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.date, date) || other.date == date)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,message,attachmentData,attachmentFilename,idIntervention,createdAt,updatedAt,date,isSync);

@override
String toString() {
  return 'CommentDto(localId: $localId, id: $id, message: $message, attachmentData: $attachmentData, attachmentFilename: $attachmentFilename, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, date: $date, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $CommentDtoCopyWith<$Res>  {
  factory $CommentDtoCopyWith(CommentDto value, $Res Function(CommentDto) _then) = _$CommentDtoCopyWithImpl;
@useResult
$Res call({
 int? localId, String? id, String message, String? attachmentData, String? attachmentFilename, String idIntervention, DateTime? createdAt, DateTime? updatedAt, String date, bool isSync
});




}
/// @nodoc
class _$CommentDtoCopyWithImpl<$Res>
    implements $CommentDtoCopyWith<$Res> {
  _$CommentDtoCopyWithImpl(this._self, this._then);

  final CommentDto _self;
  final $Res Function(CommentDto) _then;

/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? message = null,Object? attachmentData = freezed,Object? attachmentFilename = freezed,Object? idIntervention = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? date = null,Object? isSync = null,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,attachmentData: freezed == attachmentData ? _self.attachmentData : attachmentData // ignore: cast_nullable_to_non_nullable
as String?,attachmentFilename: freezed == attachmentFilename ? _self.attachmentFilename : attachmentFilename // ignore: cast_nullable_to_non_nullable
as String?,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,isSync: null == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentDto].
extension CommentDtoPatterns on CommentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentDto value)  $default,){
final _that = this;
switch (_that) {
case _CommentDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentDto value)?  $default,){
final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? localId,  String? id,  String message,  String? attachmentData,  String? attachmentFilename,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  String date,  bool isSync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
return $default(_that.localId,_that.id,_that.message,_that.attachmentData,_that.attachmentFilename,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.date,_that.isSync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? localId,  String? id,  String message,  String? attachmentData,  String? attachmentFilename,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  String date,  bool isSync)  $default,) {final _that = this;
switch (_that) {
case _CommentDto():
return $default(_that.localId,_that.id,_that.message,_that.attachmentData,_that.attachmentFilename,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.date,_that.isSync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? localId,  String? id,  String message,  String? attachmentData,  String? attachmentFilename,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  String date,  bool isSync)?  $default,) {final _that = this;
switch (_that) {
case _CommentDto() when $default != null:
return $default(_that.localId,_that.id,_that.message,_that.attachmentData,_that.attachmentFilename,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.date,_that.isSync);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentDto implements CommentDto {
  const _CommentDto({this.localId, this.id, required this.message, this.attachmentData, this.attachmentFilename, required this.idIntervention, this.createdAt, this.updatedAt, required this.date, this.isSync = false});
  factory _CommentDto.fromJson(Map<String, dynamic> json) => _$CommentDtoFromJson(json);

/// ID local (peut être null si le commentaire n'a pas encore été sauvegardé localement)
@override final  int? localId;
/// ID du serveur (peut être null si le commentaire n'a pas encore été synchronisé)
@override final  String? id;
/// Message du commentaire
@override final  String message;
/// Données de la pièce jointe encodées en base64
@override final  String? attachmentData;
/// Nom du fichier de la pièce jointe
@override final  String? attachmentFilename;
/// ID de l'intervention associée
@override final  String idIntervention;
/// Date de création
@override final  DateTime? createdAt;
/// Date de mise à jour
@override final  DateTime? updatedAt;
/// Date du commentaire
@override final  String date;
/// Indique si le commentaire est synchronisé avec le serveur
@override@JsonKey() final  bool isSync;

/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentDtoCopyWith<_CommentDto> get copyWith => __$CommentDtoCopyWithImpl<_CommentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.message, message) || other.message == message)&&(identical(other.attachmentData, attachmentData) || other.attachmentData == attachmentData)&&(identical(other.attachmentFilename, attachmentFilename) || other.attachmentFilename == attachmentFilename)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.date, date) || other.date == date)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,message,attachmentData,attachmentFilename,idIntervention,createdAt,updatedAt,date,isSync);

@override
String toString() {
  return 'CommentDto(localId: $localId, id: $id, message: $message, attachmentData: $attachmentData, attachmentFilename: $attachmentFilename, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, date: $date, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$CommentDtoCopyWith<$Res> implements $CommentDtoCopyWith<$Res> {
  factory _$CommentDtoCopyWith(_CommentDto value, $Res Function(_CommentDto) _then) = __$CommentDtoCopyWithImpl;
@override @useResult
$Res call({
 int? localId, String? id, String message, String? attachmentData, String? attachmentFilename, String idIntervention, DateTime? createdAt, DateTime? updatedAt, String date, bool isSync
});




}
/// @nodoc
class __$CommentDtoCopyWithImpl<$Res>
    implements _$CommentDtoCopyWith<$Res> {
  __$CommentDtoCopyWithImpl(this._self, this._then);

  final _CommentDto _self;
  final $Res Function(_CommentDto) _then;

/// Create a copy of CommentDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? message = null,Object? attachmentData = freezed,Object? attachmentFilename = freezed,Object? idIntervention = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? date = null,Object? isSync = null,}) {
  return _then(_CommentDto(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,attachmentData: freezed == attachmentData ? _self.attachmentData : attachmentData // ignore: cast_nullable_to_non_nullable
as String?,attachmentFilename: freezed == attachmentFilename ? _self.attachmentFilename : attachmentFilename // ignore: cast_nullable_to_non_nullable
as String?,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,isSync: null == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
