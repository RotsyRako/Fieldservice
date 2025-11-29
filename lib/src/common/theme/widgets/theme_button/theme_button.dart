// ignore_for_file: unused-code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button_conditional_fitted_box.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button_full_width_wrapper.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button_icon_position.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button_type.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_icon/theme_icon.dart';
import 'package:field_service/src/common/theme/widgets/theme_loader/theme_loader.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_size_behavior.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

const _kButtonMinimumSize = Size(64, kMinInteractiveDimensionCupertino);

class ThemeButton extends StatelessWidget {
  const ThemeButton.primary({
    this.onPressed,
    super.key,
    this.icon = '',
    this.label,
    this.color,
    this.outlineColor,
    this.textDecoration,
    this.onLongPress,
    this.loading = false,
    this.iconPosition = ThemeButtonIconPosition.left,
    this.fullWidth = false,
    this.forceSingleLine = false,
    this.alignment = MainAxisAlignment.center,
    this.horizontalPadding,
    this.verticalPadding,
    this.enabled = true,
    this.textBuilder = ThemeText.bodyLargeSemiBold,
    this.useTextColorAsIconColor = true,
    this.radius,
    this.visualDensity,
  }) : backgroundColor = null,
       iconSize = null,
       buttonType = ThemeButtonType.primary;

  const ThemeButton.secondary({
    this.onPressed,
    super.key,
    this.icon = '',
    this.label,
    this.color,
    this.outlineColor,
    this.textDecoration,
    this.onLongPress,
    this.loading = false,
    this.iconPosition = ThemeButtonIconPosition.left,
    this.fullWidth = false,
    this.forceSingleLine = false,
    this.alignment = MainAxisAlignment.center,
    this.horizontalPadding,
    this.verticalPadding,
    this.enabled = true,
    this.textBuilder = ThemeText.bodyLargeSemiBold,
    this.useTextColorAsIconColor = true,
    this.radius,
  }) : backgroundColor = null,
       iconSize = null,
       visualDensity = null,
       buttonType = ThemeButtonType.secondary;

  const ThemeButton.alternative({
    this.onPressed,
    super.key,
    this.icon = '',
    this.label,
    this.color,
    this.outlineColor,
    this.textDecoration,
    this.onLongPress,
    this.loading = false,
    this.iconPosition = ThemeButtonIconPosition.left,
    this.fullWidth = false,
    this.forceSingleLine = false,
    this.alignment = MainAxisAlignment.center,
    this.horizontalPadding,
    this.verticalPadding,
    this.enabled = true,
    this.textBuilder = ThemeText.bodyLargeSemiBold,
    this.useTextColorAsIconColor = true,
    this.radius,
  }) : backgroundColor = null,
       iconSize = null,
       visualDensity = null,
       buttonType = ThemeButtonType.alternative;

  const ThemeButton.outline({
    this.onPressed,
    super.key,
    this.icon = '',
    this.label,
    this.color,
    this.outlineColor,
    this.textDecoration,
    this.onLongPress,
    this.loading = false,
    this.iconPosition = ThemeButtonIconPosition.left,
    this.fullWidth = false,
    this.forceSingleLine = false,
    this.alignment = MainAxisAlignment.center,
    this.horizontalPadding,
    this.verticalPadding,
    this.enabled = true,
    this.textBuilder = ThemeText.bodyLargeSemiBold,
    this.iconSize,
    this.useTextColorAsIconColor = true,
    this.radius,
    this.visualDensity,
  }) : backgroundColor = null,
       buttonType = ThemeButtonType.outline;

  const ThemeButton.text({
    this.onPressed,
    super.key,
    this.icon = '',
    this.label,
    this.color,
    this.outlineColor,
    this.textDecoration,
    this.onLongPress,
    this.loading = false,
    this.iconPosition = ThemeButtonIconPosition.left,
    this.fullWidth = false,
    this.forceSingleLine = false,
    this.alignment = MainAxisAlignment.center,
    this.horizontalPadding,
    this.verticalPadding,
    this.enabled = true,
    this.textBuilder = ThemeText.bodyMediumMedium,
    this.radius,
    this.visualDensity,
  }) : backgroundColor = null,
       iconSize = null,
       useTextColorAsIconColor = true,
       buttonType = ThemeButtonType.text;

