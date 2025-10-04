import 'dart:ui';

import '../../common/theme/theme.utils.dart';

enum InterventionStatus {
  planned(1, 'Planifiée', ThemeColors.turquoise),
  inProgress(2, 'En cours', ThemeColors.yellow),
  completed(3, 'Terminée', ThemeColors.gray);

  final int id;
  final String displayName;
  final Color color;

  const InterventionStatus(this.id, this.displayName, this.color);

  static InterventionStatus fromId(int id) {
    return values.firstWhere(
          (status) => status.id == id,
      orElse: () => throw ArgumentError('Unknown status id: $id'),
    );
  }
}

/// Extension pour convertir un [int] en [InterventionStatus]
extension InterventionStatusExt on int {
  InterventionStatus toInterventionStatus() => InterventionStatus.fromId(this);
}