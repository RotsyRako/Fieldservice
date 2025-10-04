// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_status_request.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateStatusRequestDTO {

 int get statusId; int get interventionId;
/// Create a copy of UpdateStatusRequestDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateStatusRequestDTOCopyWith<UpdateStatusRequestDTO> get copyWith => _$UpdateStatusRequestDTOCopyWithImpl<UpdateStatusRequestDTO>(this as UpdateStatusRequestDTO, _$identity);

  /// Serializes this UpdateStatusRequestDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateStatusRequestDTO&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.interventionId, interventionId) || other.interventionId == interventionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusId,interventionId);

@override
String toString() {
  return 'UpdateStatusRequestDTO(statusId: $statusId, interventionId: $interventionId)';
}


}

/// @nodoc
abstract mixin class $UpdateStatusRequestDTOCopyWith<$Res>  {
  factory $UpdateStatusRequestDTOCopyWith(UpdateStatusRequestDTO value, $Res Function(UpdateStatusRequestDTO) _then) = _$UpdateStatusRequestDTOCopyWithImpl;
@useResult
$Res call({
 int statusId, int interventionId
});




}
/// @nodoc
class _$UpdateStatusRequestDTOCopyWithImpl<$Res>
    implements $UpdateStatusRequestDTOCopyWith<$Res> {
  _$UpdateStatusRequestDTOCopyWithImpl(this._self, this._then);

  final UpdateStatusRequestDTO _self;
  final $Res Function(UpdateStatusRequestDTO) _then;

/// Create a copy of UpdateStatusRequestDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statusId = null,Object? interventionId = null,}) {
  return _then(_self.copyWith(
statusId: null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,interventionId: null == interventionId ? _self.interventionId : interventionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _UpdateStatusRequestDTO implements UpdateStatusRequestDTO {
  const _UpdateStatusRequestDTO({required this.statusId, required this.interventionId});
  factory _UpdateStatusRequestDTO.fromJson(Map<String, dynamic> json) => _$UpdateStatusRequestDTOFromJson(json);

@override final  int statusId;
@override final  int interventionId;

/// Create a copy of UpdateStatusRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateStatusRequestDTOCopyWith<_UpdateStatusRequestDTO> get copyWith => __$UpdateStatusRequestDTOCopyWithImpl<_UpdateStatusRequestDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateStatusRequestDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateStatusRequestDTO&&(identical(other.statusId, statusId) || other.statusId == statusId)&&(identical(other.interventionId, interventionId) || other.interventionId == interventionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,statusId,interventionId);

@override
String toString() {
  return 'UpdateStatusRequestDTO(statusId: $statusId, interventionId: $interventionId)';
}


}

/// @nodoc
abstract mixin class _$UpdateStatusRequestDTOCopyWith<$Res> implements $UpdateStatusRequestDTOCopyWith<$Res> {
  factory _$UpdateStatusRequestDTOCopyWith(_UpdateStatusRequestDTO value, $Res Function(_UpdateStatusRequestDTO) _then) = __$UpdateStatusRequestDTOCopyWithImpl;
@override @useResult
$Res call({
 int statusId, int interventionId
});




}
/// @nodoc
class __$UpdateStatusRequestDTOCopyWithImpl<$Res>
    implements _$UpdateStatusRequestDTOCopyWith<$Res> {
  __$UpdateStatusRequestDTOCopyWithImpl(this._self, this._then);

  final _UpdateStatusRequestDTO _self;
  final $Res Function(_UpdateStatusRequestDTO) _then;

/// Create a copy of UpdateStatusRequestDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statusId = null,Object? interventionId = null,}) {
  return _then(_UpdateStatusRequestDTO(
statusId: null == statusId ? _self.statusId : statusId // ignore: cast_nullable_to_non_nullable
as int,interventionId: null == interventionId ? _self.interventionId : interventionId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
