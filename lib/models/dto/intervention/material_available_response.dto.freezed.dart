// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_available_response.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaterialAvailableResponseDto {

 bool get success; String get message; List<MaterialAvailableDTO>? get data;
/// Create a copy of MaterialAvailableResponseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialAvailableResponseDtoCopyWith<MaterialAvailableResponseDto> get copyWith => _$MaterialAvailableResponseDtoCopyWithImpl<MaterialAvailableResponseDto>(this as MaterialAvailableResponseDto, _$identity);

  /// Serializes this MaterialAvailableResponseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialAvailableResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'MaterialAvailableResponseDto(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $MaterialAvailableResponseDtoCopyWith<$Res>  {
  factory $MaterialAvailableResponseDtoCopyWith(MaterialAvailableResponseDto value, $Res Function(MaterialAvailableResponseDto) _then) = _$MaterialAvailableResponseDtoCopyWithImpl;
@useResult
$Res call({
 bool success, String message, List<MaterialAvailableDTO>? data
});




}
/// @nodoc
class _$MaterialAvailableResponseDtoCopyWithImpl<$Res>
    implements $MaterialAvailableResponseDtoCopyWith<$Res> {
  _$MaterialAvailableResponseDtoCopyWithImpl(this._self, this._then);

  final MaterialAvailableResponseDto _self;
  final $Res Function(MaterialAvailableResponseDto) _then;

/// Create a copy of MaterialAvailableResponseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<MaterialAvailableDTO>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MaterialAvailableResponseDto implements MaterialAvailableResponseDto {
  const _MaterialAvailableResponseDto({required this.success, required this.message, final  List<MaterialAvailableDTO>? data}): _data = data;
  factory _MaterialAvailableResponseDto.fromJson(Map<String, dynamic> json) => _$MaterialAvailableResponseDtoFromJson(json);

@override final  bool success;
@override final  String message;
 final  List<MaterialAvailableDTO>? _data;
@override List<MaterialAvailableDTO>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MaterialAvailableResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaterialAvailableResponseDtoCopyWith<_MaterialAvailableResponseDto> get copyWith => __$MaterialAvailableResponseDtoCopyWithImpl<_MaterialAvailableResponseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaterialAvailableResponseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialAvailableResponseDto&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'MaterialAvailableResponseDto(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MaterialAvailableResponseDtoCopyWith<$Res> implements $MaterialAvailableResponseDtoCopyWith<$Res> {
  factory _$MaterialAvailableResponseDtoCopyWith(_MaterialAvailableResponseDto value, $Res Function(_MaterialAvailableResponseDto) _then) = __$MaterialAvailableResponseDtoCopyWithImpl;
@override @useResult
$Res call({
 bool success, String message, List<MaterialAvailableDTO>? data
});




}
/// @nodoc
class __$MaterialAvailableResponseDtoCopyWithImpl<$Res>
    implements _$MaterialAvailableResponseDtoCopyWith<$Res> {
  __$MaterialAvailableResponseDtoCopyWithImpl(this._self, this._then);

  final _MaterialAvailableResponseDto _self;
  final $Res Function(_MaterialAvailableResponseDto) _then;

/// Create a copy of MaterialAvailableResponseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = freezed,}) {
  return _then(_MaterialAvailableResponseDto(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<MaterialAvailableDTO>?,
  ));
}


}

// dart format on
