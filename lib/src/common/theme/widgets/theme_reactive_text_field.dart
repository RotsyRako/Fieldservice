import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:field_service/src/common/theme/data/theme_colors_data.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart'; 
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_icon/theme_icon.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ThemeReactiveTextField<T> extends StatefulWidget {
  const ThemeReactiveTextField({
    required this.formControl,
    super.key,
    this.label,
    this.leadingIcon,
    this.trailing,
    this.hint,
    this.maxLength,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.hasError = false,
    this.showErrors = true,
    this.keyboardType,
    this.inputFormatters,
    this.restrictEmojis = true,
    this.autofillHints,
    this.obscureText = false,
    this.enabled = true,
    this.textInputAction,
    this.autofocus = false,
    this.overrideDefaultSuffixIcon = false,
    this.controller,
    this.onTap,
    this.onFocus,
    this.valueAccessor,
    this.validationMessages,
    this.valueChangesStreamSubscription,
    this.minLines,
    this.maxLines,
    this.dense = false,
    this.contentPadding,
    this.fillColor,
    this.customBorder,
    this.leadingIconSize,
    this.leadingIconPadding,
    this.readOnly = false,
    this.showCharacterCount = false,
    this.minLength,
    this.withShadow = false,
    this.withBorder = false,
  });

  /// The controller of the text field.
  final TextEditingController? controller;

  /// The reactive form control of the text field.
  final FormControl<T?> formControl;

  /// The label of the text field.
  /// Shown at the top of the text field.
  final Widget? label;

  /// The icon shown at the beginning of the field.
  ///
  /// If null, no icon is showed.
  final String? leadingIcon;

  /// The size of the leading icon.
  ///
  /// If null, the default size is used.
  final double? leadingIconSize;

  /// The padding of the leading icon.
  ///
  /// If null, the default padding is used.
  final EdgeInsets? leadingIconPadding;

  /// The icon shown at the end of the field.
  ///
  /// If null, the clear icon button is shown.
  final Widget? trailing;

  /// The eventual hint shown in the text field.
  ///
  /// If null, no hint is showed.
  final String? hint;

  /// The maximum number of characters (Unicode grapheme clusters) to allow in
  /// the text field.
  final int? maxLength;

  /// The focus node of the text field.
  ///
  /// If null, the text field will have a default focus node.
  final FocusNode? focusNode;

  final void Function(T?)? onChanged;

  final VoidCallback? onSubmitted;

  /// Wether the field content is valid or not.
  ///
  /// Defaults to false.
  final bool hasError;

  /// Whether error messages will be shown in relevant situation.
  ///
  /// Defaults to true.
  final bool showErrors;

  /// The type of keyboard to use for editing the text.
  final TextInputType? keyboardType;

  /// The formatters to use for this text field.
  ///
  /// For example, [FilteringTextInputFormatter.digitsOnly].
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the text field should restrict emojis.
  ///
  /// Defaults to true.
  final bool restrictEmojis;

  /// The type of hints to show in the user's keyboard.
  ///
  /// For example [AutofillHints.email].
  final List<String>? autofillHints;

  /// Whether the text field should obscure the text.
  ///
  /// For example, for a password field.
  /// Defaults to false.
  final bool obscureText;

  /// Whether the TextField is enabled or not.
  ///
  /// Defaults to true.
  final bool enabled;

  /// Whether the TextField immediately focus when mounted .
  ///
  /// Defaults to true.
  final bool autofocus;

  /// The type of the actionButton on textInput keyboard.
  ///
  /// For example, [TextInputAction.next].
  final TextInputAction? textInputAction;

  final void Function(FormControl<T?>)? onTap;

  /// Callback to be called when the text field is focused.
  final VoidCallback? onFocus;

  /// Controls the link between [FormControl] and a reactive native widget.
  ///
  /// Notably responsible for converting the value from form to the
  /// text displayed in the text field.
  /// defaults to different value accessors depending on the type T:
  ///  - [IntValueAccessor] for [int],
  ///  - [DoubleValueAccessor] for [double],
  ///  - [DateTimeValueAccessor] for [DateTime],
  ///  - [TimeOfDayValueAccessor] for [TimeOfDay]
  final ControlValueAccessor<T, String>? valueAccessor;

  /// The error messages shown when the field is invalid.
  final Map<String, String Function(Object)>? validationMessages;

  final bool overrideDefaultSuffixIcon;

  final StreamSubscription<T?>? valueChangesStreamSubscription;

  /// The minimum number of lines to occupy when the content is empty.
  final int? minLines;

  /// The maximum number of lines to occupy when the content is not empty.
  final int? maxLines;

  final EdgeInsets? contentPadding;
  final bool dense;
  final Color? fillColor;
  final OutlineInputBorder? customBorder;
  final bool readOnly;

  /// Whether to show the character count next to the label.
  /// Displays "current / max" when maxLength is set.
  final bool showCharacterCount;

  /// The minimum number of characters required.
  /// When set, the character count will be red if current length is below this
  /// value.
  final int? minLength;

  /// Whether to apply a shadow to the text field.
  /// When true, applies a shadow effect using primary50 color.
  final bool withShadow;

  /// Whether to apply a border to the text field.
  /// When true, applies a border effect using grey50 color.
  final bool withBorder;

  @override
  State<ThemeReactiveTextField<T>> createState() =>
      _ThemeReactiveTextFieldState<T>();
}

