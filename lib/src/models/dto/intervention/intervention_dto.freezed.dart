// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intervention_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterventionDto {

/// ID local (peut être null si l'intervention n'a pas encore été sauvegardée localement)
 int? get localId;/// ID du serveur (peut être null si l'intervention n'a pas encore été synchronisée)
 String? get id;/// Titre de l'intervention
 String get titre;/// Date de début au format string
 String get dateStart;/// Date de fin au format string
 String get dateEnd;/// Statut de l'intervention (1=planifié, 2=en cours, 3=terminé)
 int get status;/// Priorité (haute, moyenne, basse)
 String get priority;/// Nom du client
 String get customer;/// Longitude
 double get long;/// Latitude
 double get lat;/// Distance en km
 double get distance;/// Description de l'intervention
 String get description;/// Date de création
 DateTime? get createdAt;/// Date de mise à jour
 DateTime? get updatedAt;/// ID de l'utilisateur
 String get userId;/// Indique si l'intervention est synchronisée avec le serveur
 bool get isSync;
/// Create a copy of InterventionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterventionDtoCopyWith<InterventionDto> get copyWith => _$InterventionDtoCopyWithImpl<InterventionDto>(this as InterventionDto, _$identity);

  /// Serializes this InterventionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterventionDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.titre, titre) || other.titre == titre)&&(identical(other.dateStart, dateStart) || other.dateStart == dateStart)&&(identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.long, long) || other.long == long)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,titre,dateStart,dateEnd,status,priority,customer,long,lat,distance,description,createdAt,updatedAt,userId,isSync);