  const ThemeButton.icon({
    this.onPressed,
    super.key,
    this.icon = '',
    this.color,
    this.outlineColor,
    this.onLongPress,
    this.loading = false,
    this.backgroundColor,
    this.iconSize,
    this.verticalPadding,
    this.enabled = true,
    this.textBuilder = ThemeText.bodyMediumMedium,
    this.useTextColorAsIconColor = true,
    this.radius,
    this.visualDensity,
  }) : label = null,
       textDecoration = null,
       iconPosition = ThemeButtonIconPosition.left,
       fullWidth = false,
       forceSingleLine = false,
       alignment = MainAxisAlignment.center,
       horizontalPadding = null,
       buttonType = ThemeButtonType.icon;

  final String icon;
  final String? label;
  final void Function()? onPressed;
  final ThemeButtonType buttonType;
  final bool loading;
  final ThemeButtonIconPosition iconPosition;
  final bool fullWidth;
  final bool forceSingleLine;
  final Color? color;
  final Color? outlineColor;
  final TextDecoration? textDecoration;
  final VoidCallback? onLongPress;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color? backgroundColor;
  final double? iconSize;
  final bool useTextColorAsIconColor;
  final bool enabled;
  final BorderRadius? radius;
  final ThemeText Function(
    String label, {
    Color? color,
    TextDecoration? decoration,
    FontStyle? fontStyle,
    FontWeight? fontWeight,
    Key? key,
    int? maxLines,
    TextOverflow? overflow,
    ThemeSizeBehavior sizeBehavior,
    bool? softWrap,
    TextAlign? textAlign,
    double? textScaleFactor,
  })
  textBuilder;
  final VisualDensity? visualDensity;

  /// The alignment of the [icon] and [label] within the button if button is
  /// in full width mode.
  ///
  /// Defaults to [MainAxisAlignment.center].
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final label = this.label;
    final isDisabled = onPressed == null || loading || !enabled;
    final onButtonPress = isDisabled ? null : onPressed;

    // Currently we use TextDirection and Directionality to place the icon
    // There is no proper prop to use to do it
    // There is an open issue on the Flutter repo to do it : https://github.com/flutter/flutter/issues/71941
    final direction = () {
      if (label == null || icon == '') {
        return TextDirection.ltr;
      }
      if (iconPosition == ThemeButtonIconPosition.left) {
        return TextDirection.ltr;
      }
      return TextDirection.rtl;
    }();

    final theme = Theme.of(context);

    final padding = EdgeInsets.symmetric(
      vertical:
          verticalPadding ??
          (buttonType == ThemeButtonType.text ? 0 : theme.sizes.m),
      horizontal: horizontalPadding ?? theme.sizes.xl,
    );

    final backgroundColor = switch (buttonType) {
      ThemeButtonType.primary => color ?? theme.colors.primary50,
      ThemeButtonType.secondary => color ?? theme.colors.secondary,
      ThemeButtonType.outline ||
      ThemeButtonType.text => theme.colors.transparent,
      ThemeButtonType.alternative => theme.colors.surface,
      ThemeButtonType.icon => this.backgroundColor ?? theme.colors.primary400,
    };

    final disabledBackgroundColor = switch (buttonType) {
      ThemeButtonType.primary ||
      ThemeButtonType.alternative ||
      ThemeButtonType.secondary ||
      ThemeButtonType.icon => theme.colors.grey50.withValues(alpha: 0.5),
      ThemeButtonType.outline => theme.colors.baseWhite,
      ThemeButtonType.text => theme.colors.transparent,
    };

    final foregroundColor = switch (buttonType) {
      ThemeButtonType.primary => theme.colors.baseWhite,
      ThemeButtonType.alternative => theme.colors.primary100,
      ThemeButtonType.secondary => theme.colors.baseWhite,
      ThemeButtonType.outline => color ?? theme.colors.primary50,
      ThemeButtonType.text => color ?? theme.colors.primary200,
      ThemeButtonType.icon => color ?? theme.colors.baseWhite,
    };

    final disabledForegroundColor = switch (buttonType) {
      ThemeButtonType.primary ||
      ThemeButtonType.alternative ||
      ThemeButtonType.outline ||
      ThemeButtonType.text ||
      ThemeButtonType.icon => theme.colors.baseWhite,
      ThemeButtonType.secondary => theme.colors.primary100.withValues(
        alpha: 0.5,
      ),
    };

    final buttonRadius = radius ?? theme.radii.asBorderRadius.l;

