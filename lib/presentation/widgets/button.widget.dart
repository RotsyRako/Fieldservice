import 'dart:async';

import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/presentation/widgets/modal.widget.dart';
import 'package:flutter/material.dart';

class Button {
  static Widget elevated({
    double height = 60.0,
    TextStyle? textStyle,
    VoidCallback? onPressed,
    Color? color,
    required String buttonTitle,
    Icon? icon,
    bool isGradient = false,
  }) {
    return SizedBox(
      height: height,
      width: double.infinity, // 🟢 Prend tout l'espace dispo (Row friendly)
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient:
              isGradient
                  ? const LinearGradient(
                    colors: [
                      Color.fromRGBO(153, 99, 173, 1), // gauche
                      Color.fromRGBO(63, 41, 71, 1), // droite
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                  : null,
          color: isGradient ? null : (color ?? ThemeColors.violet),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor:
                Colors.transparent, // 👈 nécessaire pour voir le gradient
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child:
              icon != null
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon,
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          buttonTitle,
                          style:
                              textStyle ??
                              bodyM.copyWith(color: ThemeColors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                  : Text(
                    buttonTitle,
                    style: textStyle ?? body.copyWith(color: ThemeColors.white),
                    textAlign: TextAlign.center,
                  ),
        ),
      ),
    );
  }

  static Widget buildRunningTimer({
  required BuildContext context,
  void Function()? onStart,
  void Function()? onPause,
  void Function()? onReset,
  void Function(Duration, String)? onConfirm,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      final _localState = _TimerLocalState.instance;

      void _start() {
        _localState.timer?.cancel();
        _localState.isRunning = true;
        _localState.hasStarted = true;
        _localState.timer = Timer.periodic(const Duration(seconds: 1), (_) {
          _localState.elapsedSeconds++;
          setState(() {});
        });
        onStart?.call();
        setState(() {});
      }

      void _pause() {
        _localState.timer?.cancel();
        _localState.isRunning = false;
        onPause?.call();
        setState(() {});
      }

      void _reset() {
        _localState.timer?.cancel();
        _localState.elapsedSeconds = 0;
        _localState.isRunning = false;
        _localState.hasStarted = false;
        onReset?.call();
        setState(() {});
      }

      void _confirm() {
        _pause();
        final time = Duration(seconds: _localState.elapsedSeconds);
        
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (_) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Modal.buildConfirmTime(
              context: context,
              time: "${time.inHours.toString().padLeft(2, '0')}:${(time.inMinutes % 60).toString().padLeft(2, '0')}:${(time.inSeconds % 60).toString().padLeft(2, '0')}",
              onConfirm: (desc) {
                // Tu reçois ici la description, tu peux appeler onConfirm si besoin
                onConfirm?.call(time, desc);
                print("Description: $desc");
              },
            ),
          ),
        );
      }

      String _format(int seconds) {
        final d = Duration(seconds: seconds);
        return "${d.inHours.toString().padLeft(2, '0')}:${(d.inMinutes % 60).toString().padLeft(2, '0')}:${(d.inSeconds % 60).toString().padLeft(2, '0')}";
      }

      // 👉 Affiche le bouton si jamais démarré
      if (!_localState.hasStarted) {
        return Button.elevated(
          onPressed: _start,
          buttonTitle: "Démarrer l'intervention",
          height: 50,
          textStyle: const TextStyle(fontSize: 18, color: Colors.white),
          color: ThemeColors.violet,
          icon: const Icon(
            Icons.timer_outlined,
            color: Colors.white,
            size: 18,
          ),
        );
      }

      // 👉 Sinon, affichage du timer classique
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
                  _format(_localState.elapsedSeconds),
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
                  onPressed: _reset,
                  icon: Icon(Icons.delete_outline, color: ThemeColors.violet),
                ),
                IconButton(
                  onPressed: _localState.isRunning ? _pause : _start,
                  icon: Icon(
                    _localState.isRunning ? Icons.pause : Icons.play_arrow,
                    color: ThemeColors.violet,
                  ),
                ),
                IconButton(
                  onPressed: _confirm,
                  icon: Icon(Icons.check, color: ThemeColors.violet),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
}

/// Singleton local pour stocker les états persistants
class _TimerLocalState {
  Timer? timer;
  int elapsedSeconds = 0;
  bool isRunning = false;
  bool hasStarted = false;

  static final _TimerLocalState instance = _TimerLocalState();
}
