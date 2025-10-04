// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intervention.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterventionDTO {

 int? get localId; int? get id; String get title; String? get dateStart; String? get dateEnd; int get status; String get priority;// La réponse envoie "0"/"1" comme String
 String get description; String get customer; double get long; double get lat; String? get telephone; String get address; double get distance; List<MaterialRequiredDTO>? get materialRequired; String? get signature; bool? get isSync; int? get timerStatus; int? get elapsedSeconds;
/// Create a copy of InterventionDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterventionDTOCopyWith<InterventionDTO> get copyWith => _$InterventionDTOCopyWithImpl<InterventionDTO>(this as InterventionDTO, _$identity);

  /// Serializes this InterventionDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterventionDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.dateStart, dateStart) || other.dateStart == dateStart)&&(identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.description, description) || other.description == description)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.long, long) || other.long == long)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.address, address) || other.address == address)&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other.materialRequired, materialRequired)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.isSync, isSync) || other.isSync == isSync)&&(identical(other.timerStatus, timerStatus) || other.timerStatus == timerStatus)&&(identical(other.elapsedSeconds, elapsedSeconds) || other.elapsedSeconds == elapsedSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,localId,id,title,dateStart,dateEnd,status,priority,description,customer,long,lat,telephone,address,distance,const DeepCollectionEquality().hash(materialRequired),signature,isSync,timerStatus,elapsedSeconds]);

@override
String toString() {
  return 'InterventionDTO(localId: $localId, id: $id, title: $title, dateStart: $dateStart, dateEnd: $dateEnd, status: $status, priority: $priority, description: $description, customer: $customer, long: $long, lat: $lat, telephone: $telephone, address: $address, distance: $distance, materialRequired: $materialRequired, signature: $signature, isSync: $isSync, timerStatus: $timerStatus, elapsedSeconds: $elapsedSeconds)';
}


}

/// @nodoc
abstract mixin class $InterventionDTOCopyWith<$Res>  {
  factory $InterventionDTOCopyWith(InterventionDTO value, $Res Function(InterventionDTO) _then) = _$InterventionDTOCopyWithImpl;
@useResult
$Res call({
 int? localId, int? id, String title, String? dateStart, String? dateEnd, int status, String priority, String description, String customer, double long, double lat, String? telephone, String address, double distance, List<MaterialRequiredDTO>? materialRequired, String? signature, bool? isSync, int? timerStatus, int? elapsedSeconds
});




}
/// @nodoc
class _$InterventionDTOCopyWithImpl<$Res>
    implements $InterventionDTOCopyWith<$Res> {
  _$InterventionDTOCopyWithImpl(this._self, this._then);

  final InterventionDTO _self;
  final $Res Function(InterventionDTO) _then;

/// Create a copy of InterventionDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? title = null,Object? dateStart = freezed,Object? dateEnd = freezed,Object? status = null,Object? priority = null,Object? description = null,Object? customer = null,Object? long = null,Object? lat = null,Object? telephone = freezed,Object? address = null,Object? distance = null,Object? materialRequired = freezed,Object? signature = freezed,Object? isSync = freezed,Object? timerStatus = freezed,Object? elapsedSeconds = freezed,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,dateStart: freezed == dateStart ? _self.dateStart : dateStart // ignore: cast_nullable_to_non_nullable
as String?,dateEnd: freezed == dateEnd ? _self.dateEnd : dateEnd // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,materialRequired: freezed == materialRequired ? _self.materialRequired : materialRequired // ignore: cast_nullable_to_non_nullable
as List<MaterialRequiredDTO>?,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,isSync: freezed == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool?,timerStatus: freezed == timerStatus ? _self.timerStatus : timerStatus // ignore: cast_nullable_to_non_nullable
as int?,elapsedSeconds: freezed == elapsedSeconds ? _self.elapsedSeconds : elapsedSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _InterventionDTO implements InterventionDTO {
  const _InterventionDTO({this.localId, this.id, required this.title, this.dateStart, this.dateEnd, required this.status, required this.priority, required this.description, required this.customer, required this.long, required this.lat, this.telephone, required this.address, required this.distance, final  List<MaterialRequiredDTO>? materialRequired, this.signature, this.isSync, this.timerStatus, this.elapsedSeconds}): _materialRequired = materialRequired;
  factory _InterventionDTO.fromJson(Map<String, dynamic> json) => _$InterventionDTOFromJson(json);

@override final  int? localId;
@override final  int? id;
@override final  String title;
@override final  String? dateStart;
@override final  String? dateEnd;
@override final  int status;
@override final  String priority;
// La réponse envoie "0"/"1" comme String
@override final  String description;
@override final  String customer;
@override final  double long;
@override final  double lat;
@override final  String? telephone;
@override final  String address;
@override final  double distance;
 final  List<MaterialRequiredDTO>? _materialRequired;
@override List<MaterialRequiredDTO>? get materialRequired {
  final value = _materialRequired;
  if (value == null) return null;
  if (_materialRequired is EqualUnmodifiableListView) return _materialRequired;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? signature;
@override final  bool? isSync;
@override final  int? timerStatus;
@override final  int? elapsedSeconds;

/// Create a copy of InterventionDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterventionDTOCopyWith<_InterventionDTO> get copyWith => __$InterventionDTOCopyWithImpl<_InterventionDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterventionDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterventionDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.dateStart, dateStart) || other.dateStart == dateStart)&&(identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.description, description) || other.description == description)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.long, long) || other.long == long)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.telephone, telephone) || other.telephone == telephone)&&(identical(other.address, address) || other.address == address)&&(identical(other.distance, distance) || other.distance == distance)&&const DeepCollectionEquality().equals(other._materialRequired, _materialRequired)&&(identical(other.signature, signature) || other.signature == signature)&&(identical(other.isSync, isSync) || other.isSync == isSync)&&(identical(other.timerStatus, timerStatus) || other.timerStatus == timerStatus)&&(identical(other.elapsedSeconds, elapsedSeconds) || other.elapsedSeconds == elapsedSeconds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,localId,id,title,dateStart,dateEnd,status,priority,description,customer,long,lat,telephone,address,distance,const DeepCollectionEquality().hash(_materialRequired),signature,isSync,timerStatus,elapsedSeconds]);

@override
String toString() {
  return 'InterventionDTO(localId: $localId, id: $id, title: $title, dateStart: $dateStart, dateEnd: $dateEnd, status: $status, priority: $priority, description: $description, customer: $customer, long: $long, lat: $lat, telephone: $telephone, address: $address, distance: $distance, materialRequired: $materialRequired, signature: $signature, isSync: $isSync, timerStatus: $timerStatus, elapsedSeconds: $elapsedSeconds)';
}


}

/// @nodoc
abstract mixin class _$InterventionDTOCopyWith<$Res> implements $InterventionDTOCopyWith<$Res> {
  factory _$InterventionDTOCopyWith(_InterventionDTO value, $Res Function(_InterventionDTO) _then) = __$InterventionDTOCopyWithImpl;
@override @useResult
$Res call({
 int? localId, int? id, String title, String? dateStart, String? dateEnd, int status, String priority, String description, String customer, double long, double lat, String? telephone, String address, double distance, List<MaterialRequiredDTO>? materialRequired, String? signature, bool? isSync, int? timerStatus, int? elapsedSeconds
});




}
/// @nodoc
class __$InterventionDTOCopyWithImpl<$Res>
    implements _$InterventionDTOCopyWith<$Res> {
  __$InterventionDTOCopyWithImpl(this._self, this._then);

  final _InterventionDTO _self;
  final $Res Function(_InterventionDTO) _then;

/// Create a copy of InterventionDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? title = null,Object? dateStart = freezed,Object? dateEnd = freezed,Object? status = null,Object? priority = null,Object? description = null,Object? customer = null,Object? long = null,Object? lat = null,Object? telephone = freezed,Object? address = null,Object? distance = null,Object? materialRequired = freezed,Object? signature = freezed,Object? isSync = freezed,Object? timerStatus = freezed,Object? elapsedSeconds = freezed,}) {
  return _then(_InterventionDTO(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,dateStart: freezed == dateStart ? _self.dateStart : dateStart // ignore: cast_nullable_to_non_nullable
as String?,dateEnd: freezed == dateEnd ? _self.dateEnd : dateEnd // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,telephone: freezed == telephone ? _self.telephone : telephone // ignore: cast_nullable_to_non_nullable
as String?,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,materialRequired: freezed == materialRequired ? _self._materialRequired : materialRequired // ignore: cast_nullable_to_non_nullable
as List<MaterialRequiredDTO>?,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as String?,isSync: freezed == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool?,timerStatus: freezed == timerStatus ? _self.timerStatus : timerStatus // ignore: cast_nullable_to_non_nullable
as int?,elapsedSeconds: freezed == elapsedSeconds ? _self.elapsedSeconds : elapsedSeconds // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
