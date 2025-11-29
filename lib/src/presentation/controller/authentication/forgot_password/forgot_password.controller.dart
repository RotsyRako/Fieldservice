// ignore_for_file: unused-code
import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password.controller.g.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  Object? _key;

  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() => _key = null);
  }

  Future<void> sendResetLink({
    required String email,
    void Function()? onError,
    void Function()? onSuccess,
  }) async {
    print('sendResetLink: start');
    final key = _key;
    if (key == null) {
      print('sendResetLink: key is null, returning');
      return;
    }

    try {
      state = const AsyncValue.loading();
      print('sendResetLink: state set to loading');
    } catch (_) {
      print('sendResetLink: error setting loading state');
      // Provider has been disposed, ignore
      return;
    }

    final newState = await AsyncValue.guard(() async {
      print('sendResetLink: inside guard');
      // TODO: Implémenter l'appel API pour envoyer le lien de réinitialisation
      await Future.delayed(const Duration(seconds: 1));
      print('sendResetLink: email sent to $email');
    });

    print('sendResetLink: after guard, checking key');
    if (key != _key || _key == null) {
      print('sendResetLink: key changed or null, returning');
      return;
    }

    print('sendResetLink: calling when, hasError: ${newState.hasError}, hasValue: ${newState.hasValue}');
    newState.when(
      data: (_) {
        print('sendResetLink: when data');
        if (_key == null) {
          print('sendResetLink: _key is null in data callback');
          return;
        }
        try {
          state = newState;
          print('sendResetLink: calling onSuccess');
          onSuccess?.call();
        } catch (e) {
          print('sendResetLink: error in data callback: $e');
        }
      },
      error: (error, stackTrace) {
        print('sendResetLink: when error: $error');
        if (_key == null) {
          print('sendResetLink: _key is null in error callback');
          return;
        }
        try {
          state = AsyncError(error, stackTrace);
          print('sendResetLink: calling onError');
          onError?.call();
        } catch (e) {
          print('sendResetLink: error in error callback: $e');
        }
      },
      loading: () {
        print('sendResetLink: when loading (unexpected)');
      },
    );
    print('sendResetLink: end');
  }
}
