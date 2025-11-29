// ignore_for_file: unused-code

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Data class that holds every theme radius.
class ThemeRadiiData with EquatableMixin {
  /// default constructor.
  const ThemeRadiiData({
    required this.xs,
    required this.s,
    required this.sm,
    required this.m,
    required this.l,
    required this.xl,
    required this.xxl,
    required this.xxxl,
  });

  /// Instantiate [ThemeRadiiData] with `regular` data.
  const ThemeRadiiData.regular()
    : xs = const Radius.circular(2),
      s = const Radius.circular(4),
      sm = const Radius.circular(6),
      m = const Radius.circular(8),
      l = const Radius.circular(10),
      xl = const Radius.circular(16),
      xxl = const Radius.circular(32),
      xxxl = const Radius.circular(48);

  /// Value are:
  /// * 2 for `regular`
  final Radius xs;

  /// Value are:
  /// * 4 for `regular`
  final Radius s;

  /// Value are:
  /// * 6 for `regular`
  final Radius sm;

  /// Value are:
  /// * 8 for `regular`
  final Radius m;

  /// Value are:
  /// * 10 for `regular`
  final Radius l;

  /// Value are:
  /// * 16 for `regular`
  final Radius xl;

  /// Value are:
  /// * 32 for `regular`
  final Radius xxl;

  /// Value are:
  /// * 48 for `regular`
  final Radius xxxl;

  /// Return a new data class with the same values but expressed in
  /// [BorderRadius].
  ThemeBorderRadiusData get asBorderRadius => ThemeBorderRadiusData(this);

  @override
  List<Radius> get props => [xs, s, sm, m, l, xl, xxl, xxxl];
}

/// Border radius data
class ThemeBorderRadiusData {
  /// default constructor.
  const ThemeBorderRadiusData(this._radii);

  final ThemeRadiiData _radii;

  /// [BorderRadius] xs getter linked to [ThemeRadiiData.xs]
  BorderRadius get xs => BorderRadius.all(_radii.xs);

  /// [BorderRadius] s getter linked to [ThemeRadiiData.s]
  BorderRadius get s => BorderRadius.all(_radii.s);

  /// [BorderRadius] sm getter linked to [ThemeRadiiData.sm]
  BorderRadius get sm => BorderRadius.all(_radii.sm);

  /// [BorderRadius] m getter linked to [ThemeRadiiData.m]
  BorderRadius get m => BorderRadius.all(_radii.m);

  /// [BorderRadius] l getter linked to [ThemeRadiiData.l]
  BorderRadius get l => BorderRadius.all(_radii.l);

  /// [BorderRadius] xl getter linked to [ThemeRadiiData.xl]
  BorderRadius get xl => BorderRadius.all(_radii.xl);

  /// [BorderRadius] xxl getter linked to [ThemeRadiiData.xxl]
  BorderRadius get xxl => BorderRadius.all(_radii.xxl);

  /// [BorderRadius] xxxl getter linked to [ThemeRadiiData.xs]
  BorderRadius get xxxl => BorderRadius.all(_radii.xxxl);
}

/// [ThemeExtension] for theme border radius providing the capability to
/// smoothly transition from a [ThemeRadiiData] to another
///
/// Leveraging Flutter 3's [ThemeExtension] system
class ThemeRadiiDataExtension extends ThemeExtension<ThemeRadiiDataExtension> {
  /// default constructor.
  const ThemeRadiiDataExtension({required this.radii});

  /// [ThemeRadiiData] which will be accessible through this theme
  /// extension
  final ThemeRadiiData radii;

  @override
  ThemeRadiiDataExtension copyWith({ThemeRadiiData? radii}) {
    return ThemeRadiiDataExtension(radii: radii ?? this.radii);
  }

  @override
  ThemeRadiiDataExtension lerp(
    ThemeExtension<ThemeRadiiDataExtension>? other,
    double t,
  ) {
    final otherRadius = (other as ThemeRadiiDataExtension?)?.radii;

    return ThemeRadiiDataExtension(
      radii: ThemeRadiiData(
        xs: Radius.lerp(radii.xs, otherRadius?.xs, t) ?? Radius.zero,
        s: Radius.lerp(radii.s, otherRadius?.s, t) ?? Radius.zero,
        sm: Radius.lerp(radii.sm, otherRadius?.sm, t) ?? Radius.zero,
        m: Radius.lerp(radii.m, otherRadius?.m, t) ?? Radius.zero,
        l: Radius.lerp(radii.l, otherRadius?.l, t) ?? Radius.zero,
        xl: Radius.lerp(radii.xl, otherRadius?.xl, t) ?? Radius.zero,
        xxl: Radius.lerp(radii.xxl, otherRadius?.xxl, t) ?? Radius.zero,
        xxxl: Radius.lerp(radii.xxxl, otherRadius?.xxxl, t) ?? Radius.zero,
      ),
    );
  }
}
