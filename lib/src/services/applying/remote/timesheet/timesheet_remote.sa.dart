import 'dart:async';

import 'package:field_service/src/models/dto/timesheet/timesheet_dto.dart';
import 'package:field_service/src/models/dto/timesheet/timesheet_list_response.dto.dart';
import 'package:field_service/src/repository/remote/timesheet/timesheet_remote.repository.dart';
import 'package:field_service/src/services/applying/remote/base_remote.sa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timesheet_remote.sa.g.dart';

class TimesheetRemoteService extends BaseRemoteService {
  TimesheetRemoteService({
    required TimesheetRemoteRepository timesheetRemoteRepository,
  })  : _timesheetRemoteRepository = timesheetRemoteRepository,
        super(
          baseRemoteRepository:
              timesheetRemoteRepository.baseRemoteRepository,
        );

  final TimesheetRemoteRepository _timesheetRemoteRepository;

  Future<List<TimesheetDto>> fetchTimesheetsByIntervention({
    required String idIntervention,
    LoadingCallback? loading,
    OnSuccessCallback<List<TimesheetDto>>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    final completer = Completer<List<TimesheetDto>>();

    await executeOperation<TimesheetListResponseDto>(
      operation: () async => _timesheetRemoteRepository.fetchTimesheetsByIntervention(
        idIntervention: idIntervention,
      ),
      loading: loading,
      onSuccess: (response) {
        final data = response.data;
        if (!completer.isCompleted) {
          completer.complete(data);
        }
        onSuccess?.call(data);
      },
      onFailure: (message) {
        if (!completer.isCompleted) {
          completer.complete(const <TimesheetDto>[]);
        }
        onFailure?.call(message);
      },
      defaultErrorMessage: defaultErrorMessage,
    );

    if (!completer.isCompleted) {
      completer.complete(const <TimesheetDto>[]);
    }

    return completer.future;
  }
}

@Riverpod(keepAlive: true)
TimesheetRemoteService timesheetRemoteService(Ref ref) {
  final repository = ref.watch(timesheetRemoteRepositoryProvider);
  return TimesheetRemoteService(
    timesheetRemoteRepository: repository,
  );
}

