import 'package:arkup_edoo/common/utils/location.utils.dart';
import 'package:arkup_edoo/models/constant/intervention_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final currentPositionProvider = FutureProvider<Position>((ref) async {
  bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    throw Exception('Location services are disabled.');
  }

  var permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
  }

  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    throw Exception('Location permissions are denied');
  }

  return Geolocator.getCurrentPosition();
});

class BadgeStatusAndDistance extends ConsumerWidget {
  final int status;
  final double latitude;
  final double longitude;

  const BadgeStatusAndDistance({
    super.key,
    required this.status,
    required this.latitude,
    required this.longitude,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusInfo = status.toInterventionStatus();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: statusInfo.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            statusInfo.displayName,
            style: TextStyle(
              color: statusInfo.color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        ref.watch(currentPositionProvider).when(
              data: (position) {
                final distance = distanceBetweenKm(
                  latitude,
                  longitude,
                  position.latitude,
                  position.longitude,
                );
                return Text(
                  "${distance.toStringAsFixed(1).replaceAll('.', ',')} km",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
              error: (error, stackTrace) => const Text(
                "—",
                style: TextStyle(color: Colors.grey),
              ),
              loading: () => const SizedBox.shrink(),
            ),
      ],
    );
  }
}
