// ignore_for_file: unused-code

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:field_service/src/common/theme/data/theme_colors_data.dart'
    show ThemeColorsData;
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/data/theme_sizes_data.dart'
    show ThemeSizesData;
import 'package:field_service/src/common/theme/widgets/theme_loader/theme_loader_type.dart';

/// ThemeLoader widget used whenever you need to display a loader in your app
class ThemeLoader extends StatelessWidget {
  /// Default constructor
  const ThemeLoader.regular({
    super.key,
    this.color,
    this.radius,
    this.strokeWidth,
  }) : _type = ThemeLoaderType.regular;

  const ThemeLoader.animated({super.key, this.color, this.radius})
    : _type = ThemeLoaderType.animated,
      strokeWidth = null;

  /// Radius to give to your [ThemeLoader]
  ///
  /// Default to [ThemeSizesData.m]
  final double? radius;

  /// Color to give to your [ThemeLoader]
  ///
  /// Default to [ThemeColorsData.primary100]
  final Color? color;

  /// Stroke width of the loader
  ///
  /// Default to 3
  final double? strokeWidth;

  final ThemeLoaderType _type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final radius = this.radius ?? theme.sizes.m;
    final color = this.color ?? theme.colors.primary100;
    final strokeWidth = this.strokeWidth ?? 3;

    return switch (_type) {
      ThemeLoaderType.regular => SizedBox.fromSize(
        size: Size.square(radius),
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: strokeWidth,
        ),
      ),
      ThemeLoaderType.animated => SpinKitCircle(color: color, size: radius),
    };
  }
}
