// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'document.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DocumentDTO {

 int? get localId; int? get id; String get name; String get location; int get idIntervention; bool? get isSync;
/// Create a copy of DocumentDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DocumentDTOCopyWith<DocumentDTO> get copyWith => _$DocumentDTOCopyWithImpl<DocumentDTO>(this as DocumentDTO, _$identity);

  /// Serializes this DocumentDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DocumentDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,location,idIntervention,isSync);

@override
String toString() {
  return 'DocumentDTO(localId: $localId, id: $id, name: $name, location: $location, idIntervention: $idIntervention, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $DocumentDTOCopyWith<$Res>  {
  factory $DocumentDTOCopyWith(DocumentDTO value, $Res Function(DocumentDTO) _then) = _$DocumentDTOCopyWithImpl;
@useResult
$Res call({
 int? localId, int? id, String name, String location, int idIntervention, bool? isSync
});




}
/// @nodoc
class _$DocumentDTOCopyWithImpl<$Res>
    implements $DocumentDTOCopyWith<$Res> {
  _$DocumentDTOCopyWithImpl(this._self, this._then);

  final DocumentDTO _self;
  final $Res Function(DocumentDTO) _then;

/// Create a copy of DocumentDTO
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

class _DocumentDTO implements DocumentDTO {
  const _DocumentDTO({this.localId, this.id, required this.name, required this.location, required this.idIntervention, this.isSync});
  factory _DocumentDTO.fromJson(Map<String, dynamic> json) => _$DocumentDTOFromJson(json);

@override final  int? localId;
@override final  int? id;
@override final  String name;
@override final  String location;
@override final  int idIntervention;
@override final  bool? isSync;

/// Create a copy of DocumentDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DocumentDTOCopyWith<_DocumentDTO> get copyWith => __$DocumentDTOCopyWithImpl<_DocumentDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DocumentDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DocumentDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.location, location) || other.location == location)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,location,idIntervention,isSync);

@override
String toString() {
  return 'DocumentDTO(localId: $localId, id: $id, name: $name, location: $location, idIntervention: $idIntervention, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$DocumentDTOCopyWith<$Res> implements $DocumentDTOCopyWith<$Res> {
  factory _$DocumentDTOCopyWith(_DocumentDTO value, $Res Function(_DocumentDTO) _then) = __$DocumentDTOCopyWithImpl;
@override @useResult
$Res call({
 int? localId, int? id, String name, String location, int idIntervention, bool? isSync
});




}
/// @nodoc
class __$DocumentDTOCopyWithImpl<$Res>
    implements _$DocumentDTOCopyWith<$Res> {
  __$DocumentDTOCopyWithImpl(this._self, this._then);

  final _DocumentDTO _self;
  final $Res Function(_DocumentDTO) _then;

/// Create a copy of DocumentDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? location = null,Object? idIntervention = null,Object? isSync = freezed,}) {
  return _then(_DocumentDTO(
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
