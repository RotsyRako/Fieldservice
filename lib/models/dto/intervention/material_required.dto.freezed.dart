// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_required.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaterialRequiredDTO {

 int? get localId; int? get id; String get name; int? get idIntervention;
/// Create a copy of MaterialRequiredDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialRequiredDTOCopyWith<MaterialRequiredDTO> get copyWith => _$MaterialRequiredDTOCopyWithImpl<MaterialRequiredDTO>(this as MaterialRequiredDTO, _$identity);

  /// Serializes this MaterialRequiredDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialRequiredDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,idIntervention);

@override
String toString() {
  return 'MaterialRequiredDTO(localId: $localId, id: $id, name: $name, idIntervention: $idIntervention)';
}


}

/// @nodoc
abstract mixin class $MaterialRequiredDTOCopyWith<$Res>  {
  factory $MaterialRequiredDTOCopyWith(MaterialRequiredDTO value, $Res Function(MaterialRequiredDTO) _then) = _$MaterialRequiredDTOCopyWithImpl;
@useResult
$Res call({
 int? localId, int? id, String name, int? idIntervention
});




}
/// @nodoc
class _$MaterialRequiredDTOCopyWithImpl<$Res>
    implements $MaterialRequiredDTOCopyWith<$Res> {
  _$MaterialRequiredDTOCopyWithImpl(this._self, this._then);

  final MaterialRequiredDTO _self;
  final $Res Function(MaterialRequiredDTO) _then;

/// Create a copy of MaterialRequiredDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? idIntervention = freezed,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,idIntervention: freezed == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MaterialRequiredDTO implements MaterialRequiredDTO {
  const _MaterialRequiredDTO({this.localId, this.id, required this.name, this.idIntervention});
  factory _MaterialRequiredDTO.fromJson(Map<String, dynamic> json) => _$MaterialRequiredDTOFromJson(json);

@override final  int? localId;
@override final  int? id;
@override final  String name;
@override final  int? idIntervention;

/// Create a copy of MaterialRequiredDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaterialRequiredDTOCopyWith<_MaterialRequiredDTO> get copyWith => __$MaterialRequiredDTOCopyWithImpl<_MaterialRequiredDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaterialRequiredDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialRequiredDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,idIntervention);

@override
String toString() {
  return 'MaterialRequiredDTO(localId: $localId, id: $id, name: $name, idIntervention: $idIntervention)';
}


}

/// @nodoc
abstract mixin class _$MaterialRequiredDTOCopyWith<$Res> implements $MaterialRequiredDTOCopyWith<$Res> {
  factory _$MaterialRequiredDTOCopyWith(_MaterialRequiredDTO value, $Res Function(_MaterialRequiredDTO) _then) = __$MaterialRequiredDTOCopyWithImpl;
@override @useResult
$Res call({
 int? localId, int? id, String name, int? idIntervention
});




}
/// @nodoc
class __$MaterialRequiredDTOCopyWithImpl<$Res>
    implements _$MaterialRequiredDTOCopyWith<$Res> {
  __$MaterialRequiredDTOCopyWithImpl(this._self, this._then);

  final _MaterialRequiredDTO _self;
  final $Res Function(_MaterialRequiredDTO) _then;

/// Create a copy of MaterialRequiredDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? idIntervention = freezed,}) {
  return _then(_MaterialRequiredDTO(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,idIntervention: freezed == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
