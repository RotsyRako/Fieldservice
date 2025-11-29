import 'package:field_service/src/localization/app_localizations_bootstrap.dart';
import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_reactive_text_field.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    required this.formControl,
    required this.onSubmitted,
    super.key,
    this.enabled = true,
    this.onFocus,
    this.onChanged,
    this.autofocus = false,
    this.hasError = false,
    this.textInputAction,
  });

  final FormControl<String> formControl;
  final VoidCallback? onSubmitted;
  final bool enabled;
  final VoidCallback? onFocus;
  final void Function(String?)? onChanged;
  final bool autofocus;
  final bool hasError;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);

    return ThemeReactiveTextField(
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      formControl: formControl,
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      enabled: enabled,
      autofocus: autofocus,
      hasError: hasError,
      onFocus: onFocus,
      leadingIcon: Ic.outline_email,
      leadingIconPadding: EdgeInsets.symmetric(horizontal: theme.sizes.m),
      leadingIconSize: theme.sizes.l,
      label: ThemeText.bodyMediumMedium(
        l10n.email,
        color: theme.colors.primary100,
      ),
      textInputAction: textInputAction,
      withShadow: true,
      withBorder: true,
    );
  }
}
