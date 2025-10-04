// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PhotoDTO {

 int? get localId; int? get id; String get name; String get location; int get idIntervention; bool? get isSync;
/// Create a copy of PhotoDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoDTOCopyWith<PhotoDTO> get copyWith => _$PhotoDTOCopyWithImpl<PhotoDTO>(this as PhotoDTO, _$identity);

  /// Serializes this PhotoDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhotoDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,location,idIntervention,isSync);

@override
String toString() {
  return 'PhotoDTO(localId: $localId, id: $id, name: $name, location: $location, idIntervention: $idIntervention, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $PhotoDTOCopyWith<$Res>  {
  factory $PhotoDTOCopyWith(PhotoDTO value, $Res Function(PhotoDTO) _then) = _$PhotoDTOCopyWithImpl;
@useResult
$Res call({
 int? localId, int? id, String name, String location, int idIntervention, bool? isSync
});




}
/// @nodoc
class _$PhotoDTOCopyWithImpl<$Res>
    implements $PhotoDTOCopyWith<$Res> {
  _$PhotoDTOCopyWithImpl(this._self, this._then);

  final PhotoDTO _self;
  final $Res Function(PhotoDTO) _then;

/// Create a copy of PhotoDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? location = null,Object? idIntervention = null,Object? isSync = freezed,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as int,isSync: freezed == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _PhotoDTO implements PhotoDTO {
  const _PhotoDTO({this.localId, this.id, required this.name, required this.location, required this.idIntervention, this.isSync});
  factory _PhotoDTO.fromJson(Map<String, dynamic> json) => _$PhotoDTOFromJson(json);

@override final  int? localId;
@override final  int? id;
@override final  String name;
@override final  String location;
@override final  int idIntervention;
@override final  bool? isSync;

/// Create a copy of PhotoDTO
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhotoDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,location,idIntervention,isSync);

@override
String toString() {
  return 'PhotoDTO(localId: $localId, id: $id, name: $name, location: $location, idIntervention: $idIntervention, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$PhotoDTOCopyWith<$Res> implements $PhotoDTOCopyWith<$Res> {
  factory _$PhotoDTOCopyWith(_PhotoDTO value, $Res Function(_PhotoDTO) _then) = __$PhotoDTOCopyWithImpl;
@override @useResult
$Res call({
 int? localId, int? id, String name, String location, int idIntervention, bool? isSync
});




}
/// @nodoc
class __$PhotoDTOCopyWithImpl<$Res>
    implements _$PhotoDTOCopyWith<$Res> {
  __$PhotoDTOCopyWithImpl(this._self, this._then);

  final _PhotoDTO _self;
  final $Res Function(_PhotoDTO) _then;

/// Create a copy of PhotoDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? location = null,Object? idIntervention = null,Object? isSync = freezed,}) {
  return _then(_PhotoDTO(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as int,isSync: freezed == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
