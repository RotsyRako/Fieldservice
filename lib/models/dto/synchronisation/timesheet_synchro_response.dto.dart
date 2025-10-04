
import 'package:arkup_edoo/models/dto/base_response.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation_items.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/timesheet_synchro.dto.dart';

class TimesheetSynchroResponse extends BaseResponseDto {
  late TimesheetSynchroDTO data;

TimesheetSynchroResponse.fromJson(Map<String, dynamic> json)
    : super.fromJson(json) {
  var jsonData = json["data"];
  if (jsonData != null && (jsonData != null)) {
    data = TimesheetSynchroDTO.fromJson(jsonData);
  }
}

}
