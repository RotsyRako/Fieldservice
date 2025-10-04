import 'package:flutter/material.dart';
import 'package:arkup_edoo/common/theme/theme.utils.dart';

class DateRangeDisplay extends StatelessWidget {
  final String startDate;
  final String endDate;

  const DateRangeDisplay({
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          startDate,
          style: body.copyWith(
            color: ThemeColors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        const Icon(Icons.arrow_forward, color: ThemeColors.violet),
        const SizedBox(width: 5),
        Text(
          endDate,
          style: body.copyWith(
            color: ThemeColors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
