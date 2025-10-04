import 'package:arkup_edoo/models/constant/urls.dart';
import 'package:arkup_edoo/repository/remote/base_remote.repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerRemoteRepo {
  final BaseRemoteRepo helper;

  ServerRemoteRepo(this.helper);

  Future<Map<String, dynamic>> ping({required String baseUrl}) async {
    final response = await helper.get(
      Urls.url.ping,
      tokenRequired: false,
      overrideBaseUrl: baseUrl,
    );
    return Map<String, dynamic>.from(response);
  }
}

final serverRemoteRepoProvider = Provider<ServerRemoteRepo>((ref) {
  return ServerRemoteRepo(ref.read(baseRemoteRepoProvider));
});
