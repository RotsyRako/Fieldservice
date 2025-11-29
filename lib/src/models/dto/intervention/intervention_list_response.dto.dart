import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/models/dto/base_response.dto.dart';

class InterventionListResponseDto extends BaseResponseDto {
  late List<InterventionDto> data;

InterventionListResponseDto.fromJson(Map<String, dynamic> json)
    : super.fromJson(json) {
  var jsonData = json["data"];
  if (jsonData != null && jsonData is List) {
    data = jsonData.map((e) => InterventionDto.fromJson(e)).toList();
  }
}
}


