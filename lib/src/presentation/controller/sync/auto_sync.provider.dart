import 'dart:async';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:field_service/src/services/technical/connection_service.dart';
import 'package:field_service/src/services/technical/app_shared_preferences.dart';
import 'package:field_service/src/presentation/controller/sync/sync.controller.dart';
import 'package:field_service/src/common/theme/widgets/theme_pop_up/theme_pop_up.dart';
import 'package:field_service/src/common/theme/widgets/theme_pop_up/theme_pop_up_type.dart';
import 'package:field_service/src/routing/app_router.dart';

part 'auto_sync.provider.g.dart';

/// Provider qui écoute les changements de connexion et déclenche la synchronisation automatique
@riverpod
class AutoSyncNotifier extends _$AutoSyncNotifier {
  StreamSubscription<bool>? _connectionSubscription;
  bool _lastConnectionStatus = false;
  bool _isInitialized = false;

  @override
  FutureOr<void> build() async {
    if (_isInitialized) return;
    _isInitialized = true;

    // Récupérer le service de connexion pour accéder au stream
    final connectionService = ref.read(connectionServiceProvider);
    
    // Écouter les changements de connexion
    _connectionSubscription = connectionService.connectionStream.listen(
      (isOnline) {
        _handleConnectionChange(isOnline);
      },
    );

    // Vérifier l'état initial
    final initialStatus = await connectionService.checkConnection();
    _handleConnectionChange(initialStatus);

    ref.onDispose(() {
      _connectionSubscription?.cancel();
    });
  }

  Future<void> _handleConnectionChange(bool isOnline) async {
    // Vérifier que le ref est toujours monté avant de continuer
    if (!ref.mounted) {
      return;
    }
    
    final appSharedPreferences = await ref.read(appSharedPreferencesProvider.future);
    final isSync = appSharedPreferences.isSync;
    
    if (!isOnline) {
      // Si on passe en hors ligne, mettre isSync à false
      _lastConnectionStatus = isOnline;
      if (ref.mounted) {
        await appSharedPreferences.setIsSync(false);
      }
    } else if (isOnline && !_lastConnectionStatus) {
      // Si on passe de hors ligne à en ligne pour la première fois
      _lastConnectionStatus = isOnline;
      
      // Vérifier si isSync est false avant de déclencher la synchronisation
      // La synchro ne doit se faire QUE si on est en ligne ET isSync == false
      if (!isSync) {
        // Déclencher la synchronisation
        final syncController = ref.read(syncControllerProvider.notifier);
        try {
          await syncController.syncAllInterventions();
          // Après la synchro (success), isSync sera mis à true dans syncAllInterventions
        } catch (e) {
          // En cas d'erreur, mettre isSync à true pour éviter les tentatives répétées
          // Mais seulement si le ref est toujours monté
          if (ref.mounted) {
            try {
              await appSharedPreferences.setIsSync(true);
            } catch (_) {
              // Ignorer si le provider est déjà disposé
            }
            // Afficher un popup d'erreur
            final errorMessage = e.toString().replaceAll('Exception: ', '');
            _showErrorPopup(errorMessage);
          }
        }
      }
    } else {
      _lastConnectionStatus = isOnline;
    }
  }

  void _showErrorPopup(String errorMessage) {
    // Récupérer le contexte depuis le navigator global
    final navigatorKey = ref.read(navigatorKeyProvider);
    final context = navigatorKey.currentContext;
    
    if (context != null) {
      showPopup(
        context: context,
        type: ThemePopUpType.error,
        title: 'Erreur de synchronisation',
        message: errorMessage,
        buttonLabel: 'OK',
      );
    }
  }
}

