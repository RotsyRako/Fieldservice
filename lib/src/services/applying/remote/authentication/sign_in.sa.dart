import 'dart:async';

import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/models/dto/auth/sign_in/sign_in.dto.dart';
import 'package:field_service/src/models/dto/auth/sign_in/user_token.dto.dart';
import 'package:field_service/src/repository/remote/authentication/sign_in.repository.dart';
import 'package:field_service/src/services/applying/remote/base_remote.sa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in.sa.g.dart';

class SignInRemoteService extends BaseRemoteService {
  SignInRemoteService({
    required SignInRepository signInRepository,
  })  : _signInRepository = signInRepository,
        super(
          baseRemoteRepository: signInRepository.baseRemoteRepository,
        );

  final SignInRepository _signInRepository;

  Future<UserTokenDto?> signIn({
    required SignInDto signInDto,
    LoadingCallback? loading,
    OnSuccessCallback<UserTokenDto>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    final completer = Completer<UserTokenDto?>();

    await executeOperation<UserTokenDto>(
      operation: () async {
        final response = await _signInRepository.signIn(signInDto);

        if (response.success && response.data.token.isNotEmpty) {
          await baseRemoteRepository.appSharedPreferences.updateIsAuthenticated(
            isAuthenticated: true,
            token: response.data.token,
          );
          return response.data;
        }

        final message = response.message.isNotEmpty
            ? response.message
            : defaultErrorMessage ?? defaultError;
        throw RemoteException(remoteMessage: message);
      },
      loading: loading,
      onSuccess: (userToken) {
        if (!completer.isCompleted) {
          completer.complete(userToken);
        }
        onSuccess?.call(userToken);
      },
      onFailure: (message) {
        if (!completer.isCompleted) {
          completer.complete(null);
        }
        onFailure?.call(message);
      },
      defaultErrorMessage: defaultErrorMessage,
    );
    if (!completer.isCompleted) {
      completer.complete(null);
    }
    return completer.future;
  }
}

@Riverpod(keepAlive: true)
SignInRemoteService signInRemoteService(Ref ref) {
  final signInRepo = ref.watch(signInRepositoryProvider);
  return SignInRemoteService(
    signInRepository: signInRepo,
  );
}