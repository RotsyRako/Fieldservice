// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_pj_synchro.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentPjSynchroDTO {

 String get filename; String get data;
/// Create a copy of CommentPjSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentPjSynchroDTOCopyWith<CommentPjSynchroDTO> get copyWith => _$CommentPjSynchroDTOCopyWithImpl<CommentPjSynchroDTO>(this as CommentPjSynchroDTO, _$identity);

  /// Serializes this CommentPjSynchroDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentPjSynchroDTO&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,data);

@override
String toString() {
  return 'CommentPjSynchroDTO(filename: $filename, data: $data)';
}


}

/// @nodoc
abstract mixin class $CommentPjSynchroDTOCopyWith<$Res>  {
  factory $CommentPjSynchroDTOCopyWith(CommentPjSynchroDTO value, $Res Function(CommentPjSynchroDTO) _then) = _$CommentPjSynchroDTOCopyWithImpl;
@useResult
$Res call({
 String filename, String data
});




}
/// @nodoc
class _$CommentPjSynchroDTOCopyWithImpl<$Res>
    implements $CommentPjSynchroDTOCopyWith<$Res> {
  _$CommentPjSynchroDTOCopyWithImpl(this._self, this._then);

  final CommentPjSynchroDTO _self;
  final $Res Function(CommentPjSynchroDTO) _then;

/// Create a copy of CommentPjSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filename = null,Object? data = null,}) {
  return _then(_self.copyWith(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CommentPjSynchroDTO implements CommentPjSynchroDTO {
  const _CommentPjSynchroDTO({required this.filename, required this.data});
  factory _CommentPjSynchroDTO.fromJson(Map<String, dynamic> json) => _$CommentPjSynchroDTOFromJson(json);

@override final  String filename;
@override final  String data;

/// Create a copy of CommentPjSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentPjSynchroDTOCopyWith<_CommentPjSynchroDTO> get copyWith => __$CommentPjSynchroDTOCopyWithImpl<_CommentPjSynchroDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentPjSynchroDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentPjSynchroDTO&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,data);

@override
String toString() {
  return 'CommentPjSynchroDTO(filename: $filename, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CommentPjSynchroDTOCopyWith<$Res> implements $CommentPjSynchroDTOCopyWith<$Res> {
  factory _$CommentPjSynchroDTOCopyWith(_CommentPjSynchroDTO value, $Res Function(_CommentPjSynchroDTO) _then) = __$CommentPjSynchroDTOCopyWithImpl;
@override @useResult
$Res call({
 String filename, String data
});




}
/// @nodoc
class __$CommentPjSynchroDTOCopyWithImpl<$Res>
    implements _$CommentPjSynchroDTOCopyWith<$Res> {
  __$CommentPjSynchroDTOCopyWithImpl(this._self, this._then);

  final _CommentPjSynchroDTO _self;
  final $Res Function(_CommentPjSynchroDTO) _then;

/// Create a copy of CommentPjSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filename = null,Object? data = null,}) {
  return _then(_CommentPjSynchroDTO(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
