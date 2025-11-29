// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intervention_complete.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterventionCompleteDto {

/// ID de l'intervention
 String? get id;/// Titre de l'intervention
 String get titre;/// Date de début au format string
 String get dateStart;/// Date de fin au format string
 String get dateEnd;/// Statut de l'intervention (1=planifié, 2=en cours, 3=terminé)
 int get status;/// Priorité (haute, moyenne, basse)
 String get priority;/// Nom du client
 String get customer;/// Longitude
 double get long;/// Latitude
 double get lat;/// Distance en km
 double get distance;/// Description de l'intervention
 String get description;/// Date de création
 DateTime? get createdAt;/// Date de mise à jour
 DateTime? get updatedAt;/// ID de l'utilisateur
 String get userId;/// Liste des matériaux
@JsonKey(name: 'materiels') List<MaterialDto> get materiels;/// Liste des feuilles de temps
 List<TimesheetDto> get timesheets;/// Liste des images
 List<ImageDto> get images;/// Liste des documents
 List<DocumentDto> get documents;/// Liste des commentaires
 List<CommentDto> get comments;/// Liste des signatures
 List<SignatureDto> get signatures;
/// Create a copy of InterventionCompleteDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterventionCompleteDtoCopyWith<InterventionCompleteDto> get copyWith => _$InterventionCompleteDtoCopyWithImpl<InterventionCompleteDto>(this as InterventionCompleteDto, _$identity);

  /// Serializes this InterventionCompleteDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterventionCompleteDto&&(identical(other.id, id) || other.id == id)&&(identical(other.titre, titre) || other.titre == titre)&&(identical(other.dateStart, dateStart) || other.dateStart == dateStart)&&(identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.long, long) || other.long == long)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.materiels, materiels)&&const DeepCollectionEquality().equals(other.timesheets, timesheets)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.documents, documents)&&const DeepCollectionEquality().equals(other.comments, comments)&&const DeepCollectionEquality().equals(other.signatures, signatures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,titre,dateStart,dateEnd,status,priority,customer,long,lat,distance,description,createdAt,updatedAt,userId,const DeepCollectionEquality().hash(materiels),const DeepCollectionEquality().hash(timesheets),const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(documents),const DeepCollectionEquality().hash(comments),const DeepCollectionEquality().hash(signatures)]);

@override
String toString() {
  return 'InterventionCompleteDto(id: $id, titre: $titre, dateStart: $dateStart, dateEnd: $dateEnd, status: $status, priority: $priority, customer: $customer, long: $long, lat: $lat, distance: $distance, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, materiels: $materiels, timesheets: $timesheets, images: $images, documents: $documents, comments: $comments, signatures: $signatures)';
}


}

/// @nodoc
abstract mixin class $InterventionCompleteDtoCopyWith<$Res>  {
  factory $InterventionCompleteDtoCopyWith(InterventionCompleteDto value, $Res Function(InterventionCompleteDto) _then) = _$InterventionCompleteDtoCopyWithImpl;
@useResult
$Res call({
 String? id, String titre, String dateStart, String dateEnd, int status, String priority, String customer, double long, double lat, double distance, String description, DateTime? createdAt, DateTime? updatedAt, String userId,@JsonKey(name: 'materiels') List<MaterialDto> materiels, List<TimesheetDto> timesheets, List<ImageDto> images, List<DocumentDto> documents, List<CommentDto> comments, List<SignatureDto> signatures
});




}
/// @nodoc
class _$InterventionCompleteDtoCopyWithImpl<$Res>
    implements $InterventionCompleteDtoCopyWith<$Res> {
  _$InterventionCompleteDtoCopyWithImpl(this._self, this._then);

  final InterventionCompleteDto _self;
  final $Res Function(InterventionCompleteDto) _then;

/// Create a copy of InterventionCompleteDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? titre = null,Object? dateStart = null,Object? dateEnd = null,Object? status = null,Object? priority = null,Object? customer = null,Object? long = null,Object? lat = null,Object? distance = null,Object? description = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? userId = null,Object? materiels = null,Object? timesheets = null,Object? images = null,Object? documents = null,Object? comments = null,Object? signatures = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,titre: null == titre ? _self.titre : titre // ignore: cast_nullable_to_non_nullable
as String,dateStart: null == dateStart ? _self.dateStart : dateStart // ignore: cast_nullable_to_non_nullable
as String,dateEnd: null == dateEnd ? _self.dateEnd : dateEnd // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,materiels: null == materiels ? _self.materiels : materiels // ignore: cast_nullable_to_non_nullable
as List<MaterialDto>,timesheets: null == timesheets ? _self.timesheets : timesheets // ignore: cast_nullable_to_non_nullable
as List<TimesheetDto>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ImageDto>,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocumentDto>,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentDto>,signatures: null == signatures ? _self.signatures : signatures // ignore: cast_nullable_to_non_nullable
as List<SignatureDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [InterventionCompleteDto].
extension InterventionCompleteDtoPatterns on InterventionCompleteDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterventionCompleteDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterventionCompleteDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterventionCompleteDto value)  $default,){
final _that = this;
switch (_that) {
case _InterventionCompleteDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterventionCompleteDto value)?  $default,){
final _that = this;
switch (_that) {
case _InterventionCompleteDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String titre,  String dateStart,  String dateEnd,  int status,  String priority,  String customer,  double long,  double lat,  double distance,  String description,  DateTime? createdAt,  DateTime? updatedAt,  String userId, @JsonKey(name: 'materiels')  List<MaterialDto> materiels,  List<TimesheetDto> timesheets,  List<ImageDto> images,  List<DocumentDto> documents,  List<CommentDto> comments,  List<SignatureDto> signatures)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterventionCompleteDto() when $default != null:
return $default(_that.id,_that.titre,_that.dateStart,_that.dateEnd,_that.status,_that.priority,_that.customer,_that.long,_that.lat,_that.distance,_that.description,_that.createdAt,_that.updatedAt,_that.userId,_that.materiels,_that.timesheets,_that.images,_that.documents,_that.comments,_that.signatures);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String titre,  String dateStart,  String dateEnd,  int status,  String priority,  String customer,  double long,  double lat,  double distance,  String description,  DateTime? createdAt,  DateTime? updatedAt,  String userId, @JsonKey(name: 'materiels')  List<MaterialDto> materiels,  List<TimesheetDto> timesheets,  List<ImageDto> images,  List<DocumentDto> documents,  List<CommentDto> comments,  List<SignatureDto> signatures)  $default,) {final _that = this;
switch (_that) {
case _InterventionCompleteDto():
return $default(_that.id,_that.titre,_that.dateStart,_that.dateEnd,_that.status,_that.priority,_that.customer,_that.long,_that.lat,_that.distance,_that.description,_that.createdAt,_that.updatedAt,_that.userId,_that.materiels,_that.timesheets,_that.images,_that.documents,_that.comments,_that.signatures);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String titre,  String dateStart,  String dateEnd,  int status,  String priority,  String customer,  double long,  double lat,  double distance,  String description,  DateTime? createdAt,  DateTime? updatedAt,  String userId, @JsonKey(name: 'materiels')  List<MaterialDto> materiels,  List<TimesheetDto> timesheets,  List<ImageDto> images,  List<DocumentDto> documents,  List<CommentDto> comments,  List<SignatureDto> signatures)?  $default,) {final _that = this;
switch (_that) {
case _InterventionCompleteDto() when $default != null:
return $default(_that.id,_that.titre,_that.dateStart,_that.dateEnd,_that.status,_that.priority,_that.customer,_that.long,_that.lat,_that.distance,_that.description,_that.createdAt,_that.updatedAt,_that.userId,_that.materiels,_that.timesheets,_that.images,_that.documents,_that.comments,_that.signatures);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterventionCompleteDto implements InterventionCompleteDto {
  const _InterventionCompleteDto({this.id, required this.titre, required this.dateStart, required this.dateEnd, required this.status, required this.priority, required this.customer, required this.long, required this.lat, required this.distance, required this.description, this.createdAt, this.updatedAt, required this.userId, @JsonKey(name: 'materiels') final  List<MaterialDto> materiels = const [], final  List<TimesheetDto> timesheets = const [], final  List<ImageDto> images = const [], final  List<DocumentDto> documents = const [], final  List<CommentDto> comments = const [], final  List<SignatureDto> signatures = const []}): _materiels = materiels,_timesheets = timesheets,_images = images,_documents = documents,_comments = comments,_signatures = signatures;
  factory _InterventionCompleteDto.fromJson(Map<String, dynamic> json) => _$InterventionCompleteDtoFromJson(json);

/// ID de l'intervention
@override final  String? id;
/// Titre de l'intervention
@override final  String titre;
/// Date de début au format string
@override final  String dateStart;
/// Date de fin au format string
@override final  String dateEnd;
/// Statut de l'intervention (1=planifié, 2=en cours, 3=terminé)
@override final  int status;
/// Priorité (haute, moyenne, basse)
@override final  String priority;
/// Nom du client
@override final  String customer;
/// Longitude
@override final  double long;
/// Latitude
@override final  double lat;
/// Distance en km
@override final  double distance;
/// Description de l'intervention
@override final  String description;
/// Date de création
@override final  DateTime? createdAt;
/// Date de mise à jour
@override final  DateTime? updatedAt;
/// ID de l'utilisateur
@override final  String userId;
/// Liste des matériaux
 final  List<MaterialDto> _materiels;
/// Liste des matériaux
@override@JsonKey(name: 'materiels') List<MaterialDto> get materiels {
  if (_materiels is EqualUnmodifiableListView) return _materiels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_materiels);
}

/// Liste des feuilles de temps
 final  List<TimesheetDto> _timesheets;
/// Liste des feuilles de temps
@override@JsonKey() List<TimesheetDto> get timesheets {
  if (_timesheets is EqualUnmodifiableListView) return _timesheets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timesheets);
}

/// Liste des images
 final  List<ImageDto> _images;
/// Liste des images
@override@JsonKey() List<ImageDto> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

/// Liste des documents
 final  List<DocumentDto> _documents;
/// Liste des documents
@override@JsonKey() List<DocumentDto> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

/// Liste des commentaires
 final  List<CommentDto> _comments;
/// Liste des commentaires
@override@JsonKey() List<CommentDto> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

/// Liste des signatures
 final  List<SignatureDto> _signatures;
/// Liste des signatures
@override@JsonKey() List<SignatureDto> get signatures {
  if (_signatures is EqualUnmodifiableListView) return _signatures;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_signatures);
}


