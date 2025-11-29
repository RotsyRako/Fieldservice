import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_colors_data.dart';
import 'package:field_service/src/common/theme/data/theme_durations_data.dart';
import 'package:field_service/src/common/theme/data/theme_radii_data.dart';
import 'package:field_service/src/common/theme/data/theme_sizes_data.dart';
import 'package:field_service/src/common/theme/data/theme_text_styles_data.dart';
import 'package:field_service/src/common/theme/utils/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData get lightTheme {
  const colors = ThemeColorsData.light();
  return _getThemeDataFromColors(colors);
}

ThemeData _getThemeDataFromColors(ThemeColorsData colorsTheme) {
  final fallbackTheme = ThemeData.fallback();

  final textStylesData = ThemeTextStylesData.regular();
  const sizesData = ThemeSizesData.regular();
  const radiiData = ThemeRadiiData.regular();
  const durations = ThemeDurationsData.regular();

  final borderRadius = radiiData.asBorderRadius.l;

  return fallbackTheme.copyWith(
    textTheme: GoogleFonts.bricolageGrotesqueTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.bricolageGrotesque(),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: GoogleFonts.bricolageGrotesque(),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: GoogleFonts.bricolageGrotesque(),
      ),
    ),

    scaffoldBackgroundColor: colorsTheme.surface,
    expansionTileTheme: ExpansionTileThemeData(
      tilePadding: sizesData.asInsets.m.horizontalOnly,
      childrenPadding: sizesData.asInsets.m.horizontalOnly,
      expandedAlignment: Alignment.bottomLeft,
      backgroundColor: colorsTheme.baseWhite,
      iconColor: colorsTheme.primary200,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: colorsTheme.baseBlack.withValues(alpha: 0.5)),
      ),
      collapsedShape: RoundedRectangleBorder(
        borderRadius: borderRadius,
        side: BorderSide(color: colorsTheme.baseBlack.withValues(alpha: 0.5)),
      ),
    ),
    colorScheme: colorsTheme.colorsScheme,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: textStylesData.bodyMediumRegular.copyWith(
        color: colorsTheme.grey100,
      ),
      contentPadding: sizesData.asInsets.sm,
      filled: true,
      errorStyle: textStylesData.bodySmallRegular.copyWith(
        color: colorsTheme.error,
      ),
      suffixIconColor: colorsTheme.grey100,
      iconColor: colorsTheme.grey100,
      fillColor: colorsTheme.baseWhite,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorsTheme.error),
        borderRadius: borderRadius,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorsTheme.primary200),
        borderRadius: borderRadius,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colorsTheme.primary100),
        borderRadius: borderRadius,
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorsTheme.primary200.withValues(alpha: 0.5),
        ),
        borderRadius: borderRadius,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colorsTheme.primary200.withValues(alpha: 0.5),
        ),
        borderRadius: borderRadius,
      ),
    ),
    extensions: [
      ThemeColorsDataExtension(colors: colorsTheme),
      const ThemeSizesDataExtension(sizes: sizesData),
      ThemeTextStylesDataExtension(textStyles: textStylesData),
      const ThemeRadiiDataExtension(radii: radiiData),
      const ThemeDurationsDataExtension(durations: durations),
    ],
  );
}

/// Extension for [ThemeData] to add getters for each theme extensions.
///
/// See: [ThemeExtension] (https://medium.com/@alexandersnotes/flutter-custom-theme-with-themeextension-792034106abc#1011)
/// Eg. [radii], [sizes], [colors].
// ignore: prefer-match-file-name
extension ThemeDataX on ThemeData {
  /// Returns [ThemeColorsData].
  ///
  /// Must be call in a sub-tree of a [Theme] widget, with the
  /// [ThemeColorsDataExtension] registered.
  ThemeColorsData get colors => extension<ThemeColorsDataExtension>()!.colors;

  /// Returns [ThemeSizesData].
  ///
  /// Must be call in a sub-tree of a [Theme] widget, with the
  /// [ThemeSizesDataExtension] registered.
  ThemeSizesData get sizes => extension<ThemeSizesDataExtension>()!.sizes;

  /// Returns [ThemeTextStylesData].
  ///
  /// Must be call in a sub-tree of a [Theme] widget, with the
  /// [ThemeTextStylesDataExtension] registered.
  ThemeTextStylesData get textStyles =>
      extension<ThemeTextStylesDataExtension>()!.textStyles;

  /// Returns [ThemeRadiiData].
  /// Must be call in a sub-tree of a [Theme] widget, with the
  /// [ThemeRadiiDataExtension] registered.
  ThemeRadiiData get radii => extension<ThemeRadiiDataExtension>()!.radii;

  /// Returns [ThemeDurationsData].
  /// Must be call in a sub-tree of a [Theme] widget, with the
  /// [ThemeDurationsDataExtension] registered.
  ThemeDurationsData get durations =>
      extension<ThemeDurationsDataExtension>()!.durations;
}