@override
String toString() {
  return 'InterventionDto(localId: $localId, id: $id, titre: $titre, dateStart: $dateStart, dateEnd: $dateEnd, status: $status, priority: $priority, customer: $customer, long: $long, lat: $lat, distance: $distance, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $InterventionDtoCopyWith<$Res>  {
  factory $InterventionDtoCopyWith(InterventionDto value, $Res Function(InterventionDto) _then) = _$InterventionDtoCopyWithImpl;
@useResult
$Res call({
 int? localId, String? id, String titre, String dateStart, String dateEnd, int status, String priority, String customer, double long, double lat, double distance, String description, DateTime? createdAt, DateTime? updatedAt, String userId, bool isSync
});




}
/// @nodoc
class _$InterventionDtoCopyWithImpl<$Res>
    implements $InterventionDtoCopyWith<$Res> {
  _$InterventionDtoCopyWithImpl(this._self, this._then);

  final InterventionDto _self;
  final $Res Function(InterventionDto) _then;

/// Create a copy of InterventionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? titre = null,Object? dateStart = null,Object? dateEnd = null,Object? status = null,Object? priority = null,Object? customer = null,Object? long = null,Object? lat = null,Object? distance = null,Object? description = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? userId = null,Object? isSync = null,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,titre: null == titre ? _self.titre : titre // ignore: cast_nullable_to_non_nullable
as String,dateStart: null == dateStart ? _self.dateStart : dateStart // ignore: cast_nullable_to_non_nullable
as String,dateEnd: null == dateEnd ? _self.dateEnd : dateEnd // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isSync: null == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [InterventionDto].
extension InterventionDtoPatterns on InterventionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterventionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterventionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterventionDto value)  $default,){
final _that = this;
switch (_that) {
case _InterventionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterventionDto value)?  $default,){
final _that = this;
switch (_that) {
case _InterventionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? localId,  String? id,  String titre,  String dateStart,  String dateEnd,  int status,  String priority,  String customer,  double long,  double lat,  double distance,  String description,  DateTime? createdAt,  DateTime? updatedAt,  String userId,  bool isSync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterventionDto() when $default != null:
return $default(_that.localId,_that.id,_that.titre,_that.dateStart,_that.dateEnd,_that.status,_that.priority,_that.customer,_that.long,_that.lat,_that.distance,_that.description,_that.createdAt,_that.updatedAt,_that.userId,_that.isSync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? localId,  String? id,  String titre,  String dateStart,  String dateEnd,  int status,  String priority,  String customer,  double long,  double lat,  double distance,  String description,  DateTime? createdAt,  DateTime? updatedAt,  String userId,  bool isSync)  $default,) {final _that = this;
switch (_that) {
case _InterventionDto():
return $default(_that.localId,_that.id,_that.titre,_that.dateStart,_that.dateEnd,_that.status,_that.priority,_that.customer,_that.long,_that.lat,_that.distance,_that.description,_that.createdAt,_that.updatedAt,_that.userId,_that.isSync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? localId,  String? id,  String titre,  String dateStart,  String dateEnd,  int status,  String priority,  String customer,  double long,  double lat,  double distance,  String description,  DateTime? createdAt,  DateTime? updatedAt,  String userId,  bool isSync)?  $default,) {final _that = this;
switch (_that) {
case _InterventionDto() when $default != null:
return $default(_that.localId,_that.id,_that.titre,_that.dateStart,_that.dateEnd,_that.status,_that.priority,_that.customer,_that.long,_that.lat,_that.distance,_that.description,_that.createdAt,_that.updatedAt,_that.userId,_that.isSync);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterventionDto implements InterventionDto {
  const _InterventionDto({this.localId, this.id, required this.titre, required this.dateStart, required this.dateEnd, required this.status, required this.priority, required this.customer, required this.long, required this.lat, required this.distance, required this.description, this.createdAt, this.updatedAt, required this.userId, this.isSync = false});
  factory _InterventionDto.fromJson(Map<String, dynamic> json) => _$InterventionDtoFromJson(json);

/// ID local (peut être null si l'intervention n'a pas encore été sauvegardée localement)
@override final  int? localId;
/// ID du serveur (peut être null si l'intervention n'a pas encore été synchronisée)
@override final  String? id;
/// Titre de l'intervention
@override final  String titre;
/// Date de début au format string
@override final  String dateStart;
/// Date de fin au format string
@override final  String dateEnd;
/// Statut de l'intervention (1=planifié, 2=en cours, 3=terminé)
@override final  int status;
/// Priorité (haute, moyenne, basse)
@override final  String priority;
/// Nom du client
@override final  String customer;
/// Longitude
@override final  double long;
/// Latitude
@override final  double lat;
/// Distance en km
@override final  double distance;
/// Description de l'intervention
@override final  String description;
/// Date de création
@override final  DateTime? createdAt;
/// Date de mise à jour
@override final  DateTime? updatedAt;
/// ID de l'utilisateur
@override final  String userId;
/// Indique si l'intervention est synchronisée avec le serveur
@override@JsonKey() final  bool isSync;

/// Create a copy of InterventionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterventionDtoCopyWith<_InterventionDto> get copyWith => __$InterventionDtoCopyWithImpl<_InterventionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterventionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterventionDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.titre, titre) || other.titre == titre)&&(identical(other.dateStart, dateStart) || other.dateStart == dateStart)&&(identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.long, long) || other.long == long)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,titre,dateStart,dateEnd,status,priority,customer,long,lat,distance,description,createdAt,updatedAt,userId,isSync);

@override
String toString() {
  return 'InterventionDto(localId: $localId, id: $id, titre: $titre, dateStart: $dateStart, dateEnd: $dateEnd, status: $status, priority: $priority, customer: $customer, long: $long, lat: $lat, distance: $distance, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$InterventionDtoCopyWith<$Res> implements $InterventionDtoCopyWith<$Res> {
  factory _$InterventionDtoCopyWith(_InterventionDto value, $Res Function(_InterventionDto) _then) = __$InterventionDtoCopyWithImpl;
@override @useResult
$Res call({
 int? localId, String? id, String titre, String dateStart, String dateEnd, int status, String priority, String customer, double long, double lat, double distance, String description, DateTime? createdAt, DateTime? updatedAt, String userId, bool isSync
});




}
/// @nodoc
class __$InterventionDtoCopyWithImpl<$Res>
    implements _$InterventionDtoCopyWith<$Res> {
  __$InterventionDtoCopyWithImpl(this._self, this._then);

  final _InterventionDto _self;
  final $Res Function(_InterventionDto) _then;

/// Create a copy of InterventionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? titre = null,Object? dateStart = null,Object? dateEnd = null,Object? status = null,Object? priority = null,Object? customer = null,Object? long = null,Object? lat = null,Object? distance = null,Object? description = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? userId = null,Object? isSync = null,}) {
  return _then(_InterventionDto(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,titre: null == titre ? _self.titre : titre // ignore: cast_nullable_to_non_nullable
as String,dateStart: null == dateStart ? _self.dateStart : dateStart // ignore: cast_nullable_to_non_nullable
as String,dateEnd: null == dateEnd ? _self.dateEnd : dateEnd // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isSync: null == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
