// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'synchronisation_request.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SynchrositionRequestDTO {

 List<SynchrositionDTO>? get data;
/// Create a copy of SynchrositionRequestDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SynchrositionRequestDTOCopyWith<SynchrositionRequestDTO> get copyWith => _$SynchrositionRequestDTOCopyWithImpl<SynchrositionRequestDTO>(this as SynchrositionRequestDTO, _$identity);

  /// Serializes this SynchrositionRequestDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SynchrositionRequestDTO&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SynchrositionRequestDTO(data: $data)';
}


}

/// @nodoc
abstract mixin class $SynchrositionRequestDTOCopyWith<$Res>  {
  factory $SynchrositionRequestDTOCopyWith(SynchrositionRequestDTO value, $Res Function(SynchrositionRequestDTO) _then) = _$SynchrositionRequestDTOCopyWithImpl;
@useResult
$Res call({
 List<SynchrositionDTO>? data
});




}
/// @nodoc
class _$SynchrositionRequestDTOCopyWithImpl<$Res>
    implements $SynchrositionRequestDTOCopyWith<$Res> {
  _$SynchrositionRequestDTOCopyWithImpl(this._self, this._then);

  final SynchrositionRequestDTO _self;
  final $Res Function(SynchrositionRequestDTO) _then;

/// Create a copy of SynchrositionRequestDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SynchrositionDTO>?,
  ));
}

}


/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _SynchrositionRequestDTO implements SynchrositionRequestDTO {
  const _SynchrositionRequestDTO({final  List<SynchrositionDTO>? data}): _data = data;
  factory _SynchrositionRequestDTO.fromJson(Map<String, dynamic> json) => _$SynchrositionRequestDTOFromJson(json);

 final  List<SynchrositionDTO>? _data;
@override List<SynchrositionDTO>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SynchrositionRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SynchrositionRequestDTOCopyWith<_SynchrositionRequestDTO> get copyWith => __$SynchrositionRequestDTOCopyWithImpl<_SynchrositionRequestDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SynchrositionRequestDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SynchrositionRequestDTO&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SynchrositionRequestDTO(data: $data)';
}


}

/// @nodoc
abstract mixin class _$SynchrositionRequestDTOCopyWith<$Res> implements $SynchrositionRequestDTOCopyWith<$Res> {
  factory _$SynchrositionRequestDTOCopyWith(_SynchrositionRequestDTO value, $Res Function(_SynchrositionRequestDTO) _then) = __$SynchrositionRequestDTOCopyWithImpl;
@override @useResult
$Res call({
 List<SynchrositionDTO>? data
});




}
/// @nodoc
class __$SynchrositionRequestDTOCopyWithImpl<$Res>
    implements _$SynchrositionRequestDTOCopyWith<$Res> {
  __$SynchrositionRequestDTOCopyWithImpl(this._self, this._then);

  final _SynchrositionRequestDTO _self;
  final $Res Function(_SynchrositionRequestDTO) _then;

/// Create a copy of SynchrositionRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(_SynchrositionRequestDTO(
data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SynchrositionDTO>?,
  ));
}


}

// dart format on
