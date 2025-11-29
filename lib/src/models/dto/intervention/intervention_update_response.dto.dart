
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/models/dto/base_response.dto.dart';

class InterventionUpdateResponseDto extends BaseResponseDto {
  late InterventionDto data;

InterventionUpdateResponseDto.fromJson(Map<String, dynamic> json)
    : super.fromJson(json) {
  var jsonData = json["data"];
  if (jsonData != null && jsonData is Map<String, dynamic>) {
    data = InterventionDto.fromJson(jsonData);
  }
}
}


