// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commentaire.dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CommentaireDTO {

 int? get localId; int? get id; String get user; String get comment; DateTime get date; int get idIntervention; String? get pj; bool? get isSync;
/// Create a copy of CommentaireDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentaireDTOCopyWith<CommentaireDTO> get copyWith => _$CommentaireDTOCopyWithImpl<CommentaireDTO>(this as CommentaireDTO, _$identity);

  /// Serializes this CommentaireDTO to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentaireDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.date, date) || other.date == date)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.pj, pj) || other.pj == pj)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,user,comment,date,idIntervention,pj,isSync);

@override
String toString() {
  return 'CommentaireDTO(localId: $localId, id: $id, user: $user, comment: $comment, date: $date, idIntervention: $idIntervention, pj: $pj, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class $CommentaireDTOCopyWith<$Res>  {
  factory $CommentaireDTOCopyWith(CommentaireDTO value, $Res Function(CommentaireDTO) _then) = _$CommentaireDTOCopyWithImpl;
@useResult
$Res call({
 int? localId, int? id, String user, String comment, DateTime date, int idIntervention, String? pj, bool? isSync
});




}
/// @nodoc
class _$CommentaireDTOCopyWithImpl<$Res>
    implements $CommentaireDTOCopyWith<$Res> {
  _$CommentaireDTOCopyWithImpl(this._self, this._then);

  final CommentaireDTO _self;
  final $Res Function(CommentaireDTO) _then;

/// Create a copy of CommentaireDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? localId = freezed,Object? id = freezed,Object? user = null,Object? comment = null,Object? date = null,Object? idIntervention = null,Object? pj = freezed,Object? isSync = freezed,}) {
  return _then(_self.copyWith(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as int,pj: freezed == pj ? _self.pj : pj // ignore: cast_nullable_to_non_nullable
as String?,isSync: freezed == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CommentaireDTO implements CommentaireDTO {
  const _CommentaireDTO({this.localId, this.id, required this.user, required this.comment, required this.date, required this.idIntervention, this.pj, this.isSync});
  factory _CommentaireDTO.fromJson(Map<String, dynamic> json) => _$CommentaireDTOFromJson(json);

@override final  int? localId;
@override final  int? id;
@override final  String user;
@override final  String comment;
@override final  DateTime date;
@override final  int idIntervention;
@override final  String? pj;
@override final  bool? isSync;

/// Create a copy of CommentaireDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentaireDTOCopyWith<_CommentaireDTO> get copyWith => __$CommentaireDTOCopyWithImpl<_CommentaireDTO>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentaireDTOToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentaireDTO&&(identical(other.localId, localId) || other.localId == localId)&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.date, date) || other.date == date)&&(identical(other.idIntervention, idIntervention) || other.idIntervention == idIntervention)&&(identical(other.pj, pj) || other.pj == pj)&&(identical(other.isSync, isSync) || other.isSync == isSync));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,localId,id,user,comment,date,idIntervention,pj,isSync);

@override
String toString() {
  return 'CommentaireDTO(localId: $localId, id: $id, user: $user, comment: $comment, date: $date, idIntervention: $idIntervention, pj: $pj, isSync: $isSync)';
}


}

/// @nodoc
abstract mixin class _$CommentaireDTOCopyWith<$Res> implements $CommentaireDTOCopyWith<$Res> {
  factory _$CommentaireDTOCopyWith(_CommentaireDTO value, $Res Function(_CommentaireDTO) _then) = __$CommentaireDTOCopyWithImpl;
@override @useResult
$Res call({
 int? localId, int? id, String user, String comment, DateTime date, int idIntervention, String? pj, bool? isSync
});




}
/// @nodoc
class __$CommentaireDTOCopyWithImpl<$Res>
    implements _$CommentaireDTOCopyWith<$Res> {
  __$CommentaireDTOCopyWithImpl(this._self, this._then);

  final _CommentaireDTO _self;
  final $Res Function(_CommentaireDTO) _then;

/// Create a copy of CommentaireDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? localId = freezed,Object? id = freezed,Object? user = null,Object? comment = null,Object? date = null,Object? idIntervention = null,Object? pj = freezed,Object? isSync = freezed,}) {
  return _then(_CommentaireDTO(
localId: freezed == localId ? _self.localId : localId // ignore: cast_nullable_to_non_nullable
as int?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,idIntervention: null == idIntervention ? _self.idIntervention : idIntervention // ignore: cast_nullable_to_non_nullable
as int,pj: freezed == pj ? _self.pj : pj // ignore: cast_nullable_to_non_nullable
as String?,isSync: freezed == isSync ? _self.isSync : isSync // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
