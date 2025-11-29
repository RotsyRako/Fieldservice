import 'dart:async';

import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_icon/theme_icon.dart';
import 'package:field_service/src/common/theme/widgets/theme_reactive_text_field.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/mi.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    required this.formControl,
    required this.autofillHints,
    required this.label,
    super.key,
    this.onSubmitted,
    this.onFocus,
    this.enabled = true,
    this.hasError = false,
    this.validationMessages,
    this.textInputAction,
  });

  final FormControl<String> formControl;
  final VoidCallback? onSubmitted;
  final VoidCallback? onFocus;
  final bool enabled;
  final bool hasError;
  final String label;
  final List<String>? autofillHints;
  final Map<String, String Function(Object)>? validationMessages;
  final TextInputAction? textInputAction;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  Color? _iconColor;
  final _focusNode = FocusNode();
  StreamSubscription<String?>? _streamSubscription;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final theme = Theme.of(context);
    _iconColor = switch ((widget.enabled, widget.hasError)) {
      (true, true) => theme.colors.error,
      _ => theme.colors.grey50,
    };
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.addListener(() {
        if (_focusNode.hasFocus) {
          widget.onFocus?.call();
        }
        _updateIconColor(theme);
      });
    });
    _streamSubscription?.cancel();
    _streamSubscription = widget.formControl.valueChanges.listen((_) {
      _updateIconColor(theme);
    });
  }

  // ** Duplicate from [ThemeReactiveTextField] logic for _iconColor
  void _updateIconColor(ThemeData theme) {
    final formControl = widget.formControl;
    final hasError =
        (formControl.hasErrors && formControl.touched) || widget.hasError;

    final showEyeIcon = formControl.value?.isNotEmpty ?? false;

    final newColor = switch ((showEyeIcon, hasError)) {
      (false, true) => theme.colors.error,
      (_, _) => theme.colors.grey50,
    };

    if (_iconColor != newColor) {
      setState(() => _iconColor = newColor);
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _streamSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final showEyeIcon = widget.formControl.value?.isNotEmpty ?? false;

    return ThemeReactiveTextField(
      overrideDefaultSuffixIcon: true,
      valueChangesStreamSubscription: _streamSubscription,
      onSubmitted: widget.onSubmitted,
      focusNode: _focusNode,
      trailing: AnimatedSwitcher(
        duration: theme.durations.xxs,
        child: showEyeIcon
            ? ThemeButton.icon(
                icon: obscureText ? Mi.eye : Mi.eye_off,
                color: _iconColor,
                onPressed: () => setState(() => obscureText = !obscureText),
                backgroundColor: theme.colors.transparent,
              )
            : widget.hasError && widget.formControl.touched
            ? Padding(
                padding: theme.sizes.asInsets.m,
                child: ThemeIcon.noBackground(
                  icon: Bi.exclamation_circle,
                  color: _iconColor,
                  backgroundColor: theme.colors.transparent,
                ),
              )
            : null,
      ),
      formControl: widget.formControl,
      onFocus: widget.onFocus,
      obscureText: obscureText,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: widget.autofillHints,
      enabled: widget.enabled,
      hasError: widget.hasError,
      leadingIcon: Ic.outline_lock,
      leadingIconPadding: EdgeInsets.symmetric(horizontal: theme.sizes.m),
      leadingIconSize: theme.sizes.l,
      label: ThemeText.bodyMediumMedium(
        widget.label,
        color: theme.colors.primary100,
      ),
      validationMessages: widget.validationMessages,
      textInputAction: widget.textInputAction,
      withShadow: true,
      withBorder: true,
    );
  }
}
