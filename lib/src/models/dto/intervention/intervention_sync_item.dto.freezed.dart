// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'intervention_sync_item.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterventionSyncItemDto {

/// ID de l'intervention à synchroniser
 String get id;/// Statut de l'intervention (1=planifié, 2=en cours, 3=terminé)
 int get status;/// Liste des matériaux
 List<Map<String, dynamic>> get materials;/// Liste des feuilles de temps
 List<Map<String, dynamic>> get timesheets;/// Liste des images
 List<Map<String, dynamic>> get images;/// Liste des documents
 List<Map<String, dynamic>> get documents;/// Signature (objet ou null)
 Map<String, dynamic>? get signature;/// Liste des commentaires
 List<Map<String, dynamic>> get comments;
/// Create a copy of InterventionSyncItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterventionSyncItemDtoCopyWith<InterventionSyncItemDto> get copyWith => _$InterventionSyncItemDtoCopyWithImpl<InterventionSyncItemDto>(this as InterventionSyncItemDto, _$identity);

  /// Serializes this InterventionSyncItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterventionSyncItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.materials, materials)&&const DeepCollectionEquality().equals(other.timesheets, timesheets)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.documents, documents)&&const DeepCollectionEquality().equals(other.signature, signature)&&const DeepCollectionEquality().equals(other.comments, comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,const DeepCollectionEquality().hash(materials),const DeepCollectionEquality().hash(timesheets),const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(documents),const DeepCollectionEquality().hash(signature),const DeepCollectionEquality().hash(comments));

@override
String toString() {
  return 'InterventionSyncItemDto(id: $id, status: $status, materials: $materials, timesheets: $timesheets, images: $images, documents: $documents, signature: $signature, comments: $comments)';
}


}

