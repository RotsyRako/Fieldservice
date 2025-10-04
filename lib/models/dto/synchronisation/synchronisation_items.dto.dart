import 'package:freezed_annotation/freezed_annotation.dart';

part 'synchronisation_items.dto.freezed.dart';
part 'synchronisation_items.dto.g.dart';

@freezed
abstract class SynchronisationItemsDTO with _$SynchronisationItemsDTO {
  const factory SynchronisationItemsDTO({
    required int id,
    required String title,
  }) = _PhotoDTO;

  factory SynchronisationItemsDTO.fromJson(Map<String, dynamic> json) => _$SynchronisationItemsDTOFromJson(json);
}
