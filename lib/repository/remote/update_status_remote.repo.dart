
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/models/constant/urls.dart';
import 'package:arkup_edoo/models/dto/base_response.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/update_status_request.dto.dart';
import 'base_remote.repo.dart';

class UpdateStatusRemoteRepo {
  final BaseRemoteRepo helper;

  UpdateStatusRemoteRepo(this.helper);

  Future<BaseResponseDto> updateStatus(UpdateStatusRequestDTO request) async {
    final response = await helper.put(
      Urls.url.updateStatus,
      body: request.toJson(),
      tokenRequired: true,
    );

    return BaseResponseDto.fromJson(response);
  }

}

final updatesStatusRemoteRepoProvider = Provider<UpdateStatusRemoteRepo>((ref) {
  return UpdateStatusRemoteRepo(ref.read(baseRemoteRepoProvider));
});