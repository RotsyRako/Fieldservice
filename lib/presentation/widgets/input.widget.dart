import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Input {
  static Widget textFormField({
    Key? key,
    TextEditingController? controller,
    String? label,
    bool withLabel = true,
    Widget? prefixIcon,
    Widget? suffixIcon, // ✅ Ajout du paramètre suffixIcon
    bool isPassword = false,
    bool isPasswordHidden = false,
    void Function(bool)? onVisibilityChange,
    bool isRequired = false,
    bool isShadow = true,
    void Function(String)? onValidField,
    void Function(String)? onChange,
    String? initialValue,
    TextInputType? inputType,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    MaxLengthEnforcement? maxLengthEnforcement,
    bool? showMaxLengthCounter,
    bool? enabled = true,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null && withLabel) ...[
          Text(label, style: bodyS.bold()),
          const SizedBox(height: 8),
        ],
        Container(
          decoration: BoxDecoration(
            color: ThemeColors.white,
            borderRadius: BorderRadius.circular(ThemeSpacing.s),
            boxShadow:
                isShadow
                    ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ]
                    : null,
          ),
          child: TextFormField(
            key: key,
            controller: controller,
            obscureText: isPassword ? !isPasswordHidden : false,
            initialValue: initialValue,
            keyboardType:
                inputType ??
                (isPassword ? TextInputType.visiblePassword : null),
            maxLength: maxLength,
            enabled: enabled,
            maxLengthEnforcement: maxLengthEnforcement,
            style: TextStyle(
              color: enabled == true ? ThemeColors.dark : ThemeColors.neutral40,
            ),
            decoration: InputDecoration(
              hintText: label,
              filled: true,
              fillColor: ThemeColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ThemeSpacing.s),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ThemeSpacing.s),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ThemeSpacing.s),
                borderSide: BorderSide(color: ThemeColors.violet),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ThemeSpacing.s),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ThemeSpacing.s),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              prefixIcon: prefixIcon,
              suffixIcon:
                  isPassword && onVisibilityChange != null
                      ? passwordSuffix(isPasswordHidden, onVisibilityChange)
                      : suffixIcon, // ✅ Ici, on utilise le suffixIcon custom si pas de mot de passe
              errorStyle: const TextStyle(fontSize: 0),
            ),
            validator:
                validator ??
                (value) {
                  if (isRequired && (value == null || value.trim().isEmpty)) {
                    return "";
                  }
                  onValidField?.call(value ?? "");
                  return null;
                },
            onChanged: onChange,
            inputFormatters: inputFormatters,
            scrollPadding: const EdgeInsets.all(ThemeSpacing.xxl3),
            buildCounter:
                showMaxLengthCounter == true
                    ? null
                    : (
                      _, {
                      required int currentLength,
                      required bool isFocused,
                      required int? maxLength,
                    }) => null,
          ),
        ),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller ?? TextEditingController(),
          builder: (context, value, child) {
            final error =
                validator?.call(value.text) ??
                (isRequired && value.text.trim().isEmpty
                    ? isPassword
                        ? "Mot de passe requis"
                        : "Ce champ est requis"
                    : null);

            if (error != null && error.isNotEmpty && error != " ") {
              return Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 12.0),
                child: Text(
                  error,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }


  static Widget passwordSuffix(
    bool isPasswordHidden,
    void Function(bool) onVisibilityChange,
  ) {
    return IconButton(
      icon: Icon(
        isPasswordHidden
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: ThemeColors.gray,
      ),
      onPressed: () => onVisibilityChange(!isPasswordHidden),
    );
  }


  static Widget textAreaField({
  Key? key,
  TextEditingController? controller,
  String? label,
  bool withLabel = true,
  Widget? suffixIcon,
  bool isRequired = false,
  bool isShadow = true,
  void Function(String)? onValidField,
  void Function(String)? onChange,
  String? initialValue,
  int minLines = 4,
  int? maxLines,
  int? maxLength,
  bool? enabled = true,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (label != null && withLabel) ...[
        Text(label, style: bodyS.bold()),
        const SizedBox(height: 8),
      ],
      Container(
        decoration: BoxDecoration(
          color: ThemeColors.white,
          borderRadius: BorderRadius.circular(ThemeSpacing.s),
          boxShadow: isShadow
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: TextFormField(
          key: key,
          controller: controller,
          initialValue: initialValue,
          keyboardType: TextInputType.multiline,
          minLines: minLines,
          maxLines: maxLines ?? 8,
          maxLength: maxLength,
          enabled: enabled,
          style: TextStyle(
            color: enabled == true ? ThemeColors.dark : ThemeColors.neutral40,
          ),
          decoration: InputDecoration(
            hintText: label,
            filled: true,
            fillColor: ThemeColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ThemeSpacing.s),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ThemeSpacing.s),
              borderSide: BorderSide(color: ThemeColors.violet),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ThemeSpacing.s),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ThemeSpacing.s),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            suffixIcon: suffixIcon,
            errorStyle: const TextStyle(fontSize: 0),
          ),
          validator: validator ??
              (value) {
                if (isRequired && (value == null || value.trim().isEmpty)) {
                  return "";
                }
                onValidField?.call(value ?? "");
                return null;
              },
          onChanged: onChange,
          scrollPadding: const EdgeInsets.all(ThemeSpacing.xxl3),
          buildCounter: (_, {required int currentLength, required bool isFocused, required int? maxLength}) =>
              null,
        ),
      ),
      ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller ?? TextEditingController(),
        builder: (context, value, child) {
          final error = validator?.call(value.text) ??
              (isRequired && value.text.trim().isEmpty
                  ? "Ce champ est requis"
                  : null);

          if (error != null && error.isNotEmpty && error != " ") {
            return Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 12.0),
              child: Text(error, style: const TextStyle(color: Colors.red, fontSize: 12)),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    ],
  );
}

}
