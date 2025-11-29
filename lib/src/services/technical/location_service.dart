// ignore_for_file: unused-code
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_service.g.dart';

/// Service pour gérer les permissions et le partage de localisation
class LocationService {
  const LocationService();

  /// Demande la permission de localisation à l'utilisateur
  ///
  /// Retourne le statut de la permission après la demande
  Future<PermissionStatus> requestLocationPermission() async {
    final status = await Permission.location.request();
    return status;
  }

  /// Vérifie si la permission de localisation est accordée
  Future<bool> hasLocationPermission() async {
    final status = await Permission.location.status;
    return status.isGranted;
  }

  /// Vérifie si la permission de localisation est refusée définitivement
  Future<bool> isLocationPermissionPermanentlyDenied() async {
    final status = await Permission.location.status;
    return status.isPermanentlyDenied;
  }

  /// Ouvre les paramètres de l'application pour que l'utilisateur
  /// puisse activer manuellement la permission
  Future<bool> openLocationAppSettings() {
    return openAppSettings();
  }
}

@Riverpod(keepAlive: true)
LocationService locationService(Ref _) {
  return const LocationService();
}
