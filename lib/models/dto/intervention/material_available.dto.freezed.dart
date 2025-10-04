// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_available.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MaterialAvailableDTO {

 int? get localId; int? get id; String get name; double get quantity;
/// Create a copy of MaterialAvailableDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaterialAvailableDTOCopyWith<MaterialAvailableDTO> get copyWith => _$MaterialAvailableDTOCopyWithImpl<MaterialAvailableDTO>(this as MaterialAvailableDTO, _$identity);

  /// Serializes this MaterialAvailableDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MaterialAvailableDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,quantity);

@override
String toString() {
  return 'MaterialAvailableDTO(localId: $localId, id: $id, name: $name, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $MaterialAvailableDTOCopyWith<$Res>  {
  factory $MaterialAvailableDTOCopyWith(MaterialAvailableDTO value, $Res Function(MaterialAvailableDTO) _then) = _$MaterialAvailableDTOCopyWithImpl;
@useResult
$Res call({
 int? localId, int? id, String name, double quantity
});




}
/// @nodoc
class _$MaterialAvailableDTOCopyWithImpl<$Res>
    implements $MaterialAvailableDTOCopyWith<$Res> {
  _$MaterialAvailableDTOCopyWithImpl(this._self, this._then);

  final MaterialAvailableDTO _self;
  final $Res Function(MaterialAvailableDTO) _then;

/// Create a copy of MaterialAvailableDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MaterialAvailableDTO implements MaterialAvailableDTO {
  const _MaterialAvailableDTO({this.localId, this.id, required this.name, required this.quantity});
  factory _MaterialAvailableDTO.fromJson(Map<String, dynamic> json) => _$MaterialAvailableDTOFromJson(json);

@override final  int? localId;
@override final  int? id;
@override final  String name;
@override final  double quantity;

/// Create a copy of MaterialAvailableDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaterialAvailableDTOCopyWith<_MaterialAvailableDTO> get copyWith => __$MaterialAvailableDTOCopyWithImpl<_MaterialAvailableDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaterialAvailableDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MaterialAvailableDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,name,quantity);

@override
String toString() {
  return 'MaterialAvailableDTO(localId: $localId, id: $id, name: $name, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$MaterialAvailableDTOCopyWith<$Res> implements $MaterialAvailableDTOCopyWith<$Res> {
  factory _$MaterialAvailableDTOCopyWith(_MaterialAvailableDTO value, $Res Function(_MaterialAvailableDTO) _then) = __$MaterialAvailableDTOCopyWithImpl;
@override @useResult
$Res call({
 int? localId, int? id, String name, double quantity
});




}
/// @nodoc
class __$MaterialAvailableDTOCopyWithImpl<$Res>
    implements _$MaterialAvailableDTOCopyWith<$Res> {
  __$MaterialAvailableDTOCopyWithImpl(this._self, this._then);

  final _MaterialAvailableDTO _self;
  final $Res Function(_MaterialAvailableDTO) _then;

/// Create a copy of MaterialAvailableDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? name = null,Object? quantity = null,}) {
  return _then(_MaterialAvailableDTO(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
