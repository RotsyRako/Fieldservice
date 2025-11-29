import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/models/constants/interventions_status.dart';
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';

class InterventionCard extends StatelessWidget {
  const InterventionCard({
    required this.intervention,
    this.onTap,
    super.key,
  });

  final InterventionDto intervention;
  final VoidCallback? onTap;

  String get priorityColor {
    switch (intervention.priority.toLowerCase()) {
      case 'haute':
        return '#C67C21';
      case 'moyenne':
        return '#9963AD';
      case 'basse':
        return '#4F5E66';
      default:
        return '#9963AD';
    }
  }

  Color _parseColor(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = InterventionsStatus.fromValue(intervention.status);
    final isCompleted = status == InterventionsStatus.termine;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isCompleted
              ? theme.colors.baseWhite.withValues(alpha: 0.64)
              : theme.colors.baseWhite,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ligne 1: Statut et Distance
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Statut badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: status.backgroundColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: ThemeText.bodyXSmallSemiBold(
                    status.label,
                    color: status.textColor,
                  ),
                ),
                
                // Distance
                ThemeText.bodySmallBold(
                  '${intervention.distance} km',
                  color: isCompleted
                      ? theme.colors.primary50.withValues(alpha: 0.4)
                      : theme.colors.primary50,
                ),
              ],
            ),
            
            const ThemeGap.xs(),
            
            // Titre
            ThemeText.bodyLargeBold(
              intervention.titre,
              color: isCompleted
                  ? theme.colors.baseBlack.withValues(alpha: 0.4)
                  : theme.colors.baseBlack,
            ),
            
            const ThemeGap.xs(),
            
            // Date range
            Row(
              children: [
                ThemeText.bodySmallBold(
                  intervention.dateStart,
                  color: theme.colors.grey50,
                ),
                const ThemeGap.s(),
                Icon(
                  Icons.arrow_forward,
                  size: 12,
                  color: theme.colors.primary50,
                ),
                const ThemeGap.s(),
                ThemeText.bodySmallBold(
                  intervention.dateEnd,
                  color: theme.colors.grey50,
                ),
              ],
            ),
            
            const ThemeGap.s(),
            
            // Priorité et Client
            Row(
              children: [
                // Priorité badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                  decoration: BoxDecoration(
                    color: _parseColor(priorityColor).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning,
                        size: 14,
                        color: _parseColor(priorityColor),
                      ),
                      const ThemeGap.xxs(),
                      ThemeText.bodySmallMedium(
                        intervention.priority,
                        color: theme.colors.baseBlack,
                      ),
                    ],
                  ),
                ),
                
                const ThemeGap.sm(),
                
                // Client
                ThemeText.bodySmallBold(
                  intervention.customer,
                  color: theme.colors.grey50.withValues(alpha: 0.64),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