/// Create a copy of InterventionCompleteDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterventionCompleteDtoCopyWith<_InterventionCompleteDto> get copyWith => __$InterventionCompleteDtoCopyWithImpl<_InterventionCompleteDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterventionCompleteDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterventionCompleteDto&&(identical(other.id, id) || other.id == id)&&(identical(other.titre, titre) || other.titre == titre)&&(identical(other.dateStart, dateStart) || other.dateStart == dateStart)&&(identical(other.dateEnd, dateEnd) || other.dateEnd == dateEnd)&&(identical(other.status, status) || other.status == status)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.customer, customer) || other.customer == customer)&&(identical(other.long, long) || other.long == long)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.distance, distance) || other.distance == distance)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._materiels, _materiels)&&const DeepCollectionEquality().equals(other._timesheets, _timesheets)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._documents, _documents)&&const DeepCollectionEquality().equals(other._comments, _comments)&&const DeepCollectionEquality().equals(other._signatures, _signatures));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,titre,dateStart,dateEnd,status,priority,customer,long,lat,distance,description,createdAt,updatedAt,userId,const DeepCollectionEquality().hash(_materiels),const DeepCollectionEquality().hash(_timesheets),const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_documents),const DeepCollectionEquality().hash(_comments),const DeepCollectionEquality().hash(_signatures)]);

@override
String toString() {
  return 'InterventionCompleteDto(id: $id, titre: $titre, dateStart: $dateStart, dateEnd: $dateEnd, status: $status, priority: $priority, customer: $customer, long: $long, lat: $lat, distance: $distance, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, materiels: $materiels, timesheets: $timesheets, images: $images, documents: $documents, comments: $comments, signatures: $signatures)';
}


}

/// @nodoc
abstract mixin class _$InterventionCompleteDtoCopyWith<$Res> implements $InterventionCompleteDtoCopyWith<$Res> {
  factory _$InterventionCompleteDtoCopyWith(_InterventionCompleteDto value, $Res Function(_InterventionCompleteDto) _then) = __$InterventionCompleteDtoCopyWithImpl;
@override @useResult
$Res call({
 String? id, String titre, String dateStart, String dateEnd, int status, String priority, String customer, double long, double lat, double distance, String description, DateTime? createdAt, DateTime? updatedAt, String userId,@JsonKey(name: 'materiels') List<MaterialDto> materiels, List<TimesheetDto> timesheets, List<ImageDto> images, List<DocumentDto> documents, List<CommentDto> comments, List<SignatureDto> signatures
});




}
/// @nodoc
class __$InterventionCompleteDtoCopyWithImpl<$Res>
    implements _$InterventionCompleteDtoCopyWith<$Res> {
  __$InterventionCompleteDtoCopyWithImpl(this._self, this._then);

  final _InterventionCompleteDto _self;
  final $Res Function(_InterventionCompleteDto) _then;

/// Create a copy of InterventionCompleteDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? titre = null,Object? dateStart = null,Object? dateEnd = null,Object? status = null,Object? priority = null,Object? customer = null,Object? long = null,Object? lat = null,Object? distance = null,Object? description = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? userId = null,Object? materiels = null,Object? timesheets = null,Object? images = null,Object? documents = null,Object? comments = null,Object? signatures = null,}) {
  return _then(_InterventionCompleteDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,titre: null == titre ? _self.titre : titre // ignore: cast_nullable_to_non_nullable
as String,dateStart: null == dateStart ? _self.dateStart : dateStart // ignore: cast_nullable_to_non_nullable
as String,dateEnd: null == dateEnd ? _self.dateEnd : dateEnd // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as String,customer: null == customer ? _self.customer : customer // ignore: cast_nullable_to_non_nullable
as String,long: null == long ? _self.long : long // ignore: cast_nullable_to_non_nullable
as double,lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,distance: null == distance ? _self.distance : distance // ignore: cast_nullable_to_non_nullable
as double,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,materiels: null == materiels ? _self._materiels : materiels // ignore: cast_nullable_to_non_nullable
as List<MaterialDto>,timesheets: null == timesheets ? _self._timesheets : timesheets // ignore: cast_nullable_to_non_nullable
as List<TimesheetDto>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ImageDto>,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocumentDto>,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentDto>,signatures: null == signatures ? _self._signatures : signatures // ignore: cast_nullable_to_non_nullable
as List<SignatureDto>,
  ));
}


}

// dart format on
