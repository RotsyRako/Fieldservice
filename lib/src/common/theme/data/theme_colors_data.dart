// ignore_for_file: unused-code

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

const _kAnthraciteRed = Color(0xFF73233C);
const _kSpanishPurple = Color(0xFF660534);
const _kFigBalsamic = Color(0xFF51092D);
const _kForestMaid = Color(0xFF54C256);
const _kUnicornSilver = Color(0xFFE8E8E8);
const _kTransparent = Color(0x00000000);

const _kWhite = Color(0xFFFFFFFF);
const _kBlack = Color(0xFF000000);
const _kOrangeSherbert = Color(0xFFFFC49B);
const _kNeonNazar = Color(0xFF1A5427);
const _kMercure = Color(0xFFEBEBEB);
const _kPerfumeHaze = Color(0xFFF3ECF5);
const _kCrownJewels = Color(0xFF9963AD);
const _kJagger = Color(0xFF3F2947);
const _kWizardGrey = Color(0xFF4F5E66);

class ThemeColorsData with EquatableMixin {
  const ThemeColorsData({
    required this.brightness,
    required this.baseWhite,
    required this.baseBlack,
    required this.primary50,
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.surface,
    required this.secondary,
    required this.grey50,
    required this.grey100,
    required this.success,
    required this.error,
    required this.disabled,
  }) : transparent = _kTransparent;

  const ThemeColorsData.light()
    : brightness = Brightness.light,
      baseWhite = _kWhite,
      primary50 = _kCrownJewels,
      primary100 = _kJagger,
      primary200 = _kNeonNazar,
      primary300 = _kFigBalsamic,
      primary400 = _kSpanishPurple,
      surface = _kPerfumeHaze,
      secondary = _kWizardGrey,
      transparent = _kTransparent,
      grey50 = _kWizardGrey,
      grey100 = _kMercure,
      success = _kForestMaid,
      baseBlack = _kBlack,
      disabled = _kUnicornSilver,
      error = _kAnthraciteRed;

  final Color baseWhite;
  final Color baseBlack;
  final Color primary50;
  final Color primary100;
  final Color primary200;
  final Color primary300;
  final Color primary400;
  final Color surface;
  final Color secondary;
  final Color transparent;
  final Color grey50;
  final Color grey100;
  final Color success;
  final Color error;
  final Color disabled;
  final Brightness brightness;

  /// [ColorScheme] generated from [ThemeColorsData].
  ColorScheme get colorsScheme => ColorScheme(
    brightness: brightness,
    primary: primary100,
    onPrimary: baseWhite,
    secondary: secondary,
    onSecondary: primary200,
    error: error,
    onError: baseWhite,
    surface: surface,
    onSurface: primary200,
  );

  @override
  List<Object?> get props => [
    baseWhite,
    baseBlack,
    primary100,
    primary200,
    primary300,
    primary400,
    surface,
    secondary,
    grey100,
    success,
    transparent,
    brightness,
    error,
    disabled,
    primary50,
    grey50,
  ];
}

class ThemeColorsDataExtension
    extends ThemeExtension<ThemeColorsDataExtension> {
  const ThemeColorsDataExtension({required this.colors});

  final ThemeColorsData colors;

  @override
  ThemeColorsDataExtension copyWith({ThemeColorsData? colors}) {
    return ThemeColorsDataExtension(colors: colors ?? this.colors);
  }

  @override
  ThemeColorsDataExtension lerp(
    ThemeExtension<ThemeColorsDataExtension>? other,
    double t,
  ) {
    final scopedOther = other as ThemeColorsDataExtension?;
    return ThemeColorsDataExtension(
      colors: ThemeColorsData(
        brightness: t < 0.5
            ? colors.brightness
            : (scopedOther?.colors.brightness ?? colors.brightness),
        baseWhite: Color.lerp(
          colors.baseWhite,
          scopedOther?.colors.baseWhite,
          t,
        )!,
        baseBlack: Color.lerp(
          colors.baseBlack,
          scopedOther?.colors.baseBlack,
          t,
        )!,
        primary50: Color.lerp(
          colors.primary50,
          scopedOther?.colors.primary50,
          t,
        )!,
        primary100: Color.lerp(
          colors.primary100,
          scopedOther?.colors.primary100,
          t,
        )!,
        primary200: Color.lerp(
          colors.primary200,
          scopedOther?.colors.primary200,
          t,
        )!,
        primary300: Color.lerp(
          colors.primary300,
          scopedOther?.colors.primary300,
          t,
        )!,
        primary400: Color.lerp(
          colors.primary400,
          scopedOther?.colors.primary400,
          t,
        )!,
        surface: Color.lerp(colors.surface, scopedOther?.colors.surface, t)!,
        secondary: Color.lerp(
          colors.secondary,
          scopedOther?.colors.secondary,
          t,
        )!,
        grey50: Color.lerp(colors.grey50, scopedOther?.colors.grey50, t)!,
        grey100: Color.lerp(colors.grey100, scopedOther?.colors.grey100, t)!,
        success: Color.lerp(colors.success, scopedOther?.colors.success, t)!,
        error: Color.lerp(colors.error, scopedOther?.colors.error, t)!,
        disabled: Color.lerp(colors.disabled, scopedOther?.colors.disabled, t)!,
      ),
    );
  }
}
