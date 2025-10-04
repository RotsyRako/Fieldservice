import 'dart:async';
import 'package:arkup_edoo/models/constant/timer_status.enum.dart';
import 'package:flutter/material.dart';
import 'package:arkup_edoo/service/applying/local/intervention/intervention_local.sa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// State model for the timer
class TimerState {
  final int elapsedSeconds;
  final TimerStatus status;
  final String? interventionId;

  const TimerState({
    this.elapsedSeconds = 0,
    this.status = TimerStatus.initial,
    this.interventionId,
  });

  TimerState copyWith({
    int? elapsedSeconds,
    TimerStatus? status,
    String? interventionId,
  }) {
    return TimerState(
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      status: status ?? this.status,
      interventionId: interventionId ?? this.interventionId,
    );
  }
}

// Notifier for the timer state
class TimerNotifier extends StateNotifier<TimerState> {
  Timer? _timer;
  final Ref _ref;

  TimerNotifier(this._ref) : super(const TimerState());

  Future<void> loadTimer(String interventionId) async {
    final interventionService = _ref.read(interventionLocalSAProvider);
    final runningIntervention =
        await interventionService.findRunningOrPausedIntervention();

    if (runningIntervention != null) {
      if (runningIntervention.localId.toString() != interventionId) {
        // A timer is already running or paused for another intervention, so we block loading.
        return;
      }
    }

    final intervention = await interventionService.findById(
      int.parse(interventionId),
    );

    if (intervention != null) {
      state = state.copyWith(
        elapsedSeconds: intervention.elapsedSeconds,
        status:
            TimerStatus.values[intervention.timerStatus ??
                TimerStatus.initial.index],
        interventionId: interventionId,
      );
      pauseTimer();
      resumeTimer();
    }
  }

  Future<void> startTimer(String interventionId) async {
    final interventionService = _ref.read(interventionLocalSAProvider);
    final runningIntervention =
        await interventionService.findRunningOrPausedIntervention();

    if (runningIntervention != null) {
      if (runningIntervention.localId.toString() != interventionId) {
        // A timer is already running or paused for another intervention, so we block loading.
        return;
      }
    }
    await loadTimer(interventionId);
    if (state.status == TimerStatus.running) return;

    _timer?.cancel(); // Cancel any existing timer
    state = state.copyWith(
      status: TimerStatus.running,
      interventionId: interventionId,
    );
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state.copyWith(elapsedSeconds: state.elapsedSeconds + 1);
      _persistState();
    });
  }

  void pauseTimer() {
    if (state.status == TimerStatus.running) {
      _timer?.cancel();
      state = state.copyWith(status: TimerStatus.paused);
      _persistState();
    }
  }

  void resumeTimer() {
    if (state.status == TimerStatus.running ||
        state.status == TimerStatus.paused) {
      state = state.copyWith(status: TimerStatus.running);
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        state = state.copyWith(elapsedSeconds: state.elapsedSeconds + 1);
        _persistState();
      });
    }
  }

  Future<void> stopTimer() async {
    // Safely stop and clear timer even if no interventionId is set
    _timer?.cancel();

    if (state.interventionId == null) {
      state = const TimerState();
      return;
    }

    final interventionService = _ref.read(interventionLocalSAProvider);
    final intervention = await interventionService.findById(
      int.parse(state.interventionId!),
    );

    if (intervention != null) {
      final updatedIntervention = intervention.copyWith(
        timerStatus: null,
        elapsedSeconds: null,
      );
      await interventionService.updateOnly(data: updatedIntervention);
    }

    state = const TimerState(); // Reset state to initial
  }

  Future<void> _persistState() async {
    if (state.interventionId == null) return;

    final interventionService = _ref.read(interventionLocalSAProvider);
    final intervention = await interventionService.findById(
      int.parse(state.interventionId!),
    );

    if (intervention != null) {
      final updatedIntervention = intervention.copyWith(
        timerStatus: state.status.index,
        elapsedSeconds: state.elapsedSeconds,
      );
      await interventionService.updateOnly(data: updatedIntervention);
    }
  }

  void restartTimer() {
    _timer?.cancel();
    state = state.copyWith(elapsedSeconds: 0, status: TimerStatus.running);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state.copyWith(elapsedSeconds: state.elapsedSeconds + 1);
      _persistState();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

// Provider for the timer notifier
final timerNotifierProvider = StateNotifierProvider<TimerNotifier, TimerState>((
  ref,
) {
  return TimerNotifier(ref);
});

final timerPositionProvider = StateProvider<Offset?>((ref) {
  return null; // Initial position will be set in the widget
});
