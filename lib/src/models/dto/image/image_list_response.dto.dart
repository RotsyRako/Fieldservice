import 'package:field_service/src/models/dto/base_response.dto.dart';
import 'package:field_service/src/models/dto/image/image_dto.dart';

class ImageListResponseDto extends BaseResponseDto {
  late List<ImageDto> data;

  ImageListResponseDto.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    var jsonData = json["data"];
    if (jsonData != null && jsonData is List) {
      data = jsonData.map((e) => ImageDto.fromJson(e)).toList();
    }
  }
}

