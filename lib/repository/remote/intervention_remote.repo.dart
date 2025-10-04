
import 'package:arkup_edoo/models/dto/auth/login_response.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/constant/urls.dart';
import '../../models/dto/auth/login_request.dto.dart';
import '../../models/dto/intervention/intervention_response.dto.dart';
import 'base_remote.repo.dart';

class InterventionRemoteRepo {
  final BaseRemoteRepo helper;

  InterventionRemoteRepo(this.helper);

  Future<InterventionResponseDto> getAllIntervention() async{
    final response = await helper.get(Urls.url.interventionList);
    print("Response:: $response"); // à inspecter !
    return InterventionResponseDto.fromJson(response);
  }
}

final interventionRemoteRepoProvider = Provider<InterventionRemoteRepo>((ref) {
  return InterventionRemoteRepo(ref.read(baseRemoteRepoProvider));
});