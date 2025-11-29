// ignore_for_file: unused-code

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Data class that holds every theme durations.
class ThemeDurationsData with EquatableMixin {
  /// default constructor.
  const ThemeDurationsData({
    required this.zero,
    required this.xxxs,
    required this.xxs,
    required this.xs,
    required this.s,
    required this.sm,
    required this.m,
    required this.l,
    required this.xl,
    required this.xxl,
  });

  /// Instantiate ThemeDurationData with `regular` data.
  const ThemeDurationsData.regular()
    : zero = Duration.zero,
      xxxs = const Duration(milliseconds: 100),
      xxs = const Duration(milliseconds: 200),
      xs = const Duration(milliseconds: 400),
      s = const Duration(milliseconds: 700),
      sm = const Duration(seconds: 2),
      m = const Duration(seconds: 4),
      l = const Duration(seconds: 6),
      xl = const Duration(seconds: 8),
      xxl = const Duration(seconds: 12);

  /// Value are:
  /// * 0 milliseconds for `regular`
  final Duration zero;

  /// Value are:
  /// * 100 milliseconds for `regular`
  final Duration xxxs;

  /// Value are:
  /// * 200 milliseconds for `regular`
  final Duration xxs;

  /// Value are:
  /// * 400 milliseconds for `regular`
  final Duration xs;

  /// Value are:
  /// * 700 milliseconds for `regular`
  final Duration s;

  /// Value are:
  /// * 2 seconds for `regular`
  final Duration sm;

  /// Value are:
  /// * 4 seconds for `regular`
  final Duration m;

  /// Value are:
  /// * 6 seconds for `regular`
  final Duration l;

  /// Value are:
  /// * 8 seconds for `regular`
  final Duration xl;

  /// Value are:
  /// * 12 seconds for `regular`
  final Duration xxl;

  @override
  List<Duration> get props => [zero, xxxs, xxs, xs, s, sm, m, l, xl, xxl];
}

class ThemeDurationsDataExtension
    extends ThemeExtension<ThemeDurationsDataExtension> {
  const ThemeDurationsDataExtension({required this.durations});

  final ThemeDurationsData durations;

  @override
  ThemeDurationsDataExtension copyWith({ThemeDurationsData? durations}) {
    return ThemeDurationsDataExtension(durations: durations ?? this.durations);
  }

  @override
  ThemeDurationsDataExtension lerp(
    ThemeExtension<ThemeDurationsDataExtension>? other,
    double t,
  ) => const ThemeDurationsDataExtension(
    durations: ThemeDurationsData.regular(),
  );
}
