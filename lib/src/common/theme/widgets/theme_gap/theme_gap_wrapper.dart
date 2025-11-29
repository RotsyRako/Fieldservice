import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap_render_mode.dart';
import 'package:gap/gap.dart';

class ThemeGapWrapper extends StatelessWidget {
  const ThemeGapWrapper(
    this.mainAxisExtent, {
    required this.renderMode,
    super.key,
  });

  final ThemeGapRenderMode renderMode;
  final double mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    if (renderMode == ThemeGapRenderMode.sliver) {
      return SliverGap(mainAxisExtent);
    }

    return Gap(mainAxisExtent);
  }
}
