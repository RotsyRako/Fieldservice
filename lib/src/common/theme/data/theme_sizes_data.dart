// ignore_for_file: unused-code

import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Data class that holds every theme sizes.
class ThemeSizesData with EquatableMixin {
  /// default constructor.
  const ThemeSizesData({
    required this.zero,
    required this.xxs,
    required this.xs,
    required this.s,
    required this.sm,
    required this.m,
    required this.l,
    required this.xl,
    required this.xxl,
    required this.xxxl,
    required this.xxxxl,
    required this.xxxxxl,
    required this.xxxxxxl,
  });

  /// Instantiate ThemeSizesData with `regular` data.
  const ThemeSizesData.regular()
    : zero = 0,
      xxs = 2,
      xs = 4,
      s = 8,
      sm = 12,
      m = 16,
      l = 24,
      xl = 32,
      xxl = 48,
      xxxl = 64,
      xxxxl = 80,
      xxxxxl = 120,
      xxxxxxl = 170;

  /// Value is 0
  final double zero;

  ///Value is 2
  final double xxs;

  /// Value is 4
  final double xs;

  /// Value is 8
  ///
  final double s;

  /// Value is 12
  final double sm;

  /// Value is 16
  final double m;

  /// Value is 24
  final double l;

  /// Value is 32
  final double xl;

  /// Value is 48
  final double xxl;

  /// Value is 64
  final double xxxl;

  /// Value is 80
  final double xxxxl;

  /// Value is 120
  final double xxxxxl;

  /// Value is 170
  final double xxxxxxl;

  /// Return a new data class with the same values but expressed in
  /// [EdgeInsets].
  ThemeEdgeInsetsSizeData get asInsets => ThemeEdgeInsetsSizeData(this);

  @override
  List<double> get props => [
    zero,
    xxs,
    xs,
    s,
    sm,
    m,
    l,
    xl,
    xxl,
    xxxl,
    xxxxl,
    xxxxxl,
    xxxxxxl,
  ];
}

/// [ThemeExtension] for theme sizes providing the capability to
/// smoothly transition from a [ThemeSizesData] to another
///
/// Leveraging Flutter 3's [ThemeExtension] system
class ThemeSizesDataExtension extends ThemeExtension<ThemeSizesDataExtension> {
  /// default constructor.
  const ThemeSizesDataExtension({required this.sizes});

  /// [ThemeSizesData] which will be accessible through this theme
  /// extension
  final ThemeSizesData sizes;

  @override
  ThemeSizesDataExtension copyWith({ThemeSizesData? sizes}) {
    return ThemeSizesDataExtension(sizes: sizes ?? this.sizes);
  }

  @override
  ThemeSizesDataExtension lerp(
    ThemeExtension<ThemeSizesDataExtension>? other,
    double t,
  ) {
    final otherSizes = (other as ThemeSizesDataExtension?)?.sizes;

    return ThemeSizesDataExtension(
      sizes: ThemeSizesData(
        zero: lerpDouble(sizes.zero, otherSizes?.zero, t) ?? 0,
        xxs: lerpDouble(sizes.xxs, otherSizes?.xxs, t) ?? 0,
        xs: lerpDouble(sizes.xs, otherSizes?.xs, t) ?? 0,
        s: lerpDouble(sizes.s, otherSizes?.s, t) ?? 0,
        sm: lerpDouble(sizes.sm, otherSizes?.sm, t) ?? 0,
        m: lerpDouble(sizes.m, otherSizes?.m, t) ?? 0,
        l: lerpDouble(sizes.l, otherSizes?.l, t) ?? 0,
        xl: lerpDouble(sizes.xl, otherSizes?.xl, t) ?? 0,
        xxl: lerpDouble(sizes.xxl, otherSizes?.xxl, t) ?? 0,
        xxxl: lerpDouble(sizes.xxxl, otherSizes?.xxxl, t) ?? 0,
        xxxxl: lerpDouble(sizes.xxxxl, otherSizes?.xxxxl, t) ?? 0,
        xxxxxl: lerpDouble(sizes.xxxxxl, otherSizes?.xxxxxl, t) ?? 0,
        xxxxxxl: lerpDouble(sizes.xxxxxxl, otherSizes?.xxxxxxl, t) ?? 0,
      ),
    );
  }
}

/// Edge insets data
class ThemeEdgeInsetsSizeData {
  /// default constructor.
  const ThemeEdgeInsetsSizeData(this._spacing);

  final ThemeSizesData _spacing;

  // all
  /// [EdgeInsets] zero getter linked to [ThemeSizesData.zero]
  ///
  /// Value is 0
  EdgeInsets get zero => EdgeInsets.all(_spacing.zero);

  /// [EdgeInsets] xxs getter linked to [ThemeSizesData.xs]
  ///
  /// Value is 2
  EdgeInsets get xxs => EdgeInsets.all(_spacing.xxs);

  /// [EdgeInsets] xs getter linked to [ThemeSizesData.xs]
  ///
  /// Value is 4
  EdgeInsets get xs => EdgeInsets.all(_spacing.xs);

  /// [EdgeInsets] s getter linked to [ThemeSizesData.s]
  ///
  /// Value is 8
  EdgeInsets get s => EdgeInsets.all(_spacing.s);

  /// [EdgeInsets] sm getter linked to [ThemeSizesData.sm]
  ///
  /// Value is 12
  EdgeInsets get sm => EdgeInsets.all(_spacing.sm);

  /// [EdgeInsets] m getter linked to [ThemeSizesData.m]
  ///
  /// Value is 16
  EdgeInsets get m => EdgeInsets.all(_spacing.m);

  /// [EdgeInsets] l getter linked to [ThemeSizesData.l]
  ///
  /// Value is 24
  EdgeInsets get l => EdgeInsets.all(_spacing.l);

  /// [EdgeInsets] xl getter linked to [ThemeSizesData.xl]
  ///
  /// Value is 32
  EdgeInsets get xl => EdgeInsets.all(_spacing.xl);

  /// [EdgeInsets] xxl getter linked to [ThemeSizesData.xxl]
  ///
  /// Value is 48
  EdgeInsets get xxl => EdgeInsets.all(_spacing.xxl);

  /// [EdgeInsets] xxxl getter linked to [ThemeSizesData.xxxl]
  ///
  /// Value is 64
  EdgeInsets get xxxl => EdgeInsets.all(_spacing.xxxl);

  /// [EdgeInsets] xxxxl getter linked to [ThemeSizesData.xxxxl]
  ///
  /// Value is 80
  EdgeInsets get xxxxl => EdgeInsets.all(_spacing.xxxxl);

  /// [EdgeInsets] xxxxxl getter linked to [ThemeSizesData.xxxxxl]
  ///
  /// Value is 120
  EdgeInsets get xxxxxl => EdgeInsets.all(_spacing.xxxxxl);

  /// [EdgeInsets] xxxxxxl getter linked to [ThemeSizesData.xxxxxxl]
  ///
  /// Value is 170
  EdgeInsets get xxxxxxl => EdgeInsets.all(_spacing.xxxxxxl);
}
