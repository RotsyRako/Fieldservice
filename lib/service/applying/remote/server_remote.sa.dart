import 'package:arkup_edoo/service/applying/remote/base_remote.sa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../repository/remote/server_remote.repo.dart';

class ServerRemoteSA extends BaseRemoteSA {
  final ServerRemoteRepo _repository;

  ServerRemoteSA(this._repository);

  Future<Map<String, dynamic>> ping({required String baseUrl}) async {
    return await _repository.ping(baseUrl: baseUrl);
  }
}

final serverRemoteServiceProvider = Provider<ServerRemoteSA>((ref) {
  return ServerRemoteSA(ref.read(serverRemoteRepoProvider));
});
