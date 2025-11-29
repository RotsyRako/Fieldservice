import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_shared_preferences.g.dart';

class AppSharedPreferences {
  const AppSharedPreferences({
    required SharedPreferences sharedPreferences,
    required StreamController<String?> authStateStreamController,
  })  : _sharedPreferences = sharedPreferences,
        _authStateStreamController = authStateStreamController;

  final SharedPreferences _sharedPreferences;
  final StreamController<String?> _authStateStreamController;

  static const String _keyIsAuthenticated = 'isAuthenticated';
  static const String _keyAuthToken = 'authToken';
  static const String _keyIsInterventionTableCreated = 'isInterventionTableCreated';
  static const String _keyIsSync = 'isSync';

  bool get isAuthenticated => _sharedPreferences.getBool(_keyIsAuthenticated) ?? false;
  String? get authToken => _sharedPreferences.getString(_keyAuthToken);
  bool get isInterventionTableCreated => _sharedPreferences.getBool(_keyIsInterventionTableCreated) ?? false;
  bool get isSync => _sharedPreferences.getBool(_keyIsSync) ?? false;

  /// Stream qui émet le token d'authentification (ou null si déconnecté)
  /// Similaire à authStateChanges() de Firebase Auth
  Stream<String?> authStateChanges() async* {
    // Émettre la valeur actuelle immédiatement
    yield authToken;
    
    // Puis émettre tous les changements futurs
    yield* _authStateStreamController.stream.asBroadcastStream().distinct();
  }

  Future<void> updateIsAuthenticated({
    required bool isAuthenticated,
    String? token,
  }) async {
    await _sharedPreferences.setBool(_keyIsAuthenticated, isAuthenticated);
    
    if (token != null) {
      await _sharedPreferences.setString(_keyAuthToken, token);
      _authStateStreamController.add(token);
    } else {
      await _sharedPreferences.remove(_keyAuthToken);
      _authStateStreamController.add(null);
    }
  }

  Future<void> signOut() async {
    await updateIsAuthenticated(isAuthenticated: false, token: null);
    await setIsInterventionTableCreated(false);
  }

  Future<void> setIsInterventionTableCreated(bool value) async {
    await _sharedPreferences.setBool(_keyIsInterventionTableCreated, value);
  }

  Future<void> setIsSync(bool value) async {
    await _sharedPreferences.setBool(_keyIsSync, value);
  }
}

@riverpod
bool isAuthenticated(Ref ref) {
  final appSharedPreferences = ref
      .watch(appSharedPreferencesProvider)
      .requireValue;
  return appSharedPreferences.isAuthenticated;
}

@riverpod
Stream<String?> authStateChanges(Ref ref) {
  final appSharedPreferences = ref
      .watch(appSharedPreferencesProvider)
      .requireValue;
  return appSharedPreferences.authStateChanges();
}

@riverpod
bool isInterventionTableCreated(Ref ref) {
  final appSharedPreferences = ref
      .watch(appSharedPreferencesProvider)
      .requireValue;
  return appSharedPreferences.isInterventionTableCreated;
}

@riverpod
bool isSync(Ref ref) {
  final appSharedPreferences = ref
      .watch(appSharedPreferencesProvider)
      .requireValue;
  return appSharedPreferences.isSync;
}

@Riverpod(keepAlive: true)
Future<AppSharedPreferences> appSharedPreferences(Ref ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  
  // Créer un StreamController pour les changements d'authentification
  final authStateStreamController = StreamController<String?>.broadcast();
  
  // Nettoyer le controller quand le provider est disposé
  ref.onDispose(() {
    authStateStreamController.close();
  });
  
  return AppSharedPreferences(
    sharedPreferences: sharedPreferences,
    authStateStreamController: authStateStreamController,
  );
}
