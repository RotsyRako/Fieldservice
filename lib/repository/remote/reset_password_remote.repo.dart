import 'package:arkup_edoo/models/constant/urls.dart';
import 'package:arkup_edoo/models/dto/auth/reset_password_request.dto.dart';
import 'package:arkup_edoo/repository/remote/base_remote.repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPasswordRemoteRepo {
  final BaseRemoteRepo _baseRemoteRepo;

  ResetPasswordRemoteRepo(this._baseRemoteRepo);

  Future<dynamic> resetPassword(ResetPasswordRequestDTO dto) async {
    try {
      final result = await _baseRemoteRepo.post(
        Urls.url.resetPassword,
        body: dto.toJson(),
      );
      return result;
    } catch (e) {
      print('ResetPasswordRemoteRepo: resetPassword error: $e');
      rethrow;
    }
  }
}

final resetPasswordRemoteRepoProvider = Provider<ResetPasswordRemoteRepo>((
  ref,
) {
  final baseRemoteRepo = ref.read(baseRemoteRepoProvider);
  return ResetPasswordRemoteRepo(baseRemoteRepo);
});
