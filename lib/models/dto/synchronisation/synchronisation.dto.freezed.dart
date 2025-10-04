// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'synchronisation.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SynchrositionDTO {

 int? get id; int? get status; SignatureSynchro? get signature; List<MaterialSynchroDTO>? get materials; List<TimesheetSynchroDTO>? get timesheets;@JsonKey(name: 'images') List<PhotoSynchroDTO>? get photos; List<DocumentSynchroDTO>? get documents; List<CommentSynchroDTO>? get comments;
/// Create a copy of SynchrositionDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SynchrositionDTOCopyWith<SynchrositionDTO> get copyWith => _$SynchrositionDTOCopyWithImpl<SynchrositionDTO>(this as SynchrositionDTO, _$identity);

  /// Serializes this SynchrositionDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SynchrositionDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.signature, signature) || other.signature == signature)&&const DeepCollectionEquality().equals(other.materials, materials)&&const DeepCollectionEquality().equals(other.timesheets, timesheets)&&const DeepCollectionEquality().equals(other.photos, photos)&&const DeepCollectionEquality().equals(other.documents, documents)&&const DeepCollectionEquality().equals(other.comments, comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,signature,const DeepCollectionEquality().hash(materials),const DeepCollectionEquality().hash(timesheets),const DeepCollectionEquality().hash(photos),const DeepCollectionEquality().hash(documents),const DeepCollectionEquality().hash(comments));

@override
String toString() {
  return 'SynchrositionDTO(id: $id, status: $status, signature: $signature, materials: $materials, timesheets: $timesheets, photos: $photos, documents: $documents, comments: $comments)';
}


}

/// @nodoc
abstract mixin class $SynchrositionDTOCopyWith<$Res>  {
  factory $SynchrositionDTOCopyWith(SynchrositionDTO value, $Res Function(SynchrositionDTO) _then) = _$SynchrositionDTOCopyWithImpl;
@useResult
$Res call({
 int? id, int? status, SignatureSynchro? signature, List<MaterialSynchroDTO>? materials, List<TimesheetSynchroDTO>? timesheets,@JsonKey(name: 'images') List<PhotoSynchroDTO>? photos, List<DocumentSynchroDTO>? documents, List<CommentSynchroDTO>? comments
});


$SignatureSynchroCopyWith<$Res>? get signature;

}
/// @nodoc
class _$SynchrositionDTOCopyWithImpl<$Res>
    implements $SynchrositionDTOCopyWith<$Res> {
  _$SynchrositionDTOCopyWithImpl(this._self, this._then);

  final SynchrositionDTO _self;
  final $Res Function(SynchrositionDTO) _then;

/// Create a copy of SynchrositionDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? status = freezed,Object? signature = freezed,Object? materials = freezed,Object? timesheets = freezed,Object? photos = freezed,Object? documents = freezed,Object? comments = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as SignatureSynchro?,materials: freezed == materials ? _self.materials : materials // ignore: cast_nullable_to_non_nullable
as List<MaterialSynchroDTO>?,timesheets: freezed == timesheets ? _self.timesheets : timesheets // ignore: cast_nullable_to_non_nullable
as List<TimesheetSynchroDTO>?,photos: freezed == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<PhotoSynchroDTO>?,documents: freezed == documents ? _self.documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocumentSynchroDTO>?,comments: freezed == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentSynchroDTO>?,
  ));
}
/// Create a copy of SynchrositionDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignatureSynchroCopyWith<$Res>? get signature {
    if (_self.signature == null) {
    return null;
  }

  return $SignatureSynchroCopyWith<$Res>(_self.signature!, (value) {
    return _then(_self.copyWith(signature: value));
  });
}
}


