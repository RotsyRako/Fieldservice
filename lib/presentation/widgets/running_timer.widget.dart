import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/presentation/controller/timer.controller.dart';
import 'package:arkup_edoo/presentation/widgets/confirm_time.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/models/constant/timer_status.enum.dart';

class RunningTimerWidget extends ConsumerWidget {
  const RunningTimerWidget({super.key, required this.onConfirm});

  final void Function(String, String) onConfirm;

  String _formatDuration(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerNotifierProvider);
    final timerNotifier = ref.read(timerNotifierProvider.notifier);

    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: ThemeColors.violet, width: 1.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.timer_outlined, color: ThemeColors.violet),
              const SizedBox(width: 8),
              Text(
                _formatDuration(timerState.elapsedSeconds),
                style: TextStyle(
                  fontSize: 18,
                  color: ThemeColors.violet,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () => timerNotifier.stopTimer(),
                icon: Icon(Icons.delete_outline, color: ThemeColors.violet),
              ),
              IconButton(
                onPressed: () {
                  if (timerState.status == TimerStatus.running) {
                    timerNotifier.pauseTimer();
                  } else {
                    timerNotifier.resumeTimer();
                  }
                },
                icon: Icon(
                  timerState.status == TimerStatus.running
                      ? Icons.pause
                      : Icons.play_arrow,
                  color: ThemeColors.violet,
                ),
              ),
              IconButton(
                onPressed: () {
                  timerNotifier.pauseTimer();
                  final timerState = ref.watch(timerNotifierProvider);
                  final time = _formatDuration(timerState.elapsedSeconds);
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder:
                        (context) => Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: ConfirmTimeWidget(
                            time: time,
                            onConfirm: (description, time) {
                              onConfirm(
                                description,
                                time,
                              ); // appel de la fonction principale
                              timerNotifier
                                  .stopTimer(); // stopper le timer après confirmation
                            },
                          ),
                        ),
                  );
                },
                icon: Icon(Icons.check, color: ThemeColors.violet),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
