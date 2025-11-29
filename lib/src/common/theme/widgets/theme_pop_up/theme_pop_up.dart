import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_icon/theme_icon.dart';
import 'package:field_service/src/common/theme/widgets/theme_pop_up/theme_pop_up_type.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/uim.dart';

Future<bool?> showPopup({
  required BuildContext context,
  ThemePopUpType type = ThemePopUpType.success,
  Widget? content,
  String? title,
  String? message,
  Widget Function(Color color, VoidCallback dismiss)? bottomBuilder,
  String? buttonLabel,
  VoidCallback? onButtonPressed,
}) => showDialog(
  context: context,
  builder: (context) => switch (type) {
    ThemePopUpType.success => ThemePopUp.success(
      title: title ?? 'Success',
      message: message ?? 'Operation completed successfully.',
      bottomBuilder: bottomBuilder,
      secondaryButtonLabel: buttonLabel,
      onSecondaryButtonPressed: onButtonPressed,
    ),
    ThemePopUpType.error => ThemePopUp.error(
      title: title ?? 'Error',
      message: message ?? 'An error occurred.',
      bottomBuilder: bottomBuilder,
      secondaryButtonLabel: buttonLabel,
      onSecondaryButtonPressed: onButtonPressed,
    ),
    ThemePopUpType.calendar => ThemePopUp.calendar(
      title: title ?? 'Calendar',
      message: message ?? 'Select a date.',
      content: content ?? Container(),
      bottomBuilder: bottomBuilder,
      secondaryButtonLabel: buttonLabel,
      onSecondaryButtonPressed: onButtonPressed,
    ),
  },
);

class ThemePopUp extends StatelessWidget {
  const ThemePopUp.error({
    required this.title,
    required this.message,
    required this.bottomBuilder,
    this.content,
    this.secondaryButtonLabel,
    this.onSecondaryButtonPressed,
    super.key,
  }) : _popUpType = ThemePopUpType.error;

  const ThemePopUp.success({
    required this.title,
    required this.message,
    required this.bottomBuilder,
    this.content,
    this.secondaryButtonLabel,
    this.onSecondaryButtonPressed,
    super.key,
  }) : _popUpType = ThemePopUpType.success;

  const ThemePopUp.calendar({
    required this.title,
    required this.message,
    required this.content,
    required this.bottomBuilder,
    this.secondaryButtonLabel,
    this.onSecondaryButtonPressed,
    super.key,
  }) : _popUpType = ThemePopUpType.calendar;

  final String? title;
  final Widget? content;
  final String? message;
  final Widget Function(Color color, VoidCallback dismiss)? bottomBuilder;
  final String? secondaryButtonLabel;
  final VoidCallback? onSecondaryButtonPressed;
  final ThemePopUpType _popUpType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final icon = switch (_popUpType) {
      ThemePopUpType.success => Uim.check,
      ThemePopUpType.error => Ic.round_close,
      ThemePopUpType.calendar => Uim.calender,
    };

    final color = _popUpType == ThemePopUpType.calendar
        ? theme.colors.primary100
        : theme.colors.primary200;

    final secondaryButtonLabel = this.secondaryButtonLabel;

    return AlertDialog(
      backgroundColor: theme.colors.baseWhite,
      actionsOverflowButtonSpacing: 0,
      icon: _popUpType == ThemePopUpType.calendar
          ? null
          : ThemeIcon.roundedBackground(
              icon: icon,
              color: color,
              backgroundColor: theme.colors.secondary.withValues(alpha: 0.2),
            ),
      title: _popUpType == ThemePopUpType.calendar
          ? null
          : ThemeText.h4SemiBold(title ?? '', color: color),
      content:
          content ??
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: theme.sizes.xxl),
              child: ThemeText.bodyMediumRegular(
                message ?? '',
                textAlign: TextAlign.center,
                color: color.withValues(alpha: 0.6),
              ),
            ),
          ),
      iconPadding: EdgeInsets.only(top: theme.sizes.xl),
      titlePadding: EdgeInsets.only(top: theme.sizes.m),
      contentPadding: EdgeInsets.only(
        top: theme.sizes.sm,
        bottom: theme.sizes.m,
        left: theme.sizes.xl,
        right: theme.sizes.xl,
      ),
      actionsPadding: EdgeInsets.only(
        left: theme.sizes.xl,
        right: theme.sizes.xl,
        bottom: theme.sizes.m,
      ),
      actions: [
        if (secondaryButtonLabel != null)
          Center(
            child: ThemeButton.primary(
              label: secondaryButtonLabel,
              onPressed: () {
                Navigator.of(context).pop(false);
                onSecondaryButtonPressed?.call();
              },
            ),
          ),
        if (bottomBuilder != null)
          bottomBuilder!(color, () => Navigator.of(context).pop(false)),
      ],
    );
  }
}
