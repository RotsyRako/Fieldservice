import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/models/dto/timesheet/timesheet_dto.dart';
import 'package:field_service/src/presentation/controller/intervention/intervention.controller.dart';
import 'package:field_service/src/presentation/view/intervention/widget/timer_widget.dart';
import 'package:field_service/src/presentation/view/intervention/widget/time_entry_widget.dart';
import 'package:field_service/src/presentation/view/intervention/work_monitoring.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';

class TimeSectionWidget extends ConsumerStatefulWidget {
  const TimeSectionWidget({
    required this.interventionId,
    required this.isExpanded,
    required this.isTimerActive,
    required this.isReadOnly,
    required this.onToggleExpanded,
    required this.onStartTimer,
    required this.onStopTimer,
    required this.onTimerComplete,
    required this.onAddTime,
    required this.onDeleteTime,
    required this.onEditTime,
    super.key,
  });

  final String interventionId;
  final bool isExpanded;
  final bool isTimerActive;
  final bool isReadOnly;
  final VoidCallback onToggleExpanded;
  final VoidCallback onStartTimer;
  final VoidCallback onStopTimer;
  final Future<void> Function(Duration duration) onTimerComplete;
  final VoidCallback onAddTime;
  final void Function(TimesheetDto timesheet) onDeleteTime;
  final void Function(TimesheetDto timesheet) onEditTime;

  @override
  ConsumerState<TimeSectionWidget> createState() => _TimeSectionWidgetState();
}

class _TimeSectionWidgetState extends ConsumerState<TimeSectionWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    // Récupérer les feuilles de temps depuis la base locale
    final timesheetsAsync = ref.watch(
      timesheetsByInterventionProvider(widget.interventionId),
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: widget.onToggleExpanded,
          child: Row(
            children: [
              Iconify(
                Ph.clock,
                size: 14,
                color: theme.colors.primary50,
              ),
              const ThemeGap.xs(),
              Expanded(
                child: ThemeText.bodySmallBold(
                  'Temps d\'intervention',
                ),
              ),
              Icon(
                widget.isExpanded ? Icons.expand_less : Icons.expand_more,
                size: 16,
                color: theme.colors.primary50,
              ),
            ],
          ),
        ),
        if (widget.isExpanded) ...[
          const ThemeGap.sm(),
          timesheetsAsync.when(
            data: (timesheets) {
              // Convertir les TimesheetDto en WorkTimeEntry
              final workTimeEntries = timesheets.map((timesheet) {
                return TimesheetUtils.timesheetToWorkTimeEntry(timesheet);
              }).toList();
              
              return Column(
                children: [
                  // Afficher les entrées de temps si elles existent
                  if (workTimeEntries.isNotEmpty) ...[
                    ...workTimeEntries.map((entry) => TimeEntryWidget(
                      entry: entry,
                      isReadOnly: widget.isReadOnly,
                      onDelete: () => widget.onDeleteTime(entry.timesheet),
                      onEdit: () => widget.onEditTime(entry.timesheet),
                    )),
                    const ThemeGap.s(),
                  ],
                  // Masquer les boutons si en lecture seule
                  if (!widget.isReadOnly) ...[
                    // Afficher le timer si actif, sinon le bouton
                    if (widget.isTimerActive) ...[
                      TimerWidget(
                        onStop: widget.onStopTimer,
                        onComplete: widget.onTimerComplete,
                      ),
                      const ThemeGap.s(),
                    ] else ...[
                      ThemeButton.primary(
                        icon: Iconify(Ph.timer, size: 16).toString(),
                        label: 'Démarrer l\'intervention',
                        onPressed: widget.isTimerActive ? null : widget.onStartTimer,
                        fullWidth: true,
                        radius: BorderRadius.circular(8),
                        horizontalPadding: 12,
                        verticalPadding: 8,
                      ),
                      const ThemeGap.xs(),
                    ],
                    ThemeButton.alternative(
                      icon: Iconify(Ph.plus, size: 16).toString(),
                      label: 'Ajouter un temps passé',
                      onPressed: widget.isTimerActive ? null : widget.onAddTime,
                      fullWidth: true,
                      radius: BorderRadius.circular(8),
                      horizontalPadding: 12,
                      verticalPadding: 8,
                    ),
                  ],
                ],
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stack) => const SizedBox.shrink(),
          ),
        ],
      ],
    );
  }
}

