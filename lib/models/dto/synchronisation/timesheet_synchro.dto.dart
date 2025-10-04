import 'package:freezed_annotation/freezed_annotation.dart';

part 'timesheet_synchro.dto.freezed.dart';
part 'timesheet_synchro.dto.g.dart';

@freezed
abstract class TimesheetSynchroDTO with _$TimesheetSynchroDTO {
  const factory TimesheetSynchroDTO({
    required String date,
    required double timeAllocated,
    required String description,
  }) = _TimesheetSynchroDTO;

  factory TimesheetSynchroDTO.fromJson(Map<String, dynamic> json) =>
      _$TimesheetSynchroDTOFromJson(json);
}
