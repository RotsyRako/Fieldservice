// ignore_for_file: unused-code

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_size_behavior.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text_type.dart';

/// Texts in Theme
class ThemeText extends StatelessWidget {
  /// Display the h3Regular text
  const ThemeText.h3Regular(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.h3Regular;

  /// Display the h3Medium text
  const ThemeText.h3Medium(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.h3Medium;

  /// Display the h3Bold text
  const ThemeText.h3Bold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.h3Bold;

  /// Display the h4SemiBold text
  const ThemeText.h4SemiBold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.h4SemiBold;

  /// Display the h4ExtraBold text
  const ThemeText.h4ExtraBold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.h4ExtraBold;

  /// Display the h5Bold text
  const ThemeText.h5Bold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.h5Bold;

  /// Display the h6Regular text
  const ThemeText.h6Regular(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.h6Regular;

  /// Display the h6SemiBold text
  const ThemeText.h6SemiBold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.h6SemiBold;

  /// Display the h6Bold text
  const ThemeText.h6Bold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.h6Bold;

  /// Display the bodyLargeRegular text
  const ThemeText.bodyLargeRegular(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodyLargeRegular;

  /// Display the bodyLargeMedium text
  const ThemeText.bodyLargeMedium(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodyLargeMedium;

  /// Display the bodyLargeSemiBold text
  const ThemeText.bodyLargeSemiBold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodyLargeSemiBold;

  /// Display the bodyLargeBold text
  const ThemeText.bodyLargeBold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodyLargeBold;

  /// Display the bodyMediumRegular text
  const ThemeText.bodyMediumRegular(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodyMediumRegular;

  /// Display the bodyMediumMedium text
  const ThemeText.bodyMediumMedium(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodyMediumMedium;

  /// Display the bodyMediumSemiBold text
  const ThemeText.bodyMediumSemiBold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodyMediumSemiBold;

  /// Display the bodySmallRegular text
  const ThemeText.bodySmallRegular(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodySmallRegular;

  /// Display the bodySmallMedium text
  const ThemeText.bodySmallMedium(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodySmallMedium;

  /// Display the bodySmallSemiBold text
  const ThemeText.bodySmallSemiBold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodySmallSemiBold;

  /// Display the bodySmallBold text
  const ThemeText.bodySmallBold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodySmallBold;

  /// Display the bodyXSmallRegular text
  const ThemeText.bodyXSmallRegular(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodyXSmallRegular;

  /// Display the bodyXSmallMedium text
  const ThemeText.bodyXSmallMedium(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodyXSmallMedium;

  /// Display the bodyXSmallSemiBold text
  const ThemeText.bodyXSmallSemiBold(
    this.data, {
    super.key,
    this.textAlign,
    this.height,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.color,
    this.fontWeight,
    this.fontStyle,
    this.sizeBehavior = ThemeSizeBehavior.fixed,
    this.decoration,
  }) : enumStyle = ThemeTextType.bodyXSmallSemiBold;

  /// The text to display.
  final String data;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// Whether the text should break at soft line breaks.
  final bool? softWrap;

  /// How visual overflow should be handled.
  final TextOverflow? overflow;

  /// The number of font pixels for each logical pixel.
  final double? textScaleFactor;

  /// An optional maximum number of lines for the text to span, wrapping if
  /// necessary.
  /// If the text exceeds the given number of lines, it will be truncated
  /// according
  /// to [overflow].
  final int? maxLines;

  /// Change the color of the text
  final Color? color;

  /// Change the font weight of the text
  final FontWeight? fontWeight;

  /// Change the font style of the text
  final FontStyle? fontStyle;

  final ThemeSizeBehavior sizeBehavior;

  /// Change style of the text
  final ThemeTextType enumStyle;

  /// A linear decoration to draw near the text.
  final TextDecoration? decoration;

  /// The height of the text
  final double? height;

  /// Returns the style corresponding to the given [enumStyle]
  ///
  /// The is useful to get the style in TextSpan for example
  static TextStyle styleOf(BuildContext context, ThemeTextType enumStyle) {
    final theme = Theme.of(context);

    return switch (enumStyle) {
      ThemeTextType.h3Regular => theme.textStyles.h3Regular,
      ThemeTextType.h3Medium => theme.textStyles.h3Medium,
      ThemeTextType.h3Bold => theme.textStyles.h3Bold,
      ThemeTextType.h4SemiBold => theme.textStyles.h4SemiBold,
      ThemeTextType.h4ExtraBold => theme.textStyles.h4ExtraBold,
      ThemeTextType.h5Bold => theme.textStyles.h5Bold,
      ThemeTextType.h6Regular => theme.textStyles.h6Regular,
      ThemeTextType.h6SemiBold => theme.textStyles.h6SemiBold,
      ThemeTextType.h6Bold => theme.textStyles.h6Bold,
      ThemeTextType.bodyLargeRegular => theme.textStyles.bodyLargeRegular,
      ThemeTextType.bodyLargeMedium => theme.textStyles.bodyLargeMedium,
      ThemeTextType.bodyLargeSemiBold => theme.textStyles.bodyLargeSemiBold,
      ThemeTextType.bodyLargeBold => theme.textStyles.bodyLargeBold,
      ThemeTextType.bodyMediumRegular => theme.textStyles.bodyMediumRegular,
      ThemeTextType.bodyMediumMedium => theme.textStyles.bodyMediumMedium,
      ThemeTextType.bodyMediumSemiBold => theme.textStyles.bodyMediumSemiBold,
      ThemeTextType.bodySmallRegular => theme.textStyles.bodySmallRegular,
      ThemeTextType.bodySmallMedium => theme.textStyles.bodySmallMedium,
      ThemeTextType.bodySmallSemiBold => theme.textStyles.bodySmallSemiBold,
      ThemeTextType.bodySmallBold => theme.textStyles.bodySmallBold,
      ThemeTextType.bodyXSmallRegular => theme.textStyles.bodyXSmallRegular,
      ThemeTextType.bodyXSmallMedium => theme.textStyles.bodyXSmallMedium,
      ThemeTextType.bodyXSmallSemiBold => theme.textStyles.bodyXSmallSemiBold,
    };
  }

  @override
  Widget build(BuildContext context) {
    final style = styleOf(context, enumStyle).copyWith(
      height: height,
      color: color ?? DefaultTextStyle.of(context).style.color,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
      decorationColor: color,
    );

    return switch (sizeBehavior) {
      ThemeSizeBehavior.autoResize => AutoSizeText(
        data,
        style: style,
        textAlign: textAlign,
        softWrap: softWrap,
        overflow: overflow,
        textScaleFactor: textScaleFactor,
        maxLines: maxLines,
      ),
      ThemeSizeBehavior.fixed => Text(
        data,
        style: style,
        textAlign: textAlign,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: TextScaler.linear(textScaleFactor ?? 1.0),
        maxLines: maxLines,
        textHeightBehavior: const TextHeightBehavior(
          // This is for the text to be centered vertically even when
          // an height is set.
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ),
    };
  }
}
