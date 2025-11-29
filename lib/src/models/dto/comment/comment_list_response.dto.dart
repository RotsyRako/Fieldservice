import 'package:field_service/src/models/dto/base_response.dto.dart';
import 'package:field_service/src/models/dto/comment/comment_dto.dart';

class CommentListResponseDto extends BaseResponseDto {
  late List<CommentDto> data;

  CommentListResponseDto.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    var jsonData = json["data"];
    if (jsonData != null && jsonData is List) {
      data = jsonData.map((e) => CommentDto.fromJson(e)).toList();
    }
  }
}

