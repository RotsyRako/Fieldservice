import 'package:field_service/src/models/dto/base_response.dto.dart';
import 'package:field_service/src/models/dto/document/document_dto.dart';

class DocumentListResponseDto extends BaseResponseDto {
  late List<DocumentDto> data;

  DocumentListResponseDto.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    var jsonData = json["data"];
    if (jsonData != null && jsonData is List) {
      data = jsonData.map((e) => DocumentDto.fromJson(e)).toList();
    }
  }
}

