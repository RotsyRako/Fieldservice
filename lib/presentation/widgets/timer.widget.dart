import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/presentation/controller/timer.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/models/constant/timer_status.enum.dart';

class TimerWidget extends ConsumerWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerNotifierProvider);
    final timerPosition = ref.watch(timerPositionProvider);

    if (timerState.status == TimerStatus.initial) {
      return const SizedBox.shrink();
    }

    final duration = Duration(seconds: timerState.elapsedSeconds);
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    final timerContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: ThemeColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.timer_outlined, color: ThemeColors.violet, size: 18),
          const SizedBox(width: 8),
          Text(
            '$hours:$minutes:$seconds',
            style: const TextStyle(
              color: ThemeColors.violet,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );

    final size = MediaQuery.of(context).size;
    final safeArea = MediaQuery.of(context).padding;

    const widgetWidth = 150.0;
    const widgetHeight = 50.0;

    // Calculate the default bottom-right position
    final defaultPosition = Offset(
      size.width - widgetWidth,
      size.height - safeArea.bottom - widgetHeight,
    );

    // If the position is null (on first launch), set it after the first frame is built.
    if (timerPosition == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (ref.read(timerPositionProvider) == null) {
          ref.read(timerPositionProvider.notifier).state = defaultPosition;
        }
      });
    }

    // Use the state's position, or the default if the state is still null for this build frame.
    final currentPosition = timerPosition ?? defaultPosition;

    return Positioned(
      left: currentPosition.dx,
      top: currentPosition.dy,
      child: Draggable(
        feedback: timerContent,
        childWhenDragging: Container(),
        onDragEnd: (details) {
          double dx = details.offset.dx;
          double dy = details.offset.dy;

          // Ensure the widget stays within the horizontal bounds of the screen.
          if (dx < 0) dx = 0;
          if (dx + widgetWidth > size.width) dx = size.width - widgetWidth;

          // Ensure the widget stays within the vertical bounds of the safe area.
          if (dy < safeArea.top) dy = safeArea.top;
          if (dy + widgetHeight > size.height - safeArea.bottom) {
            dy = size.height - safeArea.bottom - widgetHeight;
          }

          ref.read(timerPositionProvider.notifier).state = Offset(dx, dy);
        },
        child: timerContent,
      ),
    );
  }
}