/// @nodoc
abstract mixin class $InterventionSyncItemDtoCopyWith<$Res>  {
  factory $InterventionSyncItemDtoCopyWith(InterventionSyncItemDto value, $Res Function(InterventionSyncItemDto) _then) = _$InterventionSyncItemDtoCopyWithImpl;
@useResult
$Res call({
 String id, int status, List<Map<String, dynamic>> materials, List<Map<String, dynamic>> timesheets, List<Map<String, dynamic>> images, List<Map<String, dynamic>> documents, Map<String, dynamic>? signature, List<Map<String, dynamic>> comments
});




}
/// @nodoc
class _$InterventionSyncItemDtoCopyWithImpl<$Res>
    implements $InterventionSyncItemDtoCopyWith<$Res> {
  _$InterventionSyncItemDtoCopyWithImpl(this._self, this._then);

  final InterventionSyncItemDto _self;
  final $Res Function(InterventionSyncItemDto) _then;

/// Create a copy of InterventionSyncItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? materials = null,Object? timesheets = null,Object? images = null,Object? documents = null,Object? signature = freezed,Object? comments = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,materials: null == materials ? _self.materials : materials // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,timesheets: null == timesheets ? _self.timesheets : timesheets // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,documents: null == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [InterventionSyncItemDto].
extension InterventionSyncItemDtoPatterns on InterventionSyncItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterventionSyncItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterventionSyncItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterventionSyncItemDto value)  $default,){
final _that = this;
switch (_that) {
case _InterventionSyncItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterventionSyncItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _InterventionSyncItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int status,  List<Map<String, dynamic>> materials,  List<Map<String, dynamic>> timesheets,  List<Map<String, dynamic>> images,  List<Map<String, dynamic>> documents,  Map<String, dynamic>? signature,  List<Map<String, dynamic>> comments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterventionSyncItemDto() when $default != null:
return $default(_that.id,_that.status,_that.materials,_that.timesheets,_that.images,_that.documents,_that.signature,_that.comments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int status,  List<Map<String, dynamic>> materials,  List<Map<String, dynamic>> timesheets,  List<Map<String, dynamic>> images,  List<Map<String, dynamic>> documents,  Map<String, dynamic>? signature,  List<Map<String, dynamic>> comments)  $default,) {final _that = this;
switch (_that) {
case _InterventionSyncItemDto():
return $default(_that.id,_that.status,_that.materials,_that.timesheets,_that.images,_that.documents,_that.signature,_that.comments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int status,  List<Map<String, dynamic>> materials,  List<Map<String, dynamic>> timesheets,  List<Map<String, dynamic>> images,  List<Map<String, dynamic>> documents,  Map<String, dynamic>? signature,  List<Map<String, dynamic>> comments)?  $default,) {final _that = this;
switch (_that) {
case _InterventionSyncItemDto() when $default != null:
return $default(_that.id,_that.status,_that.materials,_that.timesheets,_that.images,_that.documents,_that.signature,_that.comments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterventionSyncItemDto implements InterventionSyncItemDto {
  const _InterventionSyncItemDto({required this.id, required this.status, final  List<Map<String, dynamic>> materials = const [], final  List<Map<String, dynamic>> timesheets = const [], final  List<Map<String, dynamic>> images = const [], final  List<Map<String, dynamic>> documents = const [], final  Map<String, dynamic>? signature, final  List<Map<String, dynamic>> comments = const []}): _materials = materials,_timesheets = timesheets,_images = images,_documents = documents,_signature = signature,_comments = comments;
  factory _InterventionSyncItemDto.fromJson(Map<String, dynamic> json) => _$InterventionSyncItemDtoFromJson(json);

/// ID de l'intervention à synchroniser
@override final  String id;
/// Statut de l'intervention (1=planifié, 2=en cours, 3=terminé)
@override final  int status;
/// Liste des matériaux
 final  List<Map<String, dynamic>> _materials;
/// Liste des matériaux
@override@JsonKey() List<Map<String, dynamic>> get materials {
  if (_materials is EqualUnmodifiableListView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_materials);
}

/// Liste des feuilles de temps
 final  List<Map<String, dynamic>> _timesheets;
/// Liste des feuilles de temps
@override@JsonKey() List<Map<String, dynamic>> get timesheets {
  if (_timesheets is EqualUnmodifiableListView) return _timesheets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timesheets);
}

/// Liste des images
 final  List<Map<String, dynamic>> _images;
/// Liste des images
@override@JsonKey() List<Map<String, dynamic>> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

/// Liste des documents
 final  List<Map<String, dynamic>> _documents;
/// Liste des documents
@override@JsonKey() List<Map<String, dynamic>> get documents {
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_documents);
}

/// Signature (objet ou null)
 final  Map<String, dynamic>? _signature;
/// Signature (objet ou null)
@override Map<String, dynamic>? get signature {
  final value = _signature;
  if (value == null) return null;
  if (_signature is EqualUnmodifiableMapView) return _signature;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Liste des commentaires
 final  List<Map<String, dynamic>> _comments;
/// Liste des commentaires
@override@JsonKey() List<Map<String, dynamic>> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}


/// Create a copy of InterventionSyncItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterventionSyncItemDtoCopyWith<_InterventionSyncItemDto> get copyWith => __$InterventionSyncItemDtoCopyWithImpl<_InterventionSyncItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterventionSyncItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterventionSyncItemDto&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._materials, _materials)&&const DeepCollectionEquality().equals(other._timesheets, _timesheets)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._documents, _documents)&&const DeepCollectionEquality().equals(other._signature, _signature)&&const DeepCollectionEquality().equals(other._comments, _comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,const DeepCollectionEquality().hash(_materials),const DeepCollectionEquality().hash(_timesheets),const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_documents),const DeepCollectionEquality().hash(_signature),const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'InterventionSyncItemDto(id: $id, status: $status, materials: $materials, timesheets: $timesheets, images: $images, documents: $documents, signature: $signature, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$InterventionSyncItemDtoCopyWith<$Res> implements $InterventionSyncItemDtoCopyWith<$Res> {
  factory _$InterventionSyncItemDtoCopyWith(_InterventionSyncItemDto value, $Res Function(_InterventionSyncItemDto) _then) = __$InterventionSyncItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int status, List<Map<String, dynamic>> materials, List<Map<String, dynamic>> timesheets, List<Map<String, dynamic>> images, List<Map<String, dynamic>> documents, Map<String, dynamic>? signature, List<Map<String, dynamic>> comments
});




}
/// @nodoc
class __$InterventionSyncItemDtoCopyWithImpl<$Res>
    implements _$InterventionSyncItemDtoCopyWith<$Res> {
  __$InterventionSyncItemDtoCopyWithImpl(this._self, this._then);

  final _InterventionSyncItemDto _self;
  final $Res Function(_InterventionSyncItemDto) _then;

/// Create a copy of InterventionSyncItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? materials = null,Object? timesheets = null,Object? images = null,Object? documents = null,Object? signature = freezed,Object? comments = null,}) {
  return _then(_InterventionSyncItemDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,materials: null == materials ? _self._materials : materials // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,timesheets: null == timesheets ? _self._timesheets : timesheets // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,documents: null == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,signature: freezed == signature ? _self._signature : signature // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}

// dart format on