/// @nodoc

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class _SynchrositionDTO implements SynchrositionDTO {
  const _SynchrositionDTO({this.id, this.status, this.signature, final  List<MaterialSynchroDTO>? materials, final  List<TimesheetSynchroDTO>? timesheets, @JsonKey(name: 'images') final  List<PhotoSynchroDTO>? photos, final  List<DocumentSynchroDTO>? documents, final  List<CommentSynchroDTO>? comments}): _materials = materials,_timesheets = timesheets,_photos = photos,_documents = documents,_comments = comments;
  factory _SynchrositionDTO.fromJson(Map<String, dynamic> json) => _$SynchrositionDTOFromJson(json);

@override final  int? id;
@override final  int? status;
@override final  SignatureSynchro? signature;
 final  List<MaterialSynchroDTO>? _materials;
@override List<MaterialSynchroDTO>? get materials {
  final value = _materials;
  if (value == null) return null;
  if (_materials is EqualUnmodifiableListView) return _materials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<TimesheetSynchroDTO>? _timesheets;
@override List<TimesheetSynchroDTO>? get timesheets {
  final value = _timesheets;
  if (value == null) return null;
  if (_timesheets is EqualUnmodifiableListView) return _timesheets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<PhotoSynchroDTO>? _photos;
@override@JsonKey(name: 'images') List<PhotoSynchroDTO>? get photos {
  final value = _photos;
  if (value == null) return null;
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<DocumentSynchroDTO>? _documents;
@override List<DocumentSynchroDTO>? get documents {
  final value = _documents;
  if (value == null) return null;
  if (_documents is EqualUnmodifiableListView) return _documents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CommentSynchroDTO>? _comments;
@override List<CommentSynchroDTO>? get comments {
  final value = _comments;
  if (value == null) return null;
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SynchrositionDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SynchrositionDTOCopyWith<_SynchrositionDTO> get copyWith => __$SynchrositionDTOCopyWithImpl<_SynchrositionDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SynchrositionDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SynchrositionDTO&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.signature, signature) || other.signature == signature)&&const DeepCollectionEquality().equals(other._materials, _materials)&&const DeepCollectionEquality().equals(other._timesheets, _timesheets)&&const DeepCollectionEquality().equals(other._photos, _photos)&&const DeepCollectionEquality().equals(other._documents, _documents)&&const DeepCollectionEquality().equals(other._comments, _comments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,signature,const DeepCollectionEquality().hash(_materials),const DeepCollectionEquality().hash(_timesheets),const DeepCollectionEquality().hash(_photos),const DeepCollectionEquality().hash(_documents),const DeepCollectionEquality().hash(_comments));

@override
String toString() {
  return 'SynchrositionDTO(id: $id, status: $status, signature: $signature, materials: $materials, timesheets: $timesheets, photos: $photos, documents: $documents, comments: $comments)';
}


}

/// @nodoc
abstract mixin class _$SynchrositionDTOCopyWith<$Res> implements $SynchrositionDTOCopyWith<$Res> {
  factory _$SynchrositionDTOCopyWith(_SynchrositionDTO value, $Res Function(_SynchrositionDTO) _then) = __$SynchrositionDTOCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? status, SignatureSynchro? signature, List<MaterialSynchroDTO>? materials, List<TimesheetSynchroDTO>? timesheets,@JsonKey(name: 'images') List<PhotoSynchroDTO>? photos, List<DocumentSynchroDTO>? documents, List<CommentSynchroDTO>? comments
});


@override $SignatureSynchroCopyWith<$Res>? get signature;

}
/// @nodoc
class __$SynchrositionDTOCopyWithImpl<$Res>
    implements _$SynchrositionDTOCopyWith<$Res> {
  __$SynchrositionDTOCopyWithImpl(this._self, this._then);

  final _SynchrositionDTO _self;
  final $Res Function(_SynchrositionDTO) _then;

/// Create a copy of SynchrositionDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? status = freezed,Object? signature = freezed,Object? materials = freezed,Object? timesheets = freezed,Object? photos = freezed,Object? documents = freezed,Object? comments = freezed,}) {
  return _then(_SynchrositionDTO(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,signature: freezed == signature ? _self.signature : signature // ignore: cast_nullable_to_non_nullable
as SignatureSynchro?,materials: freezed == materials ? _self._materials : materials // ignore: cast_nullable_to_non_nullable
as List<MaterialSynchroDTO>?,timesheets: freezed == timesheets ? _self._timesheets : timesheets // ignore: cast_nullable_to_non_nullable
as List<TimesheetSynchroDTO>?,photos: freezed == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<PhotoSynchroDTO>?,documents: freezed == documents ? _self._documents : documents // ignore: cast_nullable_to_non_nullable
as List<DocumentSynchroDTO>?,comments: freezed == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<CommentSynchroDTO>?,
  ));
}

/// Create a copy of SynchrositionDTO
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SignatureSynchroCopyWith<$Res>? get signature {
    if (_self.signature == null) {
    return null;
  }

  return $SignatureSynchroCopyWith<$Res>(_self.signature!, (value) {
    return _then(_self.copyWith(signature: value));
  });
}
}

// dart format on
