// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'temps_intervention.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TempsInterventionDTO {

 int? get localId; int? get id; String get date; String get temps; String get description; int get idIntervention; bool? get isSync;
/// Create a copy of TempsInterventionDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TempsInterventionDTOCopyWith<TempsInterventionDTO> get copyWith => _$TempsInterventionDTOCopyWithImpl<TempsInterventionDTO>(this as TempsInterventionDTO, _$identity);

  /// Serializes this TempsInterventionDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TempsInterventionDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.temps, temps) || other.temps == temps)&&(identical(other.description, description) || other.description == description)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,date,temps,description,idIntervention,isSync);

@override
String toString() {
  return 'TempsInterventionDTO(localId: $localId, id: $id, date: $date, temps: $temps, description: $description, idIntervention: $idIntervention, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $TempsInterventionDTOCopyWith<$Res>  {
  factory $TempsInterventionDTOCopyWith(TempsInterventionDTO value, $Res Function(TempsInterventionDTO) _then) = _$TempsInterventionDTOCopyWithImpl;
@useResult
$Res call({
 int? localId, int? id, String date, String temps, String description, int idIntervention, bool? isSync
});




}
/// @nodoc
class _$TempsInterventionDTOCopyWithImpl<$Res>
    implements $TempsInterventionDTOCopyWith<$Res> {
  _$TempsInterventionDTOCopyWithImpl(this._self, this._then);

  final TempsInterventionDTO _self;
  final $Res Function(TempsInterventionDTO) _then;

/// Create a copy of TempsInterventionDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? date = null,Object? temps = null,Object? description = null,Object? idIntervention = null,Object? isSync = freezed,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,temps: null == temps ? _self.temps : temps // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as int,isSync: freezed == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _TempsInterventionDTO implements TempsInterventionDTO {
  const _TempsInterventionDTO({this.localId, this.id, required this.date, required this.temps, required this.description, required this.idIntervention, this.isSync});
  factory _TempsInterventionDTO.fromJson(Map<String, dynamic> json) => _$TempsInterventionDTOFromJson(json);

@override final  int? localId;
@override final  int? id;
@override final  String date;
@override final  String temps;
@override final  String description;
@override final  int idIntervention;
@override final  bool? isSync;

/// Create a copy of TempsInterventionDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TempsInterventionDTOCopyWith<_TempsInterventionDTO> get copyWith => __$TempsInterventionDTOCopyWithImpl<_TempsInterventionDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TempsInterventionDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TempsInterventionDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.temps, temps) || other.temps == temps)&&(identical(other.description, description) || other.description == description)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,date,temps,description,idIntervention,isSync);

@override
String toString() {
  return 'TempsInterventionDTO(localId: $localId, id: $id, date: $date, temps: $temps, description: $description, idIntervention: $idIntervention, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$TempsInterventionDTOCopyWith<$Res> implements $TempsInterventionDTOCopyWith<$Res> {
  factory _$TempsInterventionDTOCopyWith(_TempsInterventionDTO value, $Res Function(_TempsInterventionDTO) _then) = __$TempsInterventionDTOCopyWithImpl;
@override @useResult
$Res call({
 int? localId, int? id, String date, String temps, String description, int idIntervention, bool? isSync
});




}
/// @nodoc
class __$TempsInterventionDTOCopyWithImpl<$Res>
    implements _$TempsInterventionDTOCopyWith<$Res> {
  __$TempsInterventionDTOCopyWithImpl(this._self, this._then);

  final _TempsInterventionDTO _self;
  final $Res Function(_TempsInterventionDTO) _then;

/// Create a copy of TempsInterventionDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? date = null,Object? temps = null,Object? description = null,Object? idIntervention = null,Object? isSync = freezed,}) {
  return _then(_TempsInterventionDTO(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,temps: null == temps ? _self.temps : temps // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as int,isSync: freezed == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
