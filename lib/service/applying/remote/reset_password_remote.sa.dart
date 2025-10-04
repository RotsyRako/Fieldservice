import 'package:arkup_edoo/models/dto/auth/reset_password_request.dto.dart';
import 'package:arkup_edoo/repository/remote/reset_password_remote.repo.dart';
import 'package:arkup_edoo/service/applying/remote/base_remote.sa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPasswordRemoteSA extends BaseRemoteSA {
  final ResetPasswordRemoteRepo _repository;

  ResetPasswordRemoteSA(this._repository);

  Future<dynamic> resetPassword({
    required ResetPasswordRequestDTO request,
  }) async {
    try {
      final result = await _repository.resetPassword(request);
      return result;
    } catch (e) {
      print('ResetPasswordRemoteSA: resetPassword error: $e');
      rethrow;
    }
  }
}

final resetPasswordRemoteServiceProvider = Provider<ResetPasswordRemoteSA>((
  ref,
) {
  return ResetPasswordRemoteSA(ref.read(resetPasswordRemoteRepoProvider));
});
