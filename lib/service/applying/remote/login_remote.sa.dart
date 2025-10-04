
import 'package:arkup_edoo/service/applying/remote/base_remote.sa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/dto/auth/login_request.dto.dart';
import '../../../models/dto/auth/login_response.dto.dart';
import '../../../repository/remote/login_remote.repo.dart';

class LoginRemoteSA extends BaseRemoteSA{
  final LoginRemoteRepo  _repository;

  LoginRemoteSA(this._repository);

  Future<LoginResponseDto> login({required LoginRequestDTO request})async{
    return await _repository.login(request);
  }
}

final loginRemoteServiceProvider = Provider<LoginRemoteSA>((ref) {
  return LoginRemoteSA(ref.read(loginRemoteRepoProvider));
});