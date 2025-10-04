
import 'package:arkup_edoo/models/dto/auth/reset_password_request.dto.dart';
import 'package:arkup_edoo/presentation/controller/base.controller.dart';
import 'package:arkup_edoo/service/applying/remote/reset_password_remote.sa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final resetPasswordControllerProvider =
    StateNotifierProvider<ResetPasswordController, AsyncValue<void>>(
      (ref) => ResetPasswordController(ref),
    );

class ResetPasswordController extends BaseController<void> {
  ResetPasswordController(Ref ref) : super(ref, const AsyncValue.data(null));

  Future<void> resetPassword({
    required ResetPasswordRequestDTO dto,
    required Function() onSuccess,
    required Function(String) onError,
  }) async {
    final authRepo = ref.read(resetPasswordRemoteServiceProvider);

    await executeAsyncRequest(
      request: () => authRepo.resetPassword(request: dto),
      onSuccess: (_) => onSuccess(),
      onError: (error, stack) => onError(error.toString()),
    );
  }
}
