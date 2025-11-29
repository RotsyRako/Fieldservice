// ignore_for_file: unused-code

import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap_render_mode.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap_size.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap_wrapper.dart';

class ThemeGap extends StatelessWidget {
  /// General Gap
  /// Pass the size you want
  const ThemeGap.general({
    required this.customSize,
    super.key,
    this.renderMode = ThemeGapRenderMode.box,
    this.hasAdaptiveBottom = false,
  }) : size = ThemeGapSize.general,
       additionalSpace = 0;

  /// adaptiveBottom Gap
  /// Used to add a bottom padding from the device's safe area.
  const ThemeGap.adaptiveBottom({
    super.key,
    this.renderMode = ThemeGapRenderMode.box,
    this.additionalSpace = 0,
  }) : size = ThemeGapSize.adaptiveBottom,
       customSize = 0,
       hasAdaptiveBottom = true;

  /// xxs Gap
  ///he
  /// regular: `2`
  const ThemeGap.xxs({
    super.key,
    this.renderMode = ThemeGapRenderMode.box,
    this.hasAdaptiveBottom = false,
  }) : size = ThemeGapSize.xxs,
       customSize = 0,
       additionalSpace = 0;

  /// xs Gap
  ///
  /// regular: `4`
  const ThemeGap.xs({
    super.key,
    this.renderMode = ThemeGapRenderMode.box,
    this.hasAdaptiveBottom = false,
  }) : size = ThemeGapSize.xs,
       customSize = 0,
       additionalSpace = 0;

  /// s Gap
  ///
  /// regular: '8'
  const ThemeGap.s({
    super.key,
    this.renderMode = ThemeGapRenderMode.box,
    this.hasAdaptiveBottom = false,
  }) : size = ThemeGapSize.s,
       customSize = 0,
       additionalSpace = 0;

  /// sm Gap
  ///
  /// regular: '12'
  const ThemeGap.sm({
    super.key,
    this.renderMode = ThemeGapRenderMode.box,
    this.hasAdaptiveBottom = false,
  }) : size = ThemeGapSize.sm,
       customSize = 0,
       additionalSpace = 0;

  /// m Gap
  ///
  /// regular: '16'
  const ThemeGap.m({
    super.key,
    this.renderMode = ThemeGapRenderMode.box,
    this.hasAdaptiveBottom = false,
  }) : size = ThemeGapSize.m,
       customSize = 0,
       additionalSpace = 0;

  /// l Gap
  ///
  /// regular: '24'
  const ThemeGap.l({
    super.key,
    this.renderMode = ThemeGapRenderMode.box,
    this.hasAdaptiveBottom = false,
  }) : size = ThemeGapSize.l,
       customSize = 0,
       additionalSpace = 0;

  /// xl Gap
  ///
  /// regular: '32'
  const ThemeGap.xl({
    super.key,
    this.renderMode = ThemeGapRenderMode.box,
    this.hasAdaptiveBottom = false,
  }) : size = ThemeGapSize.xl,
       customSize = 0,
       additionalSpace = 0;

  /// xxl Gap
  ///
  /// regular: '48'
  const ThemeGap.xxl({
    super.key,
    this.renderMode = ThemeGapRenderMode.box,
    this.hasAdaptiveBottom = false,
  }) : size = ThemeGapSize.xxl,
       customSize = 0,
       additionalSpace = 0;

  final ThemeGapSize size;
  final ThemeGapRenderMode renderMode;

  /// Add the safeArea bottom insets
  /// if not set in another SafeArea in the context
  final bool hasAdaptiveBottom;

  final double additionalSpace;

  final double customSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final bottomSafeArea = hasAdaptiveBottom
        ? MediaQuery.paddingOf(context).bottom
        : 0;

    return switch (size) {
      ThemeGapSize.general => ThemeGapWrapper(
        customSize + bottomSafeArea,
        renderMode: renderMode,
      ),
      ThemeGapSize.adaptiveBottom => ThemeGapWrapper(
        bottomSafeArea + additionalSpace,
        renderMode: renderMode,
      ),
      ThemeGapSize.xxs => ThemeGapWrapper(
        theme.sizes.xxs + bottomSafeArea,
        renderMode: renderMode,
      ),
      ThemeGapSize.xs => ThemeGapWrapper(
        theme.sizes.xs + bottomSafeArea,
        renderMode: renderMode,
      ),
      ThemeGapSize.s => ThemeGapWrapper(
        theme.sizes.s + bottomSafeArea,
        renderMode: renderMode,
      ),
      ThemeGapSize.sm => ThemeGapWrapper(
        theme.sizes.sm + bottomSafeArea,
        renderMode: renderMode,
      ),
      ThemeGapSize.m => ThemeGapWrapper(
        theme.sizes.m + bottomSafeArea,
        renderMode: renderMode,
      ),
      ThemeGapSize.l => ThemeGapWrapper(
        theme.sizes.l + bottomSafeArea,
        renderMode: renderMode,
      ),
      ThemeGapSize.xl => ThemeGapWrapper(
        theme.sizes.xl + bottomSafeArea,
        renderMode: renderMode,
      ),
      ThemeGapSize.xxl => ThemeGapWrapper(
        theme.sizes.xxl + bottomSafeArea,
        renderMode: renderMode,
      ),
    };
  }
}
