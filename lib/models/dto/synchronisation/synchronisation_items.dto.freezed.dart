// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'synchronisation_items.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
SynchronisationItemsDTO _$SynchronisationItemsDTOFromJson(
  Map<String, dynamic> json
) {
    return _PhotoDTO.fromJson(
      json
    );
}

/// @nodoc
mixin _$SynchronisationItemsDTO {

 int get id; String get title;
/// Create a copy of SynchronisationItemsDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SynchronisationItemsDTOCopyWith<SynchronisationItemsDTO> get copyWith => _$SynchronisationItemsDTOCopyWithImpl<SynchronisationItemsDTO>(this as SynchronisationItemsDTO, _$identity);

  /// Serializes this SynchronisationItemsDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SynchronisationItemsDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'SynchronisationItemsDTO(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class $SynchronisationItemsDTOCopyWith<$Res>  {
  factory $SynchronisationItemsDTOCopyWith(SynchronisationItemsDTO value, $Res Function(SynchronisationItemsDTO) _then) = _$SynchronisationItemsDTOCopyWithImpl;
@useResult
$Res call({
 int id, String title
});




}
/// @nodoc
class _$SynchronisationItemsDTOCopyWithImpl<$Res>
    implements $SynchronisationItemsDTOCopyWith<$Res> {
  _$SynchronisationItemsDTOCopyWithImpl(this._self, this._then);

  final SynchronisationItemsDTO _self;
  final $Res Function(SynchronisationItemsDTO) _then;

/// Create a copy of SynchronisationItemsDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PhotoDTO implements SynchronisationItemsDTO {
  const _PhotoDTO({required this.id, required this.title});
  factory _PhotoDTO.fromJson(Map<String, dynamic> json) => _$PhotoDTOFromJson(json);

@override final  int id;
@override final  String title;

/// Create a copy of SynchronisationItemsDTO
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title);

@override
String toString() {
  return 'SynchronisationItemsDTO(id: $id, title: $title)';
}


}

/// @nodoc
abstract mixin class _$PhotoDTOCopyWith<$Res> implements $SynchronisationItemsDTOCopyWith<$Res> {
  factory _$PhotoDTOCopyWith(_PhotoDTO value, $Res Function(_PhotoDTO) _then) = __$PhotoDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String title
});




}
/// @nodoc
class __$PhotoDTOCopyWithImpl<$Res>
    implements _$PhotoDTOCopyWith<$Res> {
  __$PhotoDTOCopyWithImpl(this._self, this._then);

  final _PhotoDTO _self;
  final $Res Function(_PhotoDTO) _then;

/// Create a copy of SynchronisationItemsDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,}) {
  return _then(_PhotoDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
