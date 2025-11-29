import 'package:field_service/src/models/dto/timesheet/timesheet_dto.dart';

class WorkTimeEntry {
  const WorkTimeEntry({
    required this.date,
    required this.time,
    required this.description,
    required this.timesheet,
  });

  final String date;
  final String time;
  final String description;
  final TimesheetDto timesheet;
}

