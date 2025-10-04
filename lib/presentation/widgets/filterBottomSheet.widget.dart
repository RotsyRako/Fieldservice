import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/views/home.view.dart';
import 'package:arkup_edoo/common/icons/custom_icon_icons.dart';

class FilterBottomSheet extends ConsumerWidget {
  final Function(String filterBy, String orderBy) onApply;

  const FilterBottomSheet({super.key, required this.onApply});

  List<Map<String, dynamic>> _getCurrentOptions(
    List<Map<String, dynamic>> filterOptions,
    String filterBy,
  ) {
    return filterOptions.firstWhere((e) => e["label"] == filterBy)["options"];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterBy = ref.watch(filterByProvider);
    final orderBy = ref.watch(orderByProvider);

    final List<Map<String, dynamic>> filterOptions = [
      {
        "id": 1,
        "label": "Date",
        "icon": CustomIcon.calendar,
        "options": [
          {
            "id": 1,
            "value": "Du plus récent au plus ancien",
            "icon": Icons.arrow_downward,
          },
          {
            "id": 2,
            "value": "Du plus ancien au plus récent",
            "icon": Icons.arrow_upward,
          },
        ],
      },
      {
        "id": 2,
        "label": "Priorité",
        "icon": Icons.priority_high,
        "options": [
          {
            "id": 1,
            "value": "Du plus prioritaire au moins prioritaire",
            "icon": Icons.priority_high,
          },
          {
            "id": 2,
            "value": "Du moins prioritaire au plus prioritaire",
            "icon": Icons.low_priority,
          },
        ],
      },
      {
        "id": 3,
        "label": "Distance",
        "icon": Icons.place,
        "options": [
          {
            "id": 1,
            "value": "Du plus proche au plus éloigné",
            "icon": Icons.near_me,
          },
          {
            "id": 2,
            "value": "Du plus éloigné au plus proche",
            "icon": Icons.directions_walk,
          },
        ],
      },
    ];

    final currentOptions = _getCurrentOptions(filterOptions, filterBy);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Trier par",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: filterBy,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items:
                  filterOptions.map((group) {
                    return DropdownMenuItem<String>(
                      value: group["label"],
                      child: Row(
                        children: [
                          Icon(group["icon"], size: 18),
                          const SizedBox(width: 8),
                          Text(group["label"]),
                        ],
                      ),
                    );
                  }).toList(),
              onChanged: (value) {
                if (value != null) {
                  ref.read(filterByProvider.notifier).state = value;
                  ref.read(orderByProvider.notifier).state =
                      _getCurrentOptions(filterOptions, value)[0]["value"];
                }
              },
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: orderBy,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items:
                  currentOptions.map((option) {
                    return DropdownMenuItem<String>(
                      value: option["value"],
                      child: Row(
                        children: [
                          Icon(option["icon"], size: 18),
                          const SizedBox(width: 8),
                          Text(option["value"]),
                        ],
                      ),
                    );
                  }).toList(),
              onChanged: (value) {
                if (value != null) {
                  ref.read(orderByProvider.notifier).state = value;
                }
              },
            ),
            const SizedBox(height: 24),
            Button.elevated(
              onPressed: () {
                onApply(filterBy, orderBy);
                Navigator.pop(context);
              },
              buttonTitle: "Trier",
              isGradient: true,
            ),
          ],
        ),
      ),
    );
  }
}