class _ThemeReactiveTextFieldState<T> extends State<ThemeReactiveTextField<T>> {
  bool _showClearButton = false;
  Color? _iconColor;
  late final FocusNode _focusNode = widget.focusNode ?? FocusNode();
  StreamSubscription<T?>? _streamSubscription;
  int _currentLength = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _toggleTextField();
    _updateCurrentLengthWithoutSetState();

    final theme = Theme.of(context);

    _iconColor = switch ((widget.enabled, widget.hasError)) {
      (true, true) => theme.colors.error,
      _ => theme.colors.primary50,
    };
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.addListener(() {
        if (_focusNode.hasFocus) {
          widget.onFocus?.call();
        }
        _updateShowClearButton();
        _updateIconColor(theme.colors);
      });
    });
    _streamSubscription?.cancel();
    _streamSubscription = widget.formControl.valueChanges.listen((_) {
      _updateShowClearButton();
      _updateIconColor(theme.colors);
      _updateCurrentLength();
    });
  }

  @override
  void didUpdateWidget(covariant ThemeReactiveTextField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.enabled != widget.enabled) {
      _toggleTextField();
    }
  }

  @override
  void dispose() {
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    if (widget.valueChangesStreamSubscription == null) {
      _streamSubscription?.cancel();
    }
    super.dispose();
  }

  void _updateShowClearButton() {
    final currentValue = widget.formControl.value;

    final newShowClearButton =
        widget.enabled &&
        currentValue != null &&
        (currentValue is! String || currentValue.isNotEmpty) &&
        _focusNode.hasFocus;

    if (_showClearButton != newShowClearButton) {
      if (!mounted) return;
      setState(() => _showClearButton = newShowClearButton);
    }
  }

  void _updateIconColor(ThemeColorsData colors) {
    final formControl = widget.formControl;
    final hasError =
        (formControl.hasErrors && formControl.touched) || widget.hasError;

    final newColor = switch ((widget.enabled, hasError)) {
      (true, true) => colors.error,
      (true, false) =>
        formControl.hasFocus ? colors.primary100 : colors.grey100,
      (false, _) => colors.grey100,
    };

    if (_iconColor != newColor) {
      if (!mounted) return;
      setState(() => _iconColor = newColor);
    }
  }

  void _toggleTextField() {
    if (widget.enabled) {
      widget.formControl.markAsEnabled();
    } else {
      widget.formControl.markAsDisabled();
    }
  }

  void _updateCurrentLengthWithoutSetState() {
    if (!widget.showCharacterCount || widget.maxLength == null) return;

    final value = widget.formControl.value;
    // Compte les caractères
    final newLength = value is String ? value.length : 0;

    if (_currentLength != newLength) {
      _currentLength = newLength;
    }
  }

  void _updateCurrentLength() {
    if (!widget.showCharacterCount || widget.maxLength == null) return;

    final value = widget.formControl.value;
    // Compte les caractères
    final newLength = value is String ? value.length : 0;

    if (_currentLength != newLength) {
      if (!mounted) return;
      setState(() => _currentLength = newLength);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final label = widget.label;

    final textStyle = theme.textStyles.bodyMediumRegular.copyWith(
      color: theme.colors.baseBlack,
    );

    final suffixIcon = switch (widget.overrideDefaultSuffixIcon) {
      true => widget.trailing,
      false =>
        widget.showErrors && widget.hasError && widget.formControl.touched
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
            : widget.trailing,
    };
    final reactiveTextField = ReactiveTextField<T?>(
      buildCounter:
          (
            context, {
            required int currentLength,
            required bool isFocused,
            required int? maxLength,
          }) => null,
      maxLength: widget.maxLength,
      formControl: widget.formControl,
      valueAccessor: widget.valueAccessor,
      showErrors: (control) =>
          widget.showErrors && (control.invalid && control.touched),
      focusNode: _focusNode,
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        isDense: widget.dense,
        fillColor:
            widget.fillColor ??
            (widget.enabled ? theme.colors.baseWhite : theme.colors.disabled),
        hintText: widget.hint,
        hintStyle: theme.textStyles.bodyMediumRegular.copyWith(
          color: theme.colors.primary50.withValues(alpha: 0.5),
        ),
        filled: true,
        prefixIconColor: _iconColor,
        prefixIconConstraints: BoxConstraints(
          minWidth: 40,
          maxWidth: 48,
          maxHeight: widget.leadingIconSize ?? theme.sizes.m,
        ),
        prefixIcon: widget.leadingIcon != null
            ? Padding(
                padding: widget.leadingIconPadding ?? const EdgeInsets.symmetric(horizontal: 12),
                child: ThemeIcon.noBackground(
                  icon: widget.leadingIcon!,
                  color: _iconColor,
                ),
              )
            : null,
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints(
          minWidth: theme.sizes.m,
          minHeight: theme.sizes.m,
        ),
        enabledBorder:
            widget.customBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: widget.withBorder
                  ? BorderSide(color: theme.colors.grey50.withValues(alpha: 0.1))
                  : BorderSide.none,
            ),
        focusedBorder:
            widget.customBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: widget.withBorder
                  ? BorderSide(color: theme.colors.grey50.withValues(alpha: 0.1))
                  : BorderSide.none,
            ),
        errorBorder:
            widget.customBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
        disabledBorder:
            widget.customBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
        focusedErrorBorder:
            widget.customBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
        enabled: widget.enabled,
      ),
      minLines: widget.minLines,
      maxLines: widget.maxLines ?? (widget.minLines != null ? null : 1),
      validationMessages: widget.validationMessages,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: textStyle,
      autofocus: widget.autofocus,
      obscureText: widget.obscureText,
      inputFormatters: [
        ...?widget.inputFormatters,
        if (widget.restrictEmojis)
          FilteringTextInputFormatter.deny(_kEmojiRegex),
      ],
      autofillHints: widget.autofillHints,
      onTap: widget.onTap,
      onSubmitted: (_) => widget.onSubmitted?.call(),
      onChanged: (control) => widget.onChanged?.call(control.value),
      readOnly: widget.readOnly,
    );

    Widget textField = reactiveTextField;

    // Apply shadow if withShadow is true
    if (widget.withShadow) {
      textField = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: theme.colors.baseBlack.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 3),
              spreadRadius: 0,
            ),
          ],
        ),
        child: textField,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          if (widget.showCharacterCount && widget.maxLength != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                label,
                Text(
                  '${NumberFormat().format(_currentLength)} / ${NumberFormat().format(widget.maxLength)}',
                  style: theme.textStyles.bodyMediumRegular.copyWith(
                    color:
                        widget.minLength != null &&
                            _currentLength < widget.minLength!
                        ? theme.colors.error
                        : theme.colors.baseBlack,
                  ),
                ),
              ],
            )
          else
            label,
          const ThemeGap.m(),
        ],
        textField,
      ],
    );
  }
}

final _kEmojiRegex = RegExp(
  '''(\u00a9|\u00ae|[\u2000-\u2012]|[\u204b-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])''',
);
