import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/presentation/view/intervention/widget/work_time_entry.dart';

class TimeEntryWidget extends StatelessWidget {
  const TimeEntryWidget({
    required this.entry,
    required this.isReadOnly,
    required this.onDelete,
    required this.onEdit,
    super.key,
  });

  final WorkTimeEntry entry;
  final bool isReadOnly;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.colors.grey50.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Date
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ThemeText.bodyXSmallSemiBold(
                    'Date',
                    color: theme.colors.baseBlack,
                  ),
                  ThemeText.bodySmallBold(
                    entry.date,
                    color: theme.colors.grey50,
                  ),
                ],
              ),
              const SizedBox(width: 24),
              // Temps
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ThemeText.bodyXSmallSemiBold(
                    'Temps',
                    color: theme.colors.baseBlack,
                  ),
                  ThemeText.bodySmallBold(
                    entry.time,
                    color: theme.colors.grey50,
                  ),
                ],
              ),
              const Spacer(),
              // Boutons d'action (masqués si en lecture seule)
              if (!isReadOnly) ...[
                IconButton(
                  iconSize: 16,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.delete_outline,
                    size: 16,
                    color: theme.colors.grey50,
                  ),
                  onPressed: onDelete,
                ),
                const SizedBox(width: 8),
                IconButton(
                  iconSize: 16,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: Icon(
                    Icons.edit_outlined,
                    size: 16,
                    color: theme.colors.primary50,
                  ),
                  onPressed: onEdit,
                ),
              ],
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThemeText.bodyXSmallSemiBold(
                'Description',
                color: theme.colors.baseBlack,
              ),
              ThemeText.bodySmallMedium(
                entry.description,
                color: theme.colors.grey50,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

