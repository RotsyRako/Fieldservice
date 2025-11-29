import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/presentation/view/intervention/work_monitoring.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';

class MaterialsSectionWidget extends ConsumerWidget {
  const MaterialsSectionWidget({
    required this.interventionId,
    required this.isExpanded,
    required this.isReadOnly,
    required this.onToggleExpanded,
    required this.onEditMaterials,
    super.key,
  });

  final String interventionId;
  final bool isExpanded;
  final bool isReadOnly;
  final VoidCallback onToggleExpanded;
  final VoidCallback onEditMaterials;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final materialsAsync = ref.watch(materialsByInterventionProvider(interventionId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Iconify(
                    Ph.traffic_cone,
                    size: 14,
                    color: theme.colors.primary50,
                  ),
                  const ThemeGap.xs(),
                  Expanded(
                    child: ThemeText.bodySmallBold(
                      'Matériels utilisés',
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              iconSize: 16,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
                size: 16,
                color: theme.colors.primary50,
              ),
              onPressed: onToggleExpanded,
            ),
          ],
        ),
        if (isExpanded) ...[
          const ThemeGap.sm(),
          materialsAsync.when(
            data: (materials) {
              if (materials.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(left: 18, bottom: 4),
                  child: ThemeText.bodySmallMedium(
                    'Aucun matériel enregistré',
                    color: theme.colors.grey50,
                  ),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: materials.map(
                  (material) => Padding(
                    padding: const EdgeInsets.only(left: 18, bottom: 4),
                    child: ThemeText.bodySmallMedium(
                      '• ${material.name} x${material.quantity}',
                      color: theme.colors.grey50,
                    ),
                  ),
                ).toList(),
              );
            },
            loading: () => Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 4),
              child: ThemeText.bodySmallMedium(
                'Chargement...',
                color: theme.colors.grey50,
              ),
            ),
            error: (error, stack) => Padding(
              padding: const EdgeInsets.only(left: 18, bottom: 4),
              child: ThemeText.bodySmallMedium(
                'Erreur lors du chargement',
                color: theme.colors.primary200,
              ),
            ),
          ),
          if (!isReadOnly) ...[
            const ThemeGap.sm(),
            GestureDetector(
              onTap: onEditMaterials,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Iconify(
                    Ph.pencil_simple,
                    size: 16,
                    color: theme.colors.primary50,
                  ),
                  const ThemeGap.xs(),
                  ThemeText.bodySmallBold(
                    'Modifier la liste',
                    color: theme.colors.primary50,
                  ),
                ],
              ),
            ),
          ],
        ],
      ],
    );
  }
}

