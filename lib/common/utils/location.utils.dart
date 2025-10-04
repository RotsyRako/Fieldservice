library location_utils;

import 'dart:math';

import 'package:geolocator/geolocator.dart';

/// Returns the distance in kilometers between two latitude/longitude pairs.
///
/// This is a pure function and does not perform any I/O.
double distanceBetweenKm(
  double lat1,
  double lon1,
  double lat2,
  double lon2,
) {
  const double earthRadiusKm = 6371;

  double degreesToRadians(double degrees) => degrees * (pi / 180);

  final double lat1Rad = degreesToRadians(lat1);
  final double lon1Rad = degreesToRadians(lon1);
  final double lat2Rad = degreesToRadians(lat2);
  final double lon2Rad = degreesToRadians(lon2);

  final double dLat = lat2Rad - lat1Rad;
  final double dLon = lon2Rad - lon1Rad;

  final double a = pow(sin(dLat / 2), 2) +
      cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLon / 2), 2);

  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  return earthRadiusKm * c;
}

/// Calculates the distance between a given point and the device's current location in kilometers.
///
/// This function will request location permission if it has not been granted.
///
/// [lat1], [lon1] are the latitude and longitude of the first point in degrees.
///
/// Returns the distance in kilometers.
/// Throws an exception if location services are disabled or permissions are denied.
Future<double> calculateDistanceToDevice(double lat1, double lon1) async {
  print('=== distance calculation with data >>> lat $lat1 , lon $lon1');
  // --- Get Device Location ---
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  final Position currentPosition = await Geolocator.getCurrentPosition();
  final double lat2 = currentPosition.latitude;
  final double lon2 = currentPosition.longitude;

  // --- Calculate Distance ---
  const double earthRadiusKm = 6371;

  // Helper function to convert degrees to radians
  double degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }

  // Convert latitude and longitude from degrees to radians
  final double lat1Rad = degreesToRadians(lat1);
  final double lon1Rad = degreesToRadians(lon1);
  final double lat2Rad = degreesToRadians(lat2);
  final double lon2Rad = degreesToRadians(lon2);

  // Calculate the change in coordinates
  final double dLat = lat2Rad - lat1Rad;
  final double dLon = lon2Rad - lon1Rad;

  // Apply the Haversine formula
  final double a =
      pow(sin(dLat / 2), 2) +
      cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLon / 2), 2);

  final double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  final double distance = earthRadiusKm * c;

  return distance;
}
