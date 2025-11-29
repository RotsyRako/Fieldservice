import 'dart:async';

import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_icon/theme_icon.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_phone_form_field/reactive_phone_form_field.dart';

class ThemeReactivePhoneNumberField extends StatefulWidget {
  const ThemeReactivePhoneNumberField({
    required this.formControl,
    required this.noResultMessage,
    this.onSubmitted,
    super.key,
    this.enabled = true,
    this.textInputAction,
    this.autofocus = false,
    this.label,
    this.hasError = false,
    this.validationMessages,
    this.onChanged,
  });

  final FormControl<PhoneNumber> formControl;
  final VoidCallback? onSubmitted;
  final void Function(PhoneNumber?)? onChanged;
  final bool enabled;
  final Widget? label;
  final String noResultMessage;
  final TextInputAction? textInputAction;
  final bool autofocus;
  final bool hasError;
  final Map<String, String Function(Object)>? validationMessages;

  @override
  State<ThemeReactivePhoneNumberField> createState() =>
      _ThemeReactivePhoneNumberFieldState();
}

class _ThemeReactivePhoneNumberFieldState
    extends State<ThemeReactivePhoneNumberField> {
  bool _showClearButton = false;
  FocusNode? _focusNode;
  StreamSubscription<PhoneNumber?>? _streamSubscription;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    if (widget.enabled) {
      widget.formControl.markAsEnabled();
    } else {
      widget.formControl.markAsDisabled();
    }

    _focusNode!.addListener(_updateClearButtonVisibility);
    _streamSubscription = widget.formControl.valueChanges.listen((_) {
      _updateClearButtonVisibility();
    });
  }

  @override
  void didUpdateWidget(ThemeReactivePhoneNumberField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) {
      if (widget.enabled) {
        widget.formControl.markAsEnabled();
      } else {
        widget.formControl.markAsDisabled();
      }
    }
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _focusNode?.dispose();
    _focusNode = null;
    super.dispose();
  }

  void _updateClearButtonVisibility() {
    final currentValue = widget.formControl.value;
    final newShowClearButton =
        widget.enabled &&
        currentValue != null &&
        currentValue.international.isNotEmpty &&
        (_focusNode?.hasFocus ?? false);

    if (_showClearButton != newShowClearButton) {
      if (!mounted) return;
      setState(() => _showClearButton = newShowClearButton);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    final theme = Theme.of(context);

    final label = widget.label;

    final textStyle = theme.textStyles.bodyMediumRegular.copyWith(
      color: widget.enabled ? theme.colors.baseBlack : theme.colors.grey100,
    );

    final suffixIcon = widget.hasError && widget.formControl.touched
        ? Padding(
            padding: theme.sizes.asInsets.m,
            child: ThemeIcon.noBackground(
              icon: Bi.exclamation_circle,
              color: theme.colors.primary200,
              size: theme.sizes.m,
            ),
          )
        : _showClearButton
        ? IconButton(
            hoverColor: theme.colors.transparent,
            highlightColor: theme.colors.transparent,
            onPressed: () {
              widget.formControl.value = null;
              widget.onChanged?.call(null);
            },
            icon: ThemeIcon.noBackground(
              icon: Ic.round_close,
              color: theme.colors.primary200,
              size: theme.sizes.m,
            ),
          )
        : null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[label, const ThemeGap.m()],
        ReactivePhoneFormField(
          formControl: widget.formControl,
          onSubmitted: widget.onSubmitted,
          validationMessages: widget.validationMessages,
          showErrors: (control) => control.invalid && control.touched,
          focusNode: _focusNode,
          countryButtonStyle: CountryButtonStyle(
            textStyle: textStyle,
            showDialCode: false,
          ),
          textInputAction: widget.textInputAction,
          autofillHints: const [AutofillHints.telephoneNumber],
          style: textStyle,
          isCountryButtonPersistent: true,
          autofocus: widget.autofocus,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            filled: true,
            fillColor: theme.colors.baseWhite,
            errorStyle: theme.textStyles.bodySmallRegular.copyWith(
              color: theme.colors.error,
            ),
            errorMaxLines: 2,
            border: OutlineInputBorder(
              borderRadius: theme.radii.asBorderRadius.m,
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: theme.radii.asBorderRadius.m,
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: theme.radii.asBorderRadius.m,
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: theme.radii.asBorderRadius.m,
              borderSide: BorderSide(color: theme.colors.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: theme.radii.asBorderRadius.m,
              borderSide: BorderSide(color: theme.colors.error, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: theme.radii.asBorderRadius.m,
              borderSide: BorderSide.none,
            ),
          ),
          countrySelectorNavigator: CountrySelectorNavigator.modalBottomSheet(
            searchBoxTextStyle: theme.textStyles.bodyMediumRegular,
            titleStyle: theme.textStyles.bodyMediumSemiBold.copyWith(
              color: theme.colors.baseBlack,
            ),
            subtitleStyle: theme.textStyles.bodySmallMedium.copyWith(
              color: theme.colors.baseBlack,
            ),
            noResultMessage: widget.noResultMessage,
            height: screenHeight * 0.6,
          ),
        ),
      ],
    );
  }
}
