
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation_request.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation_response.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/timesheet_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/timesheet_synchro_response.dto.dart';
import 'package:arkup_edoo/repository/remote/synchronisation_remote.repo.dart';
import 'package:arkup_edoo/service/applying/remote/base_remote.sa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SynchronisationRemoteSA extends BaseRemoteSA{
  final SynchronisationRemoteRepo  _repository;

  SynchronisationRemoteSA(this._repository);

  Future<SynchronisationResponseDto> synchronise(SynchrositionRequestDTO dto)async{
    return await _repository.synchronise(dto);
  }

  Future<TimesheetSynchroResponse> postTimesheet(TimesheetSynchroDTO dto, int interventionId)async{
    return await _repository.postTimer(dto, interventionId);
  }
}

final sychronisationRemoteServiceProvider = Provider<SynchronisationRemoteSA>((ref) {
  return SynchronisationRemoteSA(ref.read(synchronisationRemoteRepoProvider));
});