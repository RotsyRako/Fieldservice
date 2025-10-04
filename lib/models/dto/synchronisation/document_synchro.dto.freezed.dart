// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document_synchro.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentSynchroDTO {

 String get filename; String get data;
/// Create a copy of DocumentSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentSynchroDTOCopyWith<DocumentSynchroDTO> get copyWith => _$DocumentSynchroDTOCopyWithImpl<DocumentSynchroDTO>(this as DocumentSynchroDTO, _$identity);

  /// Serializes this DocumentSynchroDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentSynchroDTO&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,data);

@override
String toString() {
  return 'DocumentSynchroDTO(filename: $filename, data: $data)';
}


}

/// @nodoc
abstract mixin class $DocumentSynchroDTOCopyWith<$Res>  {
  factory $DocumentSynchroDTOCopyWith(DocumentSynchroDTO value, $Res Function(DocumentSynchroDTO) _then) = _$DocumentSynchroDTOCopyWithImpl;
@useResult
$Res call({
 String filename, String data
});




}
/// @nodoc
class _$DocumentSynchroDTOCopyWithImpl<$Res>
    implements $DocumentSynchroDTOCopyWith<$Res> {
  _$DocumentSynchroDTOCopyWithImpl(this._self, this._then);

  final DocumentSynchroDTO _self;
  final $Res Function(DocumentSynchroDTO) _then;

/// Create a copy of DocumentSynchroDTO
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

class _DocumentSynchroDTO implements DocumentSynchroDTO {
  const _DocumentSynchroDTO({required this.filename, required this.data});
  factory _DocumentSynchroDTO.fromJson(Map<String, dynamic> json) => _$DocumentSynchroDTOFromJson(json);

@override final  String filename;
@override final  String data;

/// Create a copy of DocumentSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentSynchroDTOCopyWith<_DocumentSynchroDTO> get copyWith => __$DocumentSynchroDTOCopyWithImpl<_DocumentSynchroDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentSynchroDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentSynchroDTO&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,data);

@override
String toString() {
  return 'DocumentSynchroDTO(filename: $filename, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DocumentSynchroDTOCopyWith<$Res> implements $DocumentSynchroDTOCopyWith<$Res> {
  factory _$DocumentSynchroDTOCopyWith(_DocumentSynchroDTO value, $Res Function(_DocumentSynchroDTO) _then) = __$DocumentSynchroDTOCopyWithImpl;
@override @useResult
$Res call({
 String filename, String data
});




}
/// @nodoc
class __$DocumentSynchroDTOCopyWithImpl<$Res>
    implements _$DocumentSynchroDTOCopyWith<$Res> {
  __$DocumentSynchroDTOCopyWithImpl(this._self, this._then);

  final _DocumentSynchroDTO _self;
  final $Res Function(_DocumentSynchroDTO) _then;

/// Create a copy of DocumentSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filename = null,Object? data = null,}) {
  return _then(_DocumentSynchroDTO(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
