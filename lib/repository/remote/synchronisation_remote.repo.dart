

import 'package:arkup_edoo/models/dto/synchronisation/synchronisation.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation_request.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation_response.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/timesheet_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/timesheet_synchro_response.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/constant/urls.dart';

import 'base_remote.repo.dart';

class SynchronisationRemoteRepo {
  final BaseRemoteRepo helper;

  SynchronisationRemoteRepo(this.helper);

  Future<SynchronisationResponseDto> synchronise(SynchrositionRequestDTO dto) async{
    print("dto ${dto.toJson().toString()}");
    final response = await helper.post(Urls.url.synchro, body: dto.toJson());
    print("Response:: $response"); 
    return SynchronisationResponseDto.fromJson(response);
  }

  Future<TimesheetSynchroResponse> postTimer(TimesheetSynchroDTO dto, int interventionId) async{
    final response = await helper.post("${Urls.url.interventions}/$interventionId/${Urls.url.timesheet}", body: dto.toJson());
    print("Response:: $response"); 
    return TimesheetSynchroResponse.fromJson(response);
  }
}

final synchronisationRemoteRepoProvider = Provider<SynchronisationRemoteRepo>((ref) {
  return SynchronisationRemoteRepo(ref.read(baseRemoteRepoProvider));
});