import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';

class ThemeButtonFullWidthWrapper extends StatelessWidget {
  const ThemeButtonFullWidthWrapper({
    required this.child,
    required this.fullWidth,
    required this.alignment,
    super.key,
  });

  final Widget child;
  final bool fullWidth;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    if (fullWidth) {
      return Row(
        mainAxisAlignment: alignment,
        children: [
          if (alignment == MainAxisAlignment.start) ThemeGap.m(),
          child,
        ],
      );
    }
    return child;
  }
}
