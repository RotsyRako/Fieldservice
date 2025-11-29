import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:field_service/src/common/config/app_config.dart';
import 'package:field_service/src/models/constants/urls.dart';

part 'connection_service.g.dart';

/// Service pour gérer l'état de connexion internet
class ConnectionService {
  ConnectionService._();

  final Connectivity _connectivity = Connectivity();
  final _controller = StreamController<bool>.broadcast();
  StreamSubscription<List<ConnectivityResult>>? _subscription;
  Timer? _periodicCheckTimer;
  bool _isOnline = false;
  bool _isInitialized = false;
  bool? _lastKnownStatus;

  /// Fait un ping au serveur pour vérifier que l'accès Internet fonctionne vraiment
  Future<bool> _pingServer() async {
    try {
      final baseUrl = AppConfig.baseUrl;
      // Construire l'URL comme dans base_remote.repository.dart: $base/api$url
      final pingUrl = '$baseUrl/api${Urls.urls.ping}';
      final response = await http.get(
        Uri.parse(pingUrl),
      ).timeout(
        const Duration(seconds: 5),
        onTimeout: () {
          throw TimeoutException('Ping timeout');
        },
      );

      // Considérer en ligne si le serveur répond (même avec une erreur 401/403)
      // car cela signifie qu'Internet fonctionne
      return response.statusCode >= 200 && response.statusCode < 500;
    } catch (_) {
      // Si le ping échoue, on considère qu'on est hors ligne
      return false;
    }
  }

  /// Vérifie si l'appareil est connecté à internet
  /// 
  /// Vérifie d'abord la connectivité réseau (WiFi/mobile data).
  /// Si une connexion réseau existe, fait un ping au serveur pour vérifier
  /// que l'accès Internet fonctionne vraiment.
  Future<bool> checkConnection() async {
    try {
      // Vérifier d'abord la connectivité réseau
      final connectivityResults = await _connectivity.checkConnectivity();
      final hasNetworkConnection = connectivityResults.any(
        (result) => result != ConnectivityResult.none,
      );

      if (!hasNetworkConnection) {
        return false;
      }

      // Si on a une connexion réseau, faire un ping au serveur
      return await _pingServer();
    } catch (_) {
      return false;
    }
  }

  /// Stream de l'état de connexion
  /// 
  /// Émet true quand connecté, false quand déconnecté
  Stream<bool> get connectionStream {
    // Initialiser la vérification une seule fois
    if (!_isInitialized) {
      _initializeConnectionMonitoring();
      _isInitialized = true;
    }
    
    // Si on a déjà une valeur connue, créer un stream qui émet d'abord cette valeur
    // puis continue avec le stream du controller
    if (_lastKnownStatus != null) {
      return Stream.multi((controller) {
        // Émettre la dernière valeur connue immédiatement
        controller.add(_lastKnownStatus!);
        // Puis continuer avec le stream du controller
        _controller.stream.listen(
          controller.add,
          onError: controller.addError,
          onDone: controller.close,
          cancelOnError: false,
        );
      });
    }
    
    // Retourner le stream du controller qui émet les changements
    return _controller.stream;
  }

  void _initializeConnectionMonitoring() async {
    // Vérifier l'état initial immédiatement et émettre la valeur
    // On fait cela en premier pour que le stream émette une valeur dès le début
    final initialResults = await _connectivity.checkConnectivity();
    await _updateConnectionStatus(initialResults, forceEmit: true);

    // Écouter les changements de connectivité
    _subscription = _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) async {
        await _updateConnectionStatus(results);
      },
    );

    // Vérification périodique pour détecter les changements même si
    // la connectivité réseau n'a pas changé (ex: WiFi sans internet)
    _periodicCheckTimer = Timer.periodic(
      const Duration(seconds: 5),
      (_) async {
        final results = await _connectivity.checkConnectivity();
        await _updateConnectionStatus(results);
      },
    );
  }

  Future<void> _updateConnectionStatus(
    List<ConnectivityResult> results, {
    bool forceEmit = false,
  }) async {
    final hasNetworkConnection = results.any(
      (result) => result != ConnectivityResult.none,
    );

    // Si pas de connexion réseau, on est hors ligne
    if (!hasNetworkConnection) {
      if (forceEmit || _isOnline) {
        _isOnline = false;
        _lastKnownStatus = false;
        _controller.add(false);
      }
      return;
    }

    // Si on a une connexion réseau, vérifier vraiment Internet avec un ping
    final isOnline = await _pingServer();
    
    if (forceEmit || _isOnline != isOnline) {
      _isOnline = isOnline;
      _lastKnownStatus = isOnline;
      _controller.add(isOnline);
    }
  }

  void dispose() {
    _subscription?.cancel();
    _periodicCheckTimer?.cancel();
    _controller.close();
  }
}

@Riverpod(keepAlive: true)
ConnectionService connectionService(Ref ref) {
  final service = ConnectionService._();
  ref.onDispose(() => service.dispose());
  return service;
}

@riverpod
Stream<bool> connectionStatus(Ref ref) async* {
  final connectionService = ref.watch(connectionServiceProvider);
  
  // Vérifier rapidement la connectivité réseau d'abord (sans ping)
  // pour avoir une valeur initiale immédiate
  final connectivity = Connectivity();
  final connectivityResults = await connectivity.checkConnectivity();
  final hasNetworkConnection = connectivityResults.any(
    (result) => result != ConnectivityResult.none,
  );
  
  // Émettre une valeur optimiste basée sur la connectivité réseau
  // Le ping viendra ensuite via le stream et mettra à jour si nécessaire
  yield hasNetworkConnection;
  
  // Puis écouter les changements de connexion (qui incluent le ping)
  yield* connectionService.connectionStream;
}

