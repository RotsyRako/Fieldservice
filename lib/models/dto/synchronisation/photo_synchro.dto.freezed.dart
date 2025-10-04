// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_synchro.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
PhotoSynchroDTO _$PhotoSynchroDTOFromJson(
  Map<String, dynamic> json
) {
    return _PhotoDTO.fromJson(
      json
    );
}

/// @nodoc
mixin _$PhotoSynchroDTO {

 String get filename; String get data;
/// Create a copy of PhotoSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoSynchroDTOCopyWith<PhotoSynchroDTO> get copyWith => _$PhotoSynchroDTOCopyWithImpl<PhotoSynchroDTO>(this as PhotoSynchroDTO, _$identity);

  /// Serializes this PhotoSynchroDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoSynchroDTO&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,data);

@override
String toString() {
  return 'PhotoSynchroDTO(filename: $filename, data: $data)';
}


}

/// @nodoc
abstract mixin class $PhotoSynchroDTOCopyWith<$Res>  {
  factory $PhotoSynchroDTOCopyWith(PhotoSynchroDTO value, $Res Function(PhotoSynchroDTO) _then) = _$PhotoSynchroDTOCopyWithImpl;
@useResult
$Res call({
 String filename, String data
});




}
/// @nodoc
class _$PhotoSynchroDTOCopyWithImpl<$Res>
    implements $PhotoSynchroDTOCopyWith<$Res> {
  _$PhotoSynchroDTOCopyWithImpl(this._self, this._then);

  final PhotoSynchroDTO _self;
  final $Res Function(PhotoSynchroDTO) _then;

/// Create a copy of PhotoSynchroDTO
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

class _PhotoDTO implements PhotoSynchroDTO {
  const _PhotoDTO({required this.filename, required this.data});
  factory _PhotoDTO.fromJson(Map<String, dynamic> json) => _$PhotoDTOFromJson(json);

@override final  String filename;
@override final  String data;

/// Create a copy of PhotoSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoDTOCopyWith<_PhotoDTO> get copyWith => __$PhotoDTOCopyWithImpl<_PhotoDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoDTO&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,data);

@override
String toString() {
  return 'PhotoSynchroDTO(filename: $filename, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PhotoDTOCopyWith<$Res> implements $PhotoSynchroDTOCopyWith<$Res> {
  factory _$PhotoDTOCopyWith(_PhotoDTO value, $Res Function(_PhotoDTO) _then) = __$PhotoDTOCopyWithImpl;
@override @useResult
$Res call({
 String filename, String data
});




}
/// @nodoc
class __$PhotoDTOCopyWithImpl<$Res>
    implements _$PhotoDTOCopyWith<$Res> {
  __$PhotoDTOCopyWithImpl(this._self, this._then);

  final _PhotoDTO _self;
  final $Res Function(_PhotoDTO) _then;

/// Create a copy of PhotoSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filename = null,Object? data = null,}) {
  return _then(_PhotoDTO(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
