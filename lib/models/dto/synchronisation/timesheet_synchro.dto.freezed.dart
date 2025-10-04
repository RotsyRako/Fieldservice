// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timesheet_synchro.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimesheetSynchroDTO {

 String get date; double get timeAllocated; String get description;
/// Create a copy of TimesheetSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimesheetSynchroDTOCopyWith<TimesheetSynchroDTO> get copyWith => _$TimesheetSynchroDTOCopyWithImpl<TimesheetSynchroDTO>(this as TimesheetSynchroDTO, _$identity);

  /// Serializes this TimesheetSynchroDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimesheetSynchroDTO&&(identical(other.date, date) || other.date == date)&&(identical(other.timeAllocated, timeAllocated) || other.timeAllocated == timeAllocated)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,timeAllocated,description);

@override
String toString() {
  return 'TimesheetSynchroDTO(date: $date, timeAllocated: $timeAllocated, description: $description)';
}


}

/// @nodoc
abstract mixin class $TimesheetSynchroDTOCopyWith<$Res>  {
  factory $TimesheetSynchroDTOCopyWith(TimesheetSynchroDTO value, $Res Function(TimesheetSynchroDTO) _then) = _$TimesheetSynchroDTOCopyWithImpl;
@useResult
$Res call({
 String date, double timeAllocated, String description
});




}
/// @nodoc
class _$TimesheetSynchroDTOCopyWithImpl<$Res>
    implements $TimesheetSynchroDTOCopyWith<$Res> {
  _$TimesheetSynchroDTOCopyWithImpl(this._self, this._then);

  final TimesheetSynchroDTO _self;
  final $Res Function(TimesheetSynchroDTO) _then;

/// Create a copy of TimesheetSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? timeAllocated = null,Object? description = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,timeAllocated: null == timeAllocated ? _self.timeAllocated : timeAllocated // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TimesheetSynchroDTO implements TimesheetSynchroDTO {
  const _TimesheetSynchroDTO({required this.date, required this.timeAllocated, required this.description});
  factory _TimesheetSynchroDTO.fromJson(Map<String, dynamic> json) => _$TimesheetSynchroDTOFromJson(json);

@override final  String date;
@override final  double timeAllocated;
@override final  String description;

/// Create a copy of TimesheetSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimesheetSynchroDTOCopyWith<_TimesheetSynchroDTO> get copyWith => __$TimesheetSynchroDTOCopyWithImpl<_TimesheetSynchroDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimesheetSynchroDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimesheetSynchroDTO&&(identical(other.date, date) || other.date == date)&&(identical(other.timeAllocated, timeAllocated) || other.timeAllocated == timeAllocated)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,timeAllocated,description);

@override
String toString() {
  return 'TimesheetSynchroDTO(date: $date, timeAllocated: $timeAllocated, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TimesheetSynchroDTOCopyWith<$Res> implements $TimesheetSynchroDTOCopyWith<$Res> {
  factory _$TimesheetSynchroDTOCopyWith(_TimesheetSynchroDTO value, $Res Function(_TimesheetSynchroDTO) _then) = __$TimesheetSynchroDTOCopyWithImpl;
@override @useResult
$Res call({
 String date, double timeAllocated, String description
});




}
/// @nodoc
class __$TimesheetSynchroDTOCopyWithImpl<$Res>
    implements _$TimesheetSynchroDTOCopyWith<$Res> {
  __$TimesheetSynchroDTOCopyWithImpl(this._self, this._then);

  final _TimesheetSynchroDTO _self;
  final $Res Function(_TimesheetSynchroDTO) _then;

/// Create a copy of TimesheetSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? timeAllocated = null,Object? description = null,}) {
  return _then(_TimesheetSynchroDTO(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,timeAllocated: null == timeAllocated ? _self.timeAllocated : timeAllocated // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
