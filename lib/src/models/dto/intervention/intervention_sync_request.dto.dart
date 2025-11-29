import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:field_service/src/models/dto/intervention/intervention_sync_item.dto.dart';

part 'intervention_sync_request.dto.freezed.dart';
part 'intervention_sync_request.dto.g.dart';

/// DTO pour la requête de synchronisation des interventions
@freezed
abstract class InterventionSyncRequestDto with _$InterventionSyncRequestDto {
  const factory InterventionSyncRequestDto({
    /// Liste des interventions à synchroniser
    required List<InterventionSyncItemDto> data,
  }) = _InterventionSyncRequestDto;

  factory InterventionSyncRequestDto.fromJson(Map<String, dynamic> json) =>
      _$InterventionSyncRequestDtoFromJson(json);
}

