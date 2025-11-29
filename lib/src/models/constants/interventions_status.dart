import 'package:flutter/material.dart';

/// Enum pour les statuts des interventions
enum InterventionsStatus {
  planifie(1, 'Planifiée'),
  enCours(2, 'En cours'),
  termine(3, 'Terminée');

  final int value;
  final String label;

  const InterventionsStatus(this.value, this.label);

  static InterventionsStatus fromValue(int value) {
    return InterventionsStatus.values.firstWhere(
      (e) => e.value == value,
      orElse: () => InterventionsStatus.planifie,
    );
  }

  Color get backgroundColor {
    switch (this) {
      case InterventionsStatus.planifie:
        return const Color(0xFF2F781D).withValues(alpha: 0.12);
      case InterventionsStatus.enCours:
        return const Color(0xFFC67C21).withValues(alpha: 0.12);
      case InterventionsStatus.termine:
        return const Color(0xFF4F5E66).withValues(alpha: 0.12);
    }
  }

  Color get textColor {
    switch (this) {
      case InterventionsStatus.planifie:
        return const Color(0xFF2F781D);
      case InterventionsStatus.enCours:
        return const Color(0xFFC67C21);
      case InterventionsStatus.termine:
        return const Color(0xFF4F5E66);
    }
  }
}
