// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timesheet_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimesheetDto {

/// ID local (peut être null si la feuille de temps n'a pas encore été sauvegardée localement)
 int? get localId;/// ID du serveur (peut être null si la feuille de temps n'a pas encore été synchronisée)
 String? get id;/// Description du travail
 String get description;/// Temps alloué en heures
 double get timeAllocated;/// Date du travail
 String get date;/// ID de l'intervention associée
 String get idIntervention;/// Date de création
 DateTime? get createdAt;/// Date de mise à jour
 DateTime? get updatedAt;/// Indique si la feuille de temps est synchronisée avec le serveur
 bool get isSync;
/// Create a copy of TimesheetDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimesheetDtoCopyWith<TimesheetDto> get copyWith => _$TimesheetDtoCopyWithImpl<TimesheetDto>(this as TimesheetDto, _$identity);

  /// Serializes this TimesheetDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimesheetDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeAllocated, timeAllocated) || other.timeAllocated == timeAllocated)&&(identical(other.date, date) || other.date == date)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,description,timeAllocated,date,idIntervention,createdAt,updatedAt,isSync);

@override
String toString() {
  return 'TimesheetDto(localId: $localId, id: $id, description: $description, timeAllocated: $timeAllocated, date: $date, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $TimesheetDtoCopyWith<$Res>  {
  factory $TimesheetDtoCopyWith(TimesheetDto value, $Res Function(TimesheetDto) _then) = _$TimesheetDtoCopyWithImpl;
@useResult
$Res call({
 int? localId, String? id, String description, double timeAllocated, String date, String idIntervention, DateTime? createdAt, DateTime? updatedAt, bool isSync
});




}
/// @nodoc
class _$TimesheetDtoCopyWithImpl<$Res>
    implements $TimesheetDtoCopyWith<$Res> {
  _$TimesheetDtoCopyWithImpl(this._self, this._then);

  final TimesheetDto _self;
  final $Res Function(TimesheetDto) _then;

/// Create a copy of TimesheetDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? description = null,Object? timeAllocated = null,Object? date = null,Object? idIntervention = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isSync = null,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timeAllocated: null == timeAllocated ? _self.timeAllocated : timeAllocated // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSync: null == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TimesheetDto].
extension TimesheetDtoPatterns on TimesheetDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimesheetDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimesheetDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimesheetDto value)  $default,){
final _that = this;
switch (_that) {
case _TimesheetDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimesheetDto value)?  $default,){
final _that = this;
switch (_that) {
case _TimesheetDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? localId,  String? id,  String description,  double timeAllocated,  String date,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  bool isSync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimesheetDto() when $default != null:
return $default(_that.localId,_that.id,_that.description,_that.timeAllocated,_that.date,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? localId,  String? id,  String description,  double timeAllocated,  String date,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  bool isSync)  $default,) {final _that = this;
switch (_that) {
case _TimesheetDto():
return $default(_that.localId,_that.id,_that.description,_that.timeAllocated,_that.date,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? localId,  String? id,  String description,  double timeAllocated,  String date,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  bool isSync)?  $default,) {final _that = this;
switch (_that) {
case _TimesheetDto() when $default != null:
return $default(_that.localId,_that.id,_that.description,_that.timeAllocated,_that.date,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimesheetDto implements TimesheetDto {
  const _TimesheetDto({this.localId, this.id, required this.description, required this.timeAllocated, required this.date, required this.idIntervention, this.createdAt, this.updatedAt, this.isSync = false});
  factory _TimesheetDto.fromJson(Map<String, dynamic> json) => _$TimesheetDtoFromJson(json);

/// ID local (peut être null si la feuille de temps n'a pas encore été sauvegardée localement)
@override final  int? localId;
/// ID du serveur (peut être null si la feuille de temps n'a pas encore été synchronisée)
@override final  String? id;
/// Description du travail
@override final  String description;
/// Temps alloué en heures
@override final  double timeAllocated;
/// Date du travail
@override final  String date;
/// ID de l'intervention associée
@override final  String idIntervention;
/// Date de création
@override final  DateTime? createdAt;
/// Date de mise à jour
@override final  DateTime? updatedAt;
/// Indique si la feuille de temps est synchronisée avec le serveur
@override@JsonKey() final  bool isSync;

/// Create a copy of TimesheetDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimesheetDtoCopyWith<_TimesheetDto> get copyWith => __$TimesheetDtoCopyWithImpl<_TimesheetDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimesheetDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimesheetDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeAllocated, timeAllocated) || other.timeAllocated == timeAllocated)&&(identical(other.date, date) || other.date == date)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,description,timeAllocated,date,idIntervention,createdAt,updatedAt,isSync);

@override
String toString() {
  return 'TimesheetDto(localId: $localId, id: $id, description: $description, timeAllocated: $timeAllocated, date: $date, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$TimesheetDtoCopyWith<$Res> implements $TimesheetDtoCopyWith<$Res> {
  factory _$TimesheetDtoCopyWith(_TimesheetDto value, $Res Function(_TimesheetDto) _then) = __$TimesheetDtoCopyWithImpl;
@override @useResult
$Res call({
 int? localId, String? id, String description, double timeAllocated, String date, String idIntervention, DateTime? createdAt, DateTime? updatedAt, bool isSync
});




}
/// @nodoc
class __$TimesheetDtoCopyWithImpl<$Res>
    implements _$TimesheetDtoCopyWith<$Res> {
  __$TimesheetDtoCopyWithImpl(this._self, this._then);

  final _TimesheetDto _self;
  final $Res Function(_TimesheetDto) _then;

/// Create a copy of TimesheetDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? description = null,Object? timeAllocated = null,Object? date = null,Object? idIntervention = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isSync = null,}) {
  return _then(_TimesheetDto(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,timeAllocated: null == timeAllocated ? _self.timeAllocated : timeAllocated // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSync: null == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
