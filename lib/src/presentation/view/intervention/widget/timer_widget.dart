import 'dart:async';
import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    required this.onStop,
    required this.onComplete,
    super.key,
  });

  final VoidCallback onStop;
  final Function(Duration) onComplete;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? _timer;
  Duration _elapsed = Duration.zero;
  bool _isRunning = false;
  DateTime? _startTime;
  Duration _pausedDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    if (!_isRunning) {
      _startTime = DateTime.now();
      _isRunning = true;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            final now = DateTime.now();
            _elapsed = _pausedDuration + now.difference(_startTime!);
          });
        }
      });
    }
  }

  void _pauseTimer() {
    if (_isRunning && _startTime != null) {
      _timer?.cancel();
      _pausedDuration += DateTime.now().difference(_startTime!);
      setState(() {
        _isRunning = false;
      });
    }
  }

  void _resumeTimer() {
    if (!_isRunning) {
      _startTime = DateTime.now();
      setState(() {
        _isRunning = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (mounted) {
          setState(() {
            final now = DateTime.now();
            _elapsed = _pausedDuration + now.difference(_startTime!);
          });
        }
      });
    }
  }

  void _stopTimer() {
    _timer?.cancel();
    widget.onStop();
  }

  void _completeTimer() {
    _timer?.cancel();
    widget.onComplete(_elapsed);
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colors.baseWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.colors.grey50.withValues(alpha: 0.08),
          width: 1,
        ),
      ),
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        minHeight: 44, // Hauteur minimale similaire au bouton
        maxHeight: 44, // Hauteur maximale pour correspondre au bouton
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Affichage du temps avec icône chrono
          Row(
            children: [
              Iconify(
                Ph.timer,
                size: 16,
                color: theme.colors.primary50,
              ),
              const ThemeGap.xs(),
              ThemeText.h5Bold(
                _formatDuration(_elapsed),
                color: theme.colors.primary50,
              ),
            ],
          ),
          // Boutons d'action
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bouton supprimer/arrêter
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  size: 20,
                  color: theme.colors.grey50,
                ),
                onPressed: _stopTimer,
                tooltip: 'Arrêter',
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
              const ThemeGap.s(),
              // Bouton pause/reprendre
              IconButton(
                icon: Iconify(
                  _isRunning ? Ic.pause : Ic.play_arrow,
                  size: 20,
                  color: theme.colors.primary50,
                ),
                onPressed: _isRunning ? _pauseTimer : _resumeTimer,
                tooltip: _isRunning ? 'Pause' : 'Reprendre',
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
              const ThemeGap.s(),
              // Bouton terminer
              IconButton(
                icon: Iconify(
                  Ic.check,
                  size: 20,
                  color: theme.colors.primary50,
                ),
                onPressed: _completeTimer,
                tooltip: 'Terminer',
                constraints: const BoxConstraints(
                  minWidth: 32,
                  minHeight: 32,
                ),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

