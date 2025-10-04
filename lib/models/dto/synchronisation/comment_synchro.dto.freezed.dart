// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_synchro.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentSynchroDTO {

 String get message; String get dateCreated; List<CommentPjSynchroDTO>? get attachmentFiles;
/// Create a copy of CommentSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentSynchroDTOCopyWith<CommentSynchroDTO> get copyWith => _$CommentSynchroDTOCopyWithImpl<CommentSynchroDTO>(this as CommentSynchroDTO, _$identity);

  /// Serializes this CommentSynchroDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentSynchroDTO&&(identical(other.message, message) || other.message == message)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&const DeepCollectionEquality().equals(other.attachmentFiles, attachmentFiles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,dateCreated,const DeepCollectionEquality().hash(attachmentFiles));

@override
String toString() {
  return 'CommentSynchroDTO(message: $message, dateCreated: $dateCreated, attachmentFiles: $attachmentFiles)';
}


}

/// @nodoc
abstract mixin class $CommentSynchroDTOCopyWith<$Res>  {
  factory $CommentSynchroDTOCopyWith(CommentSynchroDTO value, $Res Function(CommentSynchroDTO) _then) = _$CommentSynchroDTOCopyWithImpl;
@useResult
$Res call({
 String message, String dateCreated, List<CommentPjSynchroDTO>? attachmentFiles
});




}
/// @nodoc
class _$CommentSynchroDTOCopyWithImpl<$Res>
    implements $CommentSynchroDTOCopyWith<$Res> {
  _$CommentSynchroDTOCopyWithImpl(this._self, this._then);

  final CommentSynchroDTO _self;
  final $Res Function(CommentSynchroDTO) _then;

/// Create a copy of CommentSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? dateCreated = null,Object? attachmentFiles = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,attachmentFiles: freezed == attachmentFiles ? _self.attachmentFiles : attachmentFiles // ignore: cast_nullable_to_non_nullable
as List<CommentPjSynchroDTO>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CommentSynchroDTO implements CommentSynchroDTO {
  const _CommentSynchroDTO({required this.message, required this.dateCreated, final  List<CommentPjSynchroDTO>? attachmentFiles}): _attachmentFiles = attachmentFiles;
  factory _CommentSynchroDTO.fromJson(Map<String, dynamic> json) => _$CommentSynchroDTOFromJson(json);

@override final  String message;
@override final  String dateCreated;
 final  List<CommentPjSynchroDTO>? _attachmentFiles;
@override List<CommentPjSynchroDTO>? get attachmentFiles {
  final value = _attachmentFiles;
  if (value == null) return null;
  if (_attachmentFiles is EqualUnmodifiableListView) return _attachmentFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of CommentSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentSynchroDTOCopyWith<_CommentSynchroDTO> get copyWith => __$CommentSynchroDTOCopyWithImpl<_CommentSynchroDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentSynchroDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentSynchroDTO&&(identical(other.message, message) || other.message == message)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&const DeepCollectionEquality().equals(other._attachmentFiles, _attachmentFiles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,dateCreated,const DeepCollectionEquality().hash(_attachmentFiles));

@override
String toString() {
  return 'CommentSynchroDTO(message: $message, dateCreated: $dateCreated, attachmentFiles: $attachmentFiles)';
}


}

/// @nodoc
abstract mixin class _$CommentSynchroDTOCopyWith<$Res> implements $CommentSynchroDTOCopyWith<$Res> {
  factory _$CommentSynchroDTOCopyWith(_CommentSynchroDTO value, $Res Function(_CommentSynchroDTO) _then) = __$CommentSynchroDTOCopyWithImpl;
@override @useResult
$Res call({
 String message, String dateCreated, List<CommentPjSynchroDTO>? attachmentFiles
});




}
/// @nodoc
class __$CommentSynchroDTOCopyWithImpl<$Res>
    implements _$CommentSynchroDTOCopyWith<$Res> {
  __$CommentSynchroDTOCopyWithImpl(this._self, this._then);

  final _CommentSynchroDTO _self;
  final $Res Function(_CommentSynchroDTO) _then;

/// Create a copy of CommentSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? dateCreated = null,Object? attachmentFiles = freezed,}) {
  return _then(_CommentSynchroDTO(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,attachmentFiles: freezed == attachmentFiles ? _self._attachmentFiles : attachmentFiles // ignore: cast_nullable_to_non_nullable
as List<CommentPjSynchroDTO>?,
  ));
}


}

// dart format on
