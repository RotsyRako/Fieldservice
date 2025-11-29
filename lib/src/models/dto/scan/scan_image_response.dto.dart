import 'package:field_service/src/models/dto/base_response.dto.dart';
import 'package:field_service/src/models/dto/scan/scan_image_data.dto.dart';

class ScanImageResponseDto extends BaseResponseDto {
  ScanImageDataDto? data;

  ScanImageResponseDto.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    var jsonData = getData(json);
    if (jsonData != null) {
      data = ScanImageDataDto.fromJson(jsonData);
    }
  }
}

