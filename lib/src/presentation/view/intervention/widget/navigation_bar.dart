import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';

class InterventionNavigationBar extends StatelessWidget {
  const InterventionNavigationBar({
    required this.onPrevious,
    required this.onNext,
    this.hasPrevious = true,
    this.hasNext = true,
    super.key,
  });

  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final bool hasPrevious;
  final bool hasNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: hasPrevious ? onPrevious : () {},
          behavior: HitTestBehavior.opaque,
          child: Opacity(
            opacity: hasPrevious ? 1.0 : 0.4,
            child: Icon(
              Icons.chevron_left,
              size: 20,
              color: theme.colors.primary50,
            ),
          ),
        ),
        const ThemeGap.m(),
        GestureDetector(
          onTap: hasNext ? onNext : () {},
          behavior: HitTestBehavior.opaque,
          child: Opacity(
            opacity: hasNext ? 1.0 : 0.4,
            child: Icon(
              Icons.chevron_right,
              size: 20,
              color: theme.colors.primary50,
            ),
          ),
        ),
      ],
    );
  }
}

