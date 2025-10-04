import 'package:flutter/material.dart';
import 'package:arkup_edoo/common/utils/app.utils.dart';
import 'package:arkup_edoo/repository/secure_storage.dart';

class BaseRemoteSA {
  String get defaultError => "Une erreur inexpliquée est survenue";

  Future<String?> get token {
    final secureStorage = SecureStorage();
    return secureStorage.getAccessToken();
  }

  delayedAction(VoidCallback action, {int delay = 200}) {
    Future.delayed(Duration(milliseconds: delay)).then((_) {
      action.call();
    });
  }

  _refreshToken({VoidCallback? onSuccess, VoidCallback? onFailure}) {
    // UserRemoteSA().refreshToken(onSuccess: (_) {
    //   onSuccess?.call();
    // }, onFailure: (_) {
    //   onFailure?.call();
    // });
  }

  onSuccessCompletion<T>(
      {CompletionClosure<bool>? loading,
      CompletionClosure<T>? onSuccess,
      T? success}) {
    loading?.call(false);
    onSuccess?.call(success!);
  }

  onFailureCompletion<T>(
      {bool isUnautorized = false,
      VoidCallback? onSuccessRefreshToken,
      CompletionClosure<bool>? loading,
      CompletionClosure<T>? onFailure,
      T? failure}) {
    if (isUnautorized ?? false) {
      _refreshToken(
          onSuccess: onSuccessRefreshToken,
          onFailure: () {
            loading?.call(false);
            delayedAction(() {
              onFailure?.call(failure!);
            });
          });
    } else {
      loading?.call(false);
      delayedAction(() {
        onFailure?.call(failure!);
      });
    }
  }
}