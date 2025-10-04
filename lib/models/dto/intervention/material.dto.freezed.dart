// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaterialDTO {

 int? get localId; int? get id; String get name; double get quantity; int? get idIntervention; bool? get isSync;
/// Create a copy of MaterialDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialDTOCopyWith<MaterialDTO> get copyWith => _$MaterialDTOCopyWithImpl<MaterialDTO>(this as MaterialDTO, _$identity);

  /// Serializes this MaterialDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,quantity,idIntervention,isSync);

@override
String toString() {
  return 'MaterialDTO(localId: $localId, id: $id, name: $name, quantity: $quantity, idIntervention: $idIntervention, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $MaterialDTOCopyWith<$Res>  {
  factory $MaterialDTOCopyWith(MaterialDTO value, $Res Function(MaterialDTO) _then) = _$MaterialDTOCopyWithImpl;
@useResult
$Res call({
 int? localId, int? id, String name, double quantity, int? idIntervention, bool? isSync
});




}
/// @nodoc
class _$MaterialDTOCopyWithImpl<$Res>
    implements $MaterialDTOCopyWith<$Res> {
  _$MaterialDTOCopyWithImpl(this._self, this._then);

  final MaterialDTO _self;
  final $Res Function(MaterialDTO) _then;

/// Create a copy of MaterialDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? quantity = null,Object? idIntervention = freezed,Object? isSync = freezed,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,idIntervention: freezed == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as int?,isSync: freezed == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MaterialDTO implements MaterialDTO {
  const _MaterialDTO({this.localId, this.id, required this.name, required this.quantity, this.idIntervention, this.isSync});
  factory _MaterialDTO.fromJson(Map<String, dynamic> json) => _$MaterialDTOFromJson(json);

@override final  int? localId;
@override final  int? id;
@override final  String name;
@override final  double quantity;
@override final  int? idIntervention;
@override final  bool? isSync;

/// Create a copy of MaterialDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaterialDTOCopyWith<_MaterialDTO> get copyWith => __$MaterialDTOCopyWithImpl<_MaterialDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaterialDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,quantity,idIntervention,isSync);

@override
String toString() {
  return 'MaterialDTO(localId: $localId, id: $id, name: $name, quantity: $quantity, idIntervention: $idIntervention, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$MaterialDTOCopyWith<$Res> implements $MaterialDTOCopyWith<$Res> {
  factory _$MaterialDTOCopyWith(_MaterialDTO value, $Res Function(_MaterialDTO) _then) = __$MaterialDTOCopyWithImpl;
@override @useResult
$Res call({
 int? localId, int? id, String name, double quantity, int? idIntervention, bool? isSync
});




}
/// @nodoc
class __$MaterialDTOCopyWithImpl<$Res>
    implements _$MaterialDTOCopyWith<$Res> {
  __$MaterialDTOCopyWithImpl(this._self, this._then);

  final _MaterialDTO _self;
  final $Res Function(_MaterialDTO) _then;

/// Create a copy of MaterialDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? quantity = null,Object? idIntervention = freezed,Object? isSync = freezed,}) {
  return _then(_MaterialDTO(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,idIntervention: freezed == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as int?,isSync: freezed == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
