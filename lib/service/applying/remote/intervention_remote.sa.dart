
import 'package:arkup_edoo/service/applying/remote/base_remote.sa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/dto/intervention/intervention_response.dto.dart';
import '../../../repository/remote/intervention_remote.repo.dart';

class InterventionRemoteSA extends BaseRemoteSA{
  final InterventionRemoteRepo  _repository;

  InterventionRemoteSA(this._repository);

  Future<InterventionResponseDto> getAllIntervention()async{
    return await _repository.getAllIntervention();
  }
}

final interventionRemoteServiceProvider = Provider<InterventionRemoteSA>((ref) {
  return InterventionRemoteSA(ref.read(interventionRemoteRepoProvider));
});