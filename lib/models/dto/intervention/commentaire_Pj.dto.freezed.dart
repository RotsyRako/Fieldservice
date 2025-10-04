// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commentaire_Pj.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentairePjDTO {

 int get id; String get name; String get location;
/// Create a copy of CommentairePjDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentairePjDTOCopyWith<CommentairePjDTO> get copyWith => _$CommentairePjDTOCopyWithImpl<CommentairePjDTO>(this as CommentairePjDTO, _$identity);

  /// Serializes this CommentairePjDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentairePjDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location);

@override
String toString() {
  return 'CommentairePjDTO(id: $id, name: $name, location: $location)';
}


}

/// @nodoc
abstract mixin class $CommentairePjDTOCopyWith<$Res>  {
  factory $CommentairePjDTOCopyWith(CommentairePjDTO value, $Res Function(CommentairePjDTO) _then) = _$CommentairePjDTOCopyWithImpl;
@useResult
$Res call({
 int id, String name, String location
});




}
/// @nodoc
class _$CommentairePjDTOCopyWithImpl<$Res>
    implements $CommentairePjDTOCopyWith<$Res> {
  _$CommentairePjDTOCopyWithImpl(this._self, this._then);

  final CommentairePjDTO _self;
  final $Res Function(CommentairePjDTO) _then;

/// Create a copy of CommentairePjDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? location = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CommentairePjDTO implements CommentairePjDTO {
  const _CommentairePjDTO({required this.id, required this.name, required this.location});
  factory _CommentairePjDTO.fromJson(Map<String, dynamic> json) => _$CommentairePjDTOFromJson(json);

@override final  int id;
@override final  String name;
@override final  String location;

/// Create a copy of CommentairePjDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentairePjDTOCopyWith<_CommentairePjDTO> get copyWith => __$CommentairePjDTOCopyWithImpl<_CommentairePjDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentairePjDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentairePjDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,location);

@override
String toString() {
  return 'CommentairePjDTO(id: $id, name: $name, location: $location)';
}


}

/// @nodoc
abstract mixin class _$CommentairePjDTOCopyWith<$Res> implements $CommentairePjDTOCopyWith<$Res> {
  factory _$CommentairePjDTOCopyWith(_CommentairePjDTO value, $Res Function(_CommentairePjDTO) _then) = __$CommentairePjDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String location
});




}
/// @nodoc
class __$CommentairePjDTOCopyWithImpl<$Res>
    implements _$CommentairePjDTOCopyWith<$Res> {
  __$CommentairePjDTOCopyWithImpl(this._self, this._then);

  final _CommentairePjDTO _self;
  final $Res Function(_CommentairePjDTO) _then;

/// Create a copy of CommentairePjDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? location = null,}) {
  return _then(_CommentairePjDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
