import 'package:field_service/src/models/dto/base_response.dto.dart';
import 'package:field_service/src/models/dto/timesheet/timesheet_dto.dart';

class TimesheetListResponseDto extends BaseResponseDto {
  late List<TimesheetDto> data;

  TimesheetListResponseDto.fromJson(Map<String, dynamic> json)
      : super.fromJson(json) {
    var jsonData = json["data"];
    if (jsonData != null && jsonData is List) {
      data = jsonData.map((e) => TimesheetDto.fromJson(e)).toList();
    }
  }
}

