import 'package:field_service/src/models/dto/base_response.dto.dart';
import 'package:field_service/src/models/dto/material/material_dto.dart';

class MaterialListResponseDto extends BaseResponseDto {
  late List<MaterialDto> data;

  MaterialListResponseDto.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    var jsonData = json["data"];
    if (jsonData != null && jsonData is List) {
      data = jsonData.map((e) => MaterialDto.fromJson(e)).toList();
    }
  }
}

