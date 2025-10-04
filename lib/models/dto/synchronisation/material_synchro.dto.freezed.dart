// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_synchro.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaterialSynchroDTO {

 int get id; String get name; double get quantity;
/// Create a copy of MaterialSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialSynchroDTOCopyWith<MaterialSynchroDTO> get copyWith => _$MaterialSynchroDTOCopyWithImpl<MaterialSynchroDTO>(this as MaterialSynchroDTO, _$identity);

  /// Serializes this MaterialSynchroDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialSynchroDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,quantity);

@override
String toString() {
  return 'MaterialSynchroDTO(id: $id, name: $name, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $MaterialSynchroDTOCopyWith<$Res>  {
  factory $MaterialSynchroDTOCopyWith(MaterialSynchroDTO value, $Res Function(MaterialSynchroDTO) _then) = _$MaterialSynchroDTOCopyWithImpl;
@useResult
$Res call({
 int id, String name, double quantity
});




}
/// @nodoc
class _$MaterialSynchroDTOCopyWithImpl<$Res>
    implements $MaterialSynchroDTOCopyWith<$Res> {
  _$MaterialSynchroDTOCopyWithImpl(this._self, this._then);

  final MaterialSynchroDTO _self;
  final $Res Function(MaterialSynchroDTO) _then;

/// Create a copy of MaterialSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MaterialSynchroDTO implements MaterialSynchroDTO {
  const _MaterialSynchroDTO({required this.id, required this.name, required this.quantity});
  factory _MaterialSynchroDTO.fromJson(Map<String, dynamic> json) => _$MaterialSynchroDTOFromJson(json);

@override final  int id;
@override final  String name;
@override final  double quantity;

/// Create a copy of MaterialSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaterialSynchroDTOCopyWith<_MaterialSynchroDTO> get copyWith => __$MaterialSynchroDTOCopyWithImpl<_MaterialSynchroDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaterialSynchroDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialSynchroDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,quantity);

@override
String toString() {
  return 'MaterialSynchroDTO(id: $id, name: $name, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$MaterialSynchroDTOCopyWith<$Res> implements $MaterialSynchroDTOCopyWith<$Res> {
  factory _$MaterialSynchroDTOCopyWith(_MaterialSynchroDTO value, $Res Function(_MaterialSynchroDTO) _then) = __$MaterialSynchroDTOCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, double quantity
});




}
/// @nodoc
class __$MaterialSynchroDTOCopyWithImpl<$Res>
    implements _$MaterialSynchroDTOCopyWith<$Res> {
  __$MaterialSynchroDTOCopyWithImpl(this._self, this._then);

  final _MaterialSynchroDTO _self;
  final $Res Function(_MaterialSynchroDTO) _then;

/// Create a copy of MaterialSynchroDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? quantity = null,}) {
  return _then(_MaterialSynchroDTO(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
