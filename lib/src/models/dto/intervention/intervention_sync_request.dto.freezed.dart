// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intervention_sync_request.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterventionSyncRequestDto {

/// Liste des interventions à synchroniser
 List<InterventionSyncItemDto> get data;
/// Create a copy of InterventionSyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterventionSyncRequestDtoCopyWith<InterventionSyncRequestDto> get copyWith => _$InterventionSyncRequestDtoCopyWithImpl<InterventionSyncRequestDto>(this as InterventionSyncRequestDto, _$identity);

  /// Serializes this InterventionSyncRequestDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterventionSyncRequestDto&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'InterventionSyncRequestDto(data: $data)';
}


}

/// @nodoc
abstract mixin class $InterventionSyncRequestDtoCopyWith<$Res>  {
  factory $InterventionSyncRequestDtoCopyWith(InterventionSyncRequestDto value, $Res Function(InterventionSyncRequestDto) _then) = _$InterventionSyncRequestDtoCopyWithImpl;
@useResult
$Res call({
 List<InterventionSyncItemDto> data
});




}
/// @nodoc
class _$InterventionSyncRequestDtoCopyWithImpl<$Res>
    implements $InterventionSyncRequestDtoCopyWith<$Res> {
  _$InterventionSyncRequestDtoCopyWithImpl(this._self, this._then);

  final InterventionSyncRequestDto _self;
  final $Res Function(InterventionSyncRequestDto) _then;

/// Create a copy of InterventionSyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<InterventionSyncItemDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [InterventionSyncRequestDto].
extension InterventionSyncRequestDtoPatterns on InterventionSyncRequestDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterventionSyncRequestDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterventionSyncRequestDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterventionSyncRequestDto value)  $default,){
final _that = this;
switch (_that) {
case _InterventionSyncRequestDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterventionSyncRequestDto value)?  $default,){
final _that = this;
switch (_that) {
case _InterventionSyncRequestDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<InterventionSyncItemDto> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterventionSyncRequestDto() when $default != null:
return $default(_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<InterventionSyncItemDto> data)  $default,) {final _that = this;
switch (_that) {
case _InterventionSyncRequestDto():
return $default(_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<InterventionSyncItemDto> data)?  $default,) {final _that = this;
switch (_that) {
case _InterventionSyncRequestDto() when $default != null:
return $default(_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterventionSyncRequestDto implements InterventionSyncRequestDto {
  const _InterventionSyncRequestDto({required final  List<InterventionSyncItemDto> data}): _data = data;
  factory _InterventionSyncRequestDto.fromJson(Map<String, dynamic> json) => _$InterventionSyncRequestDtoFromJson(json);

/// Liste des interventions à synchroniser
 final  List<InterventionSyncItemDto> _data;
/// Liste des interventions à synchroniser
@override List<InterventionSyncItemDto> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of InterventionSyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterventionSyncRequestDtoCopyWith<_InterventionSyncRequestDto> get copyWith => __$InterventionSyncRequestDtoCopyWithImpl<_InterventionSyncRequestDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterventionSyncRequestDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterventionSyncRequestDto&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'InterventionSyncRequestDto(data: $data)';
}


}

/// @nodoc
abstract mixin class _$InterventionSyncRequestDtoCopyWith<$Res> implements $InterventionSyncRequestDtoCopyWith<$Res> {
  factory _$InterventionSyncRequestDtoCopyWith(_InterventionSyncRequestDto value, $Res Function(_InterventionSyncRequestDto) _then) = __$InterventionSyncRequestDtoCopyWithImpl;
@override @useResult
$Res call({
 List<InterventionSyncItemDto> data
});




}
/// @nodoc
class __$InterventionSyncRequestDtoCopyWithImpl<$Res>
    implements _$InterventionSyncRequestDtoCopyWith<$Res> {
  __$InterventionSyncRequestDtoCopyWithImpl(this._self, this._then);

  final _InterventionSyncRequestDto _self;
  final $Res Function(_InterventionSyncRequestDto) _then;

/// Create a copy of InterventionSyncRequestDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(_InterventionSyncRequestDto(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<InterventionSyncItemDto>,
  ));
}


}

// dart format on
