import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ConnectionST {
  final Connectivity _connectivity;
  final _controller = StreamController<bool>.broadcast();
  bool _lastStatus = false; // Garde l'état précédent pour éviter les doublons
  Timer? _debounceTimer;

  ConnectionST({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity() {
    _init();
  }

  void _init() {
    _connectivity.onConnectivityChanged.listen((results) {
      final result = results.isNotEmpty ? results.first : ConnectivityResult.none;

      // ✅ Debounce pour éviter trop de requêtes
      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 800), () async {
        final isConnected = await _hasInternet(result);
        if (isConnected != _lastStatus) {
          _lastStatus = isConnected;
          _controller.add(isConnected);
        }
      });
    });
  }

  Stream<bool> monitorConnection() => _controller.stream;

  Future<bool> _hasInternet(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) return false;
    try {
      final response = await http
          .head(Uri.parse('https://www.google.com'))
          .timeout(const Duration(seconds: 3));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  void dispose() {
    _debounceTimer?.cancel();
    _controller.close();
  }
}

final connectionServiceProvider = Provider<ConnectionST>((ref) {
  final service = ConnectionST();
  ref.onDispose(service.dispose);
  return service;
});

final connectionStatusProvider = StreamProvider<bool>((ref) {
  final connectionService = ref.watch(connectionServiceProvider);
  return connectionService.monitorConnection();
});
