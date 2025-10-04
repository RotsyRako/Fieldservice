
import 'package:arkup_edoo/models/dto/base_response.dto.dart';
import 'package:arkup_edoo/service/applying/remote/base_remote.sa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/models/dto/intervention/update_status_request.dto.dart';
import 'package:arkup_edoo/repository/remote/update_status_remote.repo.dart';

class UpdateStatusRemoteSA extends BaseRemoteSA{
  final UpdateStatusRemoteRepo  _repository;

  UpdateStatusRemoteSA(this._repository);

  Future<BaseResponseDto> updateStatus({required UpdateStatusRequestDTO request})async{
    return await _repository.updateStatus(request);
  }
}

final updateStatusRemoteServiceProvider = Provider<UpdateStatusRemoteSA>((ref) {
  return UpdateStatusRemoteSA(ref.read(updatesStatusRemoteRepoProvider));
});