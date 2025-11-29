import 'package:flutter/material.dart';

class ThemeButtonConditionalFittedBox extends StatelessWidget {
  const ThemeButtonConditionalFittedBox({
    required this.fittedBox,
    required this.child,
    super.key,
  });

  final Widget child;
  final bool fittedBox;

  @override
  Widget build(BuildContext context) {
    return fittedBox ? FittedBox(fit: BoxFit.fitWidth, child: child) : child;
  }
}