    final textStyle = theme.textStyles.bodyMediumMedium;

    final style = switch (buttonType) {
      ThemeButtonType.icon => IconButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        iconSize: iconSize,
        shadowColor: theme.colors.transparent,
        disabledBackgroundColor: disabledBackgroundColor,
        disabledForegroundColor: disabledForegroundColor,
        shape: const CircleBorder(),
      ),
      ThemeButtonType.primary ||
      ThemeButtonType.alternative ||
      ThemeButtonType.secondary => ElevatedButton.styleFrom(
        minimumSize: _kButtonMinimumSize,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 0,
        shadowColor: theme.colors.transparent,
        disabledBackgroundColor: disabledBackgroundColor,
        disabledForegroundColor: disabledForegroundColor,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
        textStyle: textStyle,
      ),
      ThemeButtonType.outline => OutlinedButton.styleFrom(
        visualDensity: visualDensity ?? VisualDensity.standard,
        minimumSize: visualDensity == VisualDensity.compact
            ? Size.zero
            : _kButtonMinimumSize,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disabledBackgroundColor,
        foregroundColor: foregroundColor,
        disabledForegroundColor: disabledForegroundColor,
        elevation: 0,
        padding: padding,
        side: BorderSide(
          color: isDisabled
              ? theme.colors.grey100
              : (outlineColor ?? theme.colors.primary50),
          width: 2,
        ),
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
        textStyle: textStyle,
      ),
      ThemeButtonType.text => TextButton.styleFrom(
        visualDensity: visualDensity ?? VisualDensity.comfortable,
        minimumSize: visualDensity == VisualDensity.compact
            ? Size.zero
            : _kButtonMinimumSize,
        backgroundColor: backgroundColor,
        disabledBackgroundColor: disabledBackgroundColor,
        foregroundColor: foregroundColor,
        disabledForegroundColor: disabledForegroundColor,
        elevation: 0,
        padding: padding,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(borderRadius: buttonRadius),
      ),
    };
    final buttonSymbol = () {
      if (icon != '') {
        return ThemeIcon.noBackground(
          icon: icon,
          size: iconSize,
          color: useTextColorAsIconColor
              ? (isDisabled ? disabledForegroundColor : foregroundColor)
              : null,
        );
      }
      return null;
    }();

    final buttonChild = () {
      // _ConditionalFittedBox has to be above _FullWidthWrapper
      // to make 'resizeTextOneLine' work when 'isFullWidth' is true
      return ThemeButtonConditionalFittedBox(
        fittedBox: forceSingleLine,
        child: ThemeButtonFullWidthWrapper(
          fullWidth: fullWidth,
          alignment: alignment,
          child: Stack(
            // We use a Stack with an Opacity widgets
            // to avoid button to shrink when loading
            alignment: Alignment.center,
            children: [
              if (loading) ThemeLoader.regular(color: disabledForegroundColor),
              Opacity(
                opacity: loading ? 0 : 1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (buttonSymbol != null) buttonSymbol,
                    if (buttonSymbol != null && label != null)
                      fullWidth ? ThemeGap.sm() : ThemeGap.s(),
                    if (label != null)
                      Flexible(
                        flex: forceSingleLine ? 0 : 1,
                        child: textBuilder(
                          label,
                          color: isDisabled
                              ? disabledForegroundColor
                              : foregroundColor,
                          decoration:
                              textDecoration ??
                              (buttonType == ThemeButtonType.text
                                  ? TextDecoration.underline
                                  : null),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }();

    return Directionality(
      textDirection: direction,
      child: switch (buttonType) {
        ThemeButtonType.primary ||
        ThemeButtonType.alternative ||
        ThemeButtonType.secondary => ElevatedButton(
          style: style,
          onPressed: onButtonPress,
          onLongPress: onLongPress,
          child: buttonChild,
        ),
        ThemeButtonType.outline => OutlinedButton(
          style: style,
          onLongPress: onLongPress,
          onPressed: onButtonPress,
          child: buttonChild,
        ),
        ThemeButtonType.text => TextButton(
          style: style,
          onLongPress: onLongPress,
          onPressed: onButtonPress,
          child: buttonChild,
        ),
        ThemeButtonType.icon => IconButton(
          visualDensity: visualDensity,
          style: style,
          onPressed: onButtonPress,
          icon: Iconify(icon, color: color, size: iconSize),
        ),
      },
    );
  }
}
