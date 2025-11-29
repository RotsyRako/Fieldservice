import 'package:field_service/src/models/dto/intervention/intervention_complete.dto.dart';
import 'package:field_service/src/models/dto/base_response.dto.dart';

/// DTO pour la réponse de synchronisation des interventions
class InterventionSyncResponseDto extends BaseResponseDto {
  late List<InterventionCompleteDto> data;

  InterventionSyncResponseDto.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    var jsonData = json["data"];
    if (jsonData != null && jsonData is List) {
      data = jsonData
          .map((e) => InterventionCompleteDto.fromJson(e))
          .toList();
    } else {
      data = [];
    }
  }
}

