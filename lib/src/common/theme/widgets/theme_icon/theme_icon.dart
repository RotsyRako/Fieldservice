import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_icon/theme_icon_type.dart';
import 'package:iconify_flutter/iconify_flutter.dart';

class ThemeIcon extends StatelessWidget {
  const ThemeIcon.noBackground({
    required this.icon,
    required this.color,
    this.backgroundColor,
    this.iconRotationAngle,
    this.size,
    super.key,
  }) : padding = null,
       borderColor = null,
       borderWidth = null,
       _type = ThemeIconType.noBackground;

  const ThemeIcon.roundedBackground({
    required this.icon,
    required this.color,
    required this.backgroundColor,
    this.size,
    this.iconRotationAngle,
    this.padding,
    super.key,
  }) : borderColor = null,
       borderWidth = null,
       _type = ThemeIconType.roundedBackground;

  const ThemeIcon.outline({
    required this.icon,
    required this.color,
    required this.borderColor,
    this.borderWidth,
    this.size,
    this.iconRotationAngle,
    this.padding,
    super.key,
  }) : backgroundColor = null,
       _type = ThemeIconType.outline;

  final String icon;
  final Color? color;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? size;
  final EdgeInsets? padding;
  final double? iconRotationAngle;
  final ThemeIconType _type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return switch (_type) {
      ThemeIconType.noBackground => Iconify(icon, color: color, size: size),
      ThemeIconType.roundedBackground => DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: padding ?? theme.sizes.asInsets.s,
          child: Transform.rotate(
            angle: iconRotationAngle ?? 0,
            child: Iconify(icon, color: color, size: size),
          ),
        ),
      ),
      ThemeIconType.outline => DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: borderColor!, width: borderWidth ?? 2),
        ),
        child: Padding(
          padding: padding ?? theme.sizes.asInsets.xs,
          child: Transform.rotate(
            angle: iconRotationAngle ?? 0,
            child: Iconify(icon, color: color, size: size),
          ),
        ),
      ),
    };
  }
}
