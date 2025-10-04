
import 'package:arkup_edoo/models/dto/auth/login_response.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/constant/urls.dart';
import '../../models/dto/auth/login_request.dto.dart';
import 'base_remote.repo.dart';

class LoginRemoteRepo {
  final BaseRemoteRepo helper;

  LoginRemoteRepo(this.helper);

  Future<LoginResponseDto> login(LoginRequestDTO request) async {
    final response = await helper.post(
      Urls.url.login,
      body: request.toJson(),
      tokenRequired: false,
    );
    if (response['data'] is Map && (response['data'] as Map).isEmpty) {
      response['data'] = null;
    }

    return LoginResponseDto.fromJson(response);
  }

}

final loginRemoteRepoProvider = Provider<LoginRemoteRepo>((ref) {
  return LoginRemoteRepo(ref.read(baseRemoteRepoProvider));
});