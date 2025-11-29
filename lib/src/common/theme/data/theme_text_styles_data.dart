import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Data class that holds theme TextStyles.
/// See: [TextTheme]
class ThemeTextStylesData with EquatableMixin {
  const ThemeTextStylesData({
    required this.h3Regular,
    required this.h3Medium,
    required this.h3Bold,
    required this.h4SemiBold,
    required this.h4ExtraBold,
    required this.h5Bold,
    required this.h6Regular,
    required this.h6SemiBold,
    required this.h6Bold,
    required this.bodyLargeRegular,
    required this.bodyLargeMedium,
    required this.bodyLargeSemiBold,
    required this.bodyLargeBold,
    required this.bodyMediumRegular,
    required this.bodyMediumMedium,
    required this.bodyMediumSemiBold,
    required this.bodySmallRegular,
    required this.bodySmallMedium,
    required this.bodySmallSemiBold,
    required this.bodySmallBold,
    required this.bodyXSmallRegular,
    required this.bodyXSmallMedium,
    required this.bodyXSmallSemiBold,
  });

  /// Instantiate [ThemeTextStylesData] with `regular` data.
  ThemeTextStylesData.regular()
    : h3Regular = GoogleFonts.bricolageGrotesque(height: 1, fontSize: 32),
      h3Medium = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 32,
        fontWeight: FontWeight.w500,
      ),
      h3Bold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      h4SemiBold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
      h4ExtraBold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      h5Bold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      h6Regular = GoogleFonts.bricolageGrotesque(height: 1, fontSize: 16),
      h6SemiBold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      h6Bold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLargeRegular = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 16,
      ),
      bodyLargeMedium = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      bodyLargeSemiBold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLargeBold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      bodyMediumRegular = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 14,
      ),
      bodyMediumMedium = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      bodyMediumSemiBold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      bodySmallRegular = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 12,
      ),
      bodySmallMedium = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      bodySmallSemiBold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
      bodySmallBold = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      bodyXSmallRegular = GoogleFonts.bricolageGrotesque(
        height: 1,
        fontSize: 10,
      ),
      bodyXSmallMedium = GoogleFonts.bricolageGrotesque(
        height: 1.4,
        fontSize: 10,
        fontWeight: FontWeight.w500,
      ),
      bodyXSmallSemiBold = GoogleFonts.bricolageGrotesque(
        height: 1.4,
        fontSize: 10,
        fontWeight: FontWeight.w600,
      );

  final TextStyle h3Regular;
  final TextStyle h3Medium;
  final TextStyle h3Bold;
  final TextStyle h4SemiBold;
  final TextStyle h4ExtraBold;
  final TextStyle h5Bold;
  final TextStyle h6Regular;
  final TextStyle h6SemiBold;
  final TextStyle h6Bold;
  final TextStyle bodyLargeBold;
  final TextStyle bodyLargeSemiBold;
  final TextStyle bodyLargeMedium;
  final TextStyle bodyLargeRegular;
  final TextStyle bodyMediumRegular;
  final TextStyle bodyMediumMedium;
  final TextStyle bodyMediumSemiBold;
  final TextStyle bodySmallRegular;
  final TextStyle bodySmallMedium;
  final TextStyle bodySmallSemiBold;
  final TextStyle bodySmallBold;
  final TextStyle bodyXSmallRegular;
  final TextStyle bodyXSmallMedium;
  final TextStyle bodyXSmallSemiBold;

  @override
  List<Object> get props => [
    h3Regular,
    h3Medium,
    h3Bold,
    h4SemiBold,
    h4ExtraBold,
    h5Bold,
    h6Regular,
    h6SemiBold,
    h6Bold,
    bodyLargeRegular,
    bodyLargeMedium,
    bodyLargeSemiBold,
    bodyLargeBold,
    bodyMediumRegular,
    bodyMediumMedium,
    bodyMediumSemiBold,
    bodySmallRegular,
    bodySmallMedium,
    bodySmallSemiBold,
    bodySmallBold,
    bodyXSmallRegular,
    bodyXSmallMedium,
    bodyXSmallSemiBold,
  ];
}

class ThemeTextStylesDataExtension
    extends ThemeExtension<ThemeTextStylesDataExtension> {
  const ThemeTextStylesDataExtension({required this.textStyles});

  final ThemeTextStylesData textStyles;

  @override
  ThemeExtension<ThemeTextStylesDataExtension> copyWith({
    ThemeTextStylesData? textStyles,
  }) {
    return ThemeTextStylesDataExtension(
      textStyles: textStyles ?? this.textStyles,
    );
  }

  @override
  ThemeExtension<ThemeTextStylesDataExtension> lerp(
    covariant ThemeExtension<ThemeTextStylesDataExtension>? other,
    double t,
  ) {
    if (other is! ThemeTextStylesDataExtension) {
      return this;
    }

    final otherTextStyles = other.textStyles;

    return ThemeTextStylesDataExtension(
      textStyles: ThemeTextStylesData(
        h3Regular: TextStyle.lerp(
          textStyles.h3Regular,
          otherTextStyles.h3Regular,
          t,
        )!,
        h3Medium: TextStyle.lerp(
          textStyles.h3Medium,
          otherTextStyles.h3Medium,
          t,
        )!,
        h3Bold: TextStyle.lerp(textStyles.h3Bold, otherTextStyles.h3Bold, t)!,
        h4SemiBold: TextStyle.lerp(
          textStyles.h4SemiBold,
          otherTextStyles.h4SemiBold,
          t,
        )!,
        h4ExtraBold: TextStyle.lerp(
          textStyles.h4ExtraBold,
          otherTextStyles.h4ExtraBold,
          t,
        )!,
        h5Bold: TextStyle.lerp(textStyles.h5Bold, otherTextStyles.h5Bold, t)!,
        h6Regular: TextStyle.lerp(
          textStyles.h6Regular,
          otherTextStyles.h6Regular,
          t,
        )!,
        h6SemiBold: TextStyle.lerp(
          textStyles.h6SemiBold,
          otherTextStyles.h6SemiBold,
          t,
        )!,
        h6Bold: TextStyle.lerp(textStyles.h6Bold, otherTextStyles.h6Bold, t)!,
        bodyLargeRegular: TextStyle.lerp(
          textStyles.bodyLargeRegular,
          otherTextStyles.bodyLargeRegular,
          t,
        )!,
        bodyLargeMedium: TextStyle.lerp(
          textStyles.bodyLargeMedium,
          otherTextStyles.bodyLargeMedium,
          t,
        )!,
        bodyLargeSemiBold: TextStyle.lerp(
          textStyles.bodyLargeSemiBold,
          otherTextStyles.bodyLargeSemiBold,
          t,
        )!,
        bodyLargeBold: TextStyle.lerp(
          textStyles.bodyLargeBold,
          otherTextStyles.bodyLargeBold,
          t,
        )!,
        bodyMediumRegular: TextStyle.lerp(
          textStyles.bodyMediumRegular,
          otherTextStyles.bodyMediumRegular,
          t,
        )!,
        bodyMediumMedium: TextStyle.lerp(
          textStyles.bodyMediumMedium,
          otherTextStyles.bodyMediumMedium,
          t,
        )!,
        bodyMediumSemiBold: TextStyle.lerp(
          textStyles.bodyMediumSemiBold,
          otherTextStyles.bodyMediumSemiBold,
          t,
        )!,
        bodySmallRegular: TextStyle.lerp(
          textStyles.bodySmallRegular,
          otherTextStyles.bodySmallRegular,
          t,
        )!,
        bodySmallMedium: TextStyle.lerp(
          textStyles.bodySmallMedium,
          otherTextStyles.bodySmallMedium,
          t,
        )!,
        bodySmallSemiBold: TextStyle.lerp(
          textStyles.bodySmallSemiBold,
          otherTextStyles.bodySmallSemiBold,
          t,
        )!,
        bodySmallBold: TextStyle.lerp(
          textStyles.bodySmallBold,
          otherTextStyles.bodySmallBold,
          t,
        )!,
        bodyXSmallRegular: TextStyle.lerp(
          textStyles.bodyXSmallRegular,
          otherTextStyles.bodyXSmallRegular,
          t,
        )!,
        bodyXSmallMedium: TextStyle.lerp(
          textStyles.bodyXSmallMedium,
          otherTextStyles.bodyXSmallMedium,
          t,
        )!,
        bodyXSmallSemiBold: TextStyle.lerp(
          textStyles.bodyXSmallSemiBold,
          otherTextStyles.bodyXSmallSemiBold,
          t,
        )!,
      ),
    );
  }
}
