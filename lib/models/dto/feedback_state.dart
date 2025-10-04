import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoadingState {
  final bool show;
  final String? message;

  const LoadingState({required this.show, this.message});
}

class ErrorState {
  final bool show;
  final String message;

  const ErrorState({required this.show, required this.message});
}

class SnackbarState {
  final bool show;
  final String message;
  final bool isError;

  const SnackbarState({
    this.show = false,
    this.message = '',
    this.isError = false,
  });
}

final loadingStateProvider = StateProvider<LoadingState>((_) => const LoadingState(show: false));
final errorStateProvider = StateProvider<ErrorState>((_) => const ErrorState(show: false, message: ''));
final snackbarStateProvider = StateProvider<SnackbarState>((ref) => const SnackbarState());
