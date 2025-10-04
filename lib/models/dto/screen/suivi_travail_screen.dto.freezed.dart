// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suivi_travail_screen.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SuiviScreenDTO {

 List<TempsInterventionDTO>? get tempsIntervention; List<PhotoDTO>? get photos; List<DocumentDTO>? get documents; List<CommentaireDTO>? get comments; List<MaterialDTO>? get materials;
/// Create a copy of SuiviScreenDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuiviScreenDTOCopyWith<SuiviScreenDTO> get copyWith => _$SuiviScreenDTOCopyWithImpl<SuiviScreenDTO>(this as SuiviScreenDTO, _$identity);

  /// Serializes this SuiviScreenDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SuiviScreenDTO&&const DeepCollectionEquality().equals(other.tempsIntervention, tempsIntervention)&&const DeepCollectionEquality().equals(other.photos, photos)&&const DeepCollectionEquality().equals(other.documents, documents)&&const DeepCollectionEquality().equals(other.comments, comments)&&const DeepCollectionEquality().equals(other.materials, materials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tempsIntervention),const DeepCollectionEquality().hash(photos),const DeepCollectionEquality().hash(documents),const DeepCollectionEquality().hash(comments),const DeepCollectionEquality().hash(materials));

@override
String toString() {
  return 'SuiviScreenDTO(tempsIntervention: $tempsIntervention, photos: $photos, documents: $documents, comments: $comments, materials: $materials)';
}


}

/// @nodoc
abstract mixin class $SuiviScreenDTOCopyWith<$Res>  {
  factory $SuiviScreenDTOCopyWith(SuiviScreenDTO value, $Res Function(SuiviScreenDTO) _then) = _$SuiviScreenDTOCopyWithImpl;
@useResult
$Res call({
 List<TempsInterventionDTO>? tempsIntervention, List<PhotoDTO>? photos, List<DocumentDTO>? documents, List<CommentaireDTO>? comments, List<MaterialDTO>? materials
});




}
/// @nodoc
class _$SuiviScreenDTOCopyWithImpl<$Res>
    implements $SuiviScreenDTOCopyWith<$Res> {
  _$SuiviScreenDTOCopyWithImpl(this._self, this._then);

  final SuiviScreenDTO _self;
  final $Res Function(SuiviScreenDTO) _then;

/// Create a copy of SuiviScreenDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tempsIntervention = freezed,Object? photos = freezed,Object? documents = freezed,Object? comments = freezed,Object? materials = freezed,}) {
  return _then(_self.copyWith(
tempsIntervention: freezed == tempsIntervention ? _self.tempsIntervention : tempsIntervention // ignore: cast_nullable_to_non_nullable
as List<TempsInterventionDTO>?,photos: freezed == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<PhotoDTO>?,documents: freezed == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocumentDTO>?,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentaireDTO>?,materials: freezed == materials ? _self.materials : materials // ignore: cast_nullable_to_non_nullable
as List<MaterialDTO>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SuiviScreenDTO implements SuiviScreenDTO {
  const _SuiviScreenDTO({required final  List<TempsInterventionDTO>? tempsIntervention, required final  List<PhotoDTO>? photos, required final  List<DocumentDTO>? documents, required final  List<CommentaireDTO>? comments, required final  List<MaterialDTO>? materials}): _tempsIntervention = tempsIntervention,_photos = photos,_documents = documents,_comments = comments,_materials = materials;
  factory _SuiviScreenDTO.fromJson(Map<String, dynamic> json) => _$SuiviScreenDTOFromJson(json);

 final  List<TempsInterventionDTO>? _tempsIntervention;
@override List<TempsInterventionDTO>? get tempsIntervention {
  final value = _tempsIntervention;
  if (value == null) return null;
  if (_tempsIntervention is EqualUnmodifiableListView) return _tempsIntervention;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<PhotoDTO>? _photos;
@override List<PhotoDTO>? get photos {
  final value = _photos;
  if (value == null) return null;
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DocumentDTO>? _documents;
@override List<DocumentDTO>? get documents {
  final value = _documents;
  if (value == null) return null;
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CommentaireDTO>? _comments;
@override List<CommentaireDTO>? get comments {
  final value = _comments;
  if (value == null) return null;
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<MaterialDTO>? _materials;
@override List<MaterialDTO>? get materials {
  final value = _materials;
  if (value == null) return null;
  if (_materials is EqualUnmodifiableListView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SuiviScreenDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuiviScreenDTOCopyWith<_SuiviScreenDTO> get copyWith => __$SuiviScreenDTOCopyWithImpl<_SuiviScreenDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SuiviScreenDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SuiviScreenDTO&&const DeepCollectionEquality().equals(other._tempsIntervention, _tempsIntervention)&&const DeepCollectionEquality().equals(other._photos, _photos)&&const DeepCollectionEquality().equals(other._documents, _documents)&&const DeepCollectionEquality().equals(other._comments, _comments)&&const DeepCollectionEquality().equals(other._materials, _materials));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tempsIntervention),const DeepCollectionEquality().hash(_photos),const DeepCollectionEquality().hash(_documents),const DeepCollectionEquality().hash(_comments),const DeepCollectionEquality().hash(_materials));

@override
String toString() {
  return 'SuiviScreenDTO(tempsIntervention: $tempsIntervention, photos: $photos, documents: $documents, comments: $comments, materials: $materials)';
}


}

/// @nodoc
abstract mixin class _$SuiviScreenDTOCopyWith<$Res> implements $SuiviScreenDTOCopyWith<$Res> {
  factory _$SuiviScreenDTOCopyWith(_SuiviScreenDTO value, $Res Function(_SuiviScreenDTO) _then) = __$SuiviScreenDTOCopyWithImpl;
@override @useResult
$Res call({
 List<TempsInterventionDTO>? tempsIntervention, List<PhotoDTO>? photos, List<DocumentDTO>? documents, List<CommentaireDTO>? comments, List<MaterialDTO>? materials
});




}
/// @nodoc
class __$SuiviScreenDTOCopyWithImpl<$Res>
    implements _$SuiviScreenDTOCopyWith<$Res> {
  __$SuiviScreenDTOCopyWithImpl(this._self, this._then);

  final _SuiviScreenDTO _self;
  final $Res Function(_SuiviScreenDTO) _then;

/// Create a copy of SuiviScreenDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tempsIntervention = freezed,Object? photos = freezed,Object? documents = freezed,Object? comments = freezed,Object? materials = freezed,}) {
  return _then(_SuiviScreenDTO(
tempsIntervention: freezed == tempsIntervention ? _self._tempsIntervention : tempsIntervention // ignore: cast_nullable_to_non_nullable
as List<TempsInterventionDTO>?,photos: freezed == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<PhotoDTO>?,documents: freezed == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocumentDTO>?,comments: freezed == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentaireDTO>?,materials: freezed == materials ? _self._materials : materials // ignore: cast_nullable_to_non_nullable
as List<MaterialDTO>?,
  ));
}


}

// dart format on
