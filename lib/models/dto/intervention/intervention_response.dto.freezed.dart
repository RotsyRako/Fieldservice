// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intervention_response.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterventionResponseDto {

 bool get success; String get message; List<InterventionDTO>? get data;
/// Create a copy of InterventionResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterventionResponseDtoCopyWith<InterventionResponseDto> get copyWith => _$InterventionResponseDtoCopyWithImpl<InterventionResponseDto>(this as InterventionResponseDto, _$identity);

  /// Serializes this InterventionResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterventionResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'InterventionResponseDto(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $InterventionResponseDtoCopyWith<$Res>  {
  factory $InterventionResponseDtoCopyWith(InterventionResponseDto value, $Res Function(InterventionResponseDto) _then) = _$InterventionResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<InterventionDTO>? data
});




}
/// @nodoc
class _$InterventionResponseDtoCopyWithImpl<$Res>
    implements $InterventionResponseDtoCopyWith<$Res> {
  _$InterventionResponseDtoCopyWithImpl(this._self, this._then);

  final InterventionResponseDto _self;
  final $Res Function(InterventionResponseDto) _then;

/// Create a copy of InterventionResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<InterventionDTO>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _InterventionResponseDto implements InterventionResponseDto {
  const _InterventionResponseDto({required this.success, required this.message, final  List<InterventionDTO>? data}): _data = data;
  factory _InterventionResponseDto.fromJson(Map<String, dynamic> json) => _$InterventionResponseDtoFromJson(json);

@override final  bool success;
@override final  String message;
 final  List<InterventionDTO>? _data;
@override List<InterventionDTO>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of InterventionResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterventionResponseDtoCopyWith<_InterventionResponseDto> get copyWith => __$InterventionResponseDtoCopyWithImpl<_InterventionResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterventionResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterventionResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'InterventionResponseDto(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$InterventionResponseDtoCopyWith<$Res> implements $InterventionResponseDtoCopyWith<$Res> {
  factory _$InterventionResponseDtoCopyWith(_InterventionResponseDto value, $Res Function(_InterventionResponseDto) _then) = __$InterventionResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<InterventionDTO>? data
});




}
/// @nodoc
class __$InterventionResponseDtoCopyWithImpl<$Res>
    implements _$InterventionResponseDtoCopyWith<$Res> {
  __$InterventionResponseDtoCopyWithImpl(this._self, this._then);

  final _InterventionResponseDto _self;
  final $Res Function(_InterventionResponseDto) _then;

/// Create a copy of InterventionResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_InterventionResponseDto(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<InterventionDTO>?,
  ));
}


}

// dart format on
