import 'package:freezed_annotation/freezed_annotation.dart';

part 'signature_synchro.dto.freezed.dart';
part 'signature_synchro.dto.g.dart';

@freezed
abstract class SignatureSynchro with _$SignatureSynchro {
  const factory SignatureSynchro({
    required String filename,
    required String data,
  }) = _PhotoDTO;

  factory SignatureSynchro.fromJson(Map<String, dynamic> json) => _$SignatureSynchroFromJson(json);
}
