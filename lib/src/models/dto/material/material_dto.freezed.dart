// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaterialDto {

/// ID local (peut être null si le matériau n'a pas encore été sauvegardé localement)
 int? get localId;/// ID du serveur (peut être null si le matériau n'a pas encore été synchronisé)
 String? get id;/// Nom du matériau
 String get name;/// Quantité
 int get quantity;/// ID de l'intervention associée
 String get idIntervention;/// Date de création
 DateTime? get createdAt;/// Date de mise à jour
 DateTime? get updatedAt;/// Indique si le matériau est synchronisé avec le serveur
 bool get isSync;
/// Create a copy of MaterialDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialDtoCopyWith<MaterialDto> get copyWith => _$MaterialDtoCopyWithImpl<MaterialDto>(this as MaterialDto, _$identity);

  /// Serializes this MaterialDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,quantity,idIntervention,createdAt,updatedAt,isSync);

@override
String toString() {
  return 'MaterialDto(localId: $localId, id: $id, name: $name, quantity: $quantity, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $MaterialDtoCopyWith<$Res>  {
  factory $MaterialDtoCopyWith(MaterialDto value, $Res Function(MaterialDto) _then) = _$MaterialDtoCopyWithImpl;
@useResult
$Res call({
 int? localId, String? id, String name, int quantity, String idIntervention, DateTime? createdAt, DateTime? updatedAt, bool isSync
});




}
/// @nodoc
class _$MaterialDtoCopyWithImpl<$Res>
    implements $MaterialDtoCopyWith<$Res> {
  _$MaterialDtoCopyWithImpl(this._self, this._then);

  final MaterialDto _self;
  final $Res Function(MaterialDto) _then;

/// Create a copy of MaterialDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? quantity = null,Object? idIntervention = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isSync = null,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSync: null == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MaterialDto].
extension MaterialDtoPatterns on MaterialDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MaterialDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MaterialDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MaterialDto value)  $default,){
final _that = this;
switch (_that) {
case _MaterialDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MaterialDto value)?  $default,){
final _that = this;
switch (_that) {
case _MaterialDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? localId,  String? id,  String name,  int quantity,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  bool isSync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MaterialDto() when $default != null:
return $default(_that.localId,_that.id,_that.name,_that.quantity,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? localId,  String? id,  String name,  int quantity,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  bool isSync)  $default,) {final _that = this;
switch (_that) {
case _MaterialDto():
return $default(_that.localId,_that.id,_that.name,_that.quantity,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? localId,  String? id,  String name,  int quantity,  String idIntervention,  DateTime? createdAt,  DateTime? updatedAt,  bool isSync)?  $default,) {final _that = this;
switch (_that) {
case _MaterialDto() when $default != null:
return $default(_that.localId,_that.id,_that.name,_that.quantity,_that.idIntervention,_that.createdAt,_that.updatedAt,_that.isSync);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MaterialDto implements MaterialDto {
  const _MaterialDto({this.localId, this.id, required this.name, required this.quantity, required this.idIntervention, this.createdAt, this.updatedAt, this.isSync = false});
  factory _MaterialDto.fromJson(Map<String, dynamic> json) => _$MaterialDtoFromJson(json);

/// ID local (peut être null si le matériau n'a pas encore été sauvegardé localement)
@override final  int? localId;
/// ID du serveur (peut être null si le matériau n'a pas encore été synchronisé)
@override final  String? id;
/// Nom du matériau
@override final  String name;
/// Quantité
@override final  int quantity;
/// ID de l'intervention associée
@override final  String idIntervention;
/// Date de création
@override final  DateTime? createdAt;
/// Date de mise à jour
@override final  DateTime? updatedAt;
/// Indique si le matériau est synchronisé avec le serveur
@override@JsonKey() final  bool isSync;

/// Create a copy of MaterialDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaterialDtoCopyWith<_MaterialDto> get copyWith => __$MaterialDtoCopyWithImpl<_MaterialDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaterialDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialDto&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,quantity,idIntervention,createdAt,updatedAt,isSync);

@override
String toString() {
  return 'MaterialDto(localId: $localId, id: $id, name: $name, quantity: $quantity, idIntervention: $idIntervention, createdAt: $createdAt, updatedAt: $updatedAt, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$MaterialDtoCopyWith<$Res> implements $MaterialDtoCopyWith<$Res> {
  factory _$MaterialDtoCopyWith(_MaterialDto value, $Res Function(_MaterialDto) _then) = __$MaterialDtoCopyWithImpl;
@override @useResult
$Res call({
 int? localId, String? id, String name, int quantity, String idIntervention, DateTime? createdAt, DateTime? updatedAt, bool isSync
});




}
/// @nodoc
class __$MaterialDtoCopyWithImpl<$Res>
    implements _$MaterialDtoCopyWith<$Res> {
  __$MaterialDtoCopyWithImpl(this._self, this._then);

  final _MaterialDto _self;
  final $Res Function(_MaterialDto) _then;

/// Create a copy of MaterialDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? quantity = null,Object? idIntervention = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? isSync = null,}) {
  return _then(_MaterialDto(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isSync: null == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
