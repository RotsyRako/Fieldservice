import 'dart:async';

import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/repository/remote/base_remote.repository.dart';
import 'package:flutter/material.dart';

/// Type pour les callbacks de succès
typedef OnSuccessCallback<T> = void Function(T result);

/// Type pour les callbacks d'échec
typedef OnFailureCallback<T> = void Function(T? error);

/// Type pour les callbacks de loading
typedef LoadingCallback = void Function(bool isLoading);

/// Classe de base pour tous les services distants
/// 
/// Cette classe fournit une couche d'abstraction pour gérer la logique métier
/// et la gestion d'erreurs pour tous les appels API distants.
/// Chaque service spécifique doit étendre cette classe.
abstract class BaseRemoteService {
  final BaseRemoteRepository baseRemoteRepository;

  BaseRemoteService({
    required this.baseRemoteRepository,
  });

  /// Message d'erreur par défaut
  String get defaultError => 'Une erreur inexpliquée est survenue';

  /// Récupère le token d'authentification
  String? get token => baseRemoteRepository.appSharedPreferences.authToken;

  /// Exécute une action avec un délai
  /// 
  /// Utile pour retarder certaines actions comme la fermeture des loaders
  void delayedAction(VoidCallback action, {Duration delay = const Duration(milliseconds: 200)}) {
    Future.delayed(delay).then((_) {
      action.call();
    });
  }

  /// Rafraîchit le token d'authentification
  /// 
  /// À implémenter dans les services spécifiques si nécessaire
  Future<void> refreshToken({
    VoidCallback? onSuccess,
    VoidCallback? onFailure,
  }) async {
    // TODO: Implémenter le refresh token selon les besoins
    // Exemple:
    // try {
    //   await authRemoteService.refreshToken();
    //   onSuccess?.call();
    // } catch (e) {
    //   onFailure?.call();
    // }
    onFailure?.call();
  }

  /// Gère le succès d'une opération
  /// 
  /// [loading] : Callback pour mettre à jour l'état de chargement
  /// [onSuccess] : Callback appelé en cas de succès
  /// [success] : Données de succès à passer au callback
  void onSuccessCompletion<T>({
    LoadingCallback? loading,
    OnSuccessCallback<T>? onSuccess,
    T? success,
  }) {
    loading?.call(false);
    if (success != null && onSuccess != null) {
      onSuccess.call(success);
    } else if (onSuccess != null) {
      onSuccess.call(success as T);
    }
  }

  /// Gère l'échec d'une opération
  /// 
  /// [isUnauthorized] : Si true, tente de rafraîchir le token
  /// [onSuccessRefreshToken] : Callback appelé si le refresh token réussit
  /// [loading] : Callback pour mettre à jour l'état de chargement
  /// [onFailure] : Callback appelé en cas d'échec
  /// [failure] : Erreur à passer au callback
  void onFailureCompletion<T>({
    bool isUnauthorized = false,
    VoidCallback? onSuccessRefreshToken,
    LoadingCallback? loading,
    OnFailureCallback<T>? onFailure,
    T? failure,
  }) {
    if (isUnauthorized) {
      refreshToken(
        onSuccess: onSuccessRefreshToken,
        onFailure: () {
          loading?.call(false);
          onFailure?.call(failure);
        },
      );
    } else {
      loading?.call(false);
      onFailure?.call(failure);
    }
  }

  /// Exécute une opération asynchrone avec gestion automatique des erreurs
  /// 
  /// [operation] : Fonction asynchrone à exécuter
  /// [loading] : Callback pour mettre à jour l'état de chargement
  /// [onSuccess] : Callback appelé en cas de succès
  /// [onFailure] : Callback appelé en cas d'échec
  /// [defaultErrorMessage] : Message d'erreur par défaut si aucune exception n'est fournie
  /// [onUnauthorized] : Callback optionnel appelé en cas d'erreur 401 (non autorisé)
  Future<void> executeOperation<T>({
    required Future<T> Function() operation,
    LoadingCallback? loading,
    OnSuccessCallback<T>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
    VoidCallback? onUnauthorized,
  }) async {
    try {
      loading?.call(true);
      final result = await operation();
      onSuccessCompletion(
        loading: loading,
        onSuccess: onSuccess,
        success: result,
      );
    } catch (e) {
      final errorMessage = _extractErrorMessage(e, defaultErrorMessage);
      final isUnauthorized = _isUnauthorizedError(e);

      if (isUnauthorized && onUnauthorized != null) {
        onFailureCompletion<String>(
          isUnauthorized: true,
          onSuccessRefreshToken: onUnauthorized,
          loading: loading,
          onFailure: onFailure,
          failure: errorMessage,
        );
      } else {
        onFailureCompletion<String>(
          loading: loading,
          onFailure: onFailure,
          failure: errorMessage,
        );
      }
    }
  }

  /// Exécute une opération asynchrone et retourne le résultat ou null en cas d'erreur
  /// 
  /// Utile pour les opérations où vous voulez gérer les erreurs manuellement
  /// [operation] : Fonction asynchrone à exécuter
  /// Retourne le résultat en cas de succès, null en cas d'erreur
  Future<T?> executeOperationSafe<T>({
    required Future<T> Function() operation,
  }) async {
    try {
      return await operation();
    } catch (e) {
      if (e is RemoteException) {
        debugPrint('RemoteException: ${e.remoteMessage}');
      } else {
        debugPrint('Error in executeOperationSafe: $e');
      }
      return null;
    }
  }

  /// Exécute une opération asynchrone et retourne le résultat ou lève une exception
  /// 
  /// Utile pour les opérations où vous voulez propager les erreurs
  /// [operation] : Fonction asynchrone à exécuter
  /// Retourne le résultat ou lève une exception
  Future<T> executeOperationWithThrow<T>({
    required Future<T> Function() operation,
  }) async {
    return await operation();
  }

  /// Extrait le message d'erreur depuis une exception
  String _extractErrorMessage(Object error, String? defaultMessage) {
    if (error is RemoteException) {
      return error.remoteMessage;
    } else if (error is Exception) {
      return error.toString();
    } else {
      return defaultMessage ?? defaultError;
    }
  }

  /// Vérifie si l'erreur est une erreur d'autorisation (401)
  bool _isUnauthorizedError(Object error) {
    if (error is RemoteException) {
      return error.code == 401;
    }
    return false;
  }

  /// Gère une erreur et appelle le callback approprié
  /// 
  /// [error] : L'erreur à traiter
  /// [loading] : Callback pour mettre à jour l'état de chargement
  /// [onFailure] : Callback appelé en cas d'échec
  /// [onUnauthorized] : Callback optionnel appelé en cas d'erreur 401
  void handleError({
    required Object error,
    LoadingCallback? loading,
    OnFailureCallback<String>? onFailure,
    VoidCallback? onUnauthorized,
  }) {
    final errorMessage = _extractErrorMessage(error, null);
    final isUnauthorized = _isUnauthorizedError(error);

    if (isUnauthorized && onUnauthorized != null) {
      onFailureCompletion<String>(
        isUnauthorized: true,
        onSuccessRefreshToken: onUnauthorized,
        loading: loading,
        onFailure: onFailure,
        failure: errorMessage,
      );
    } else {
      onFailureCompletion<String>(
        loading: loading,
        onFailure: onFailure,
        failure: errorMessage,
      );
    }
  }
}

