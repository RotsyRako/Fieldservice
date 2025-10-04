import 'package:arkup_edoo/models/dto/activity/activity.dto.dart';
import 'package:arkup_edoo/presentation/controller/activity.controller.dart';
import 'package:arkup_edoo/presentation/views/base.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityScreen extends BaseScreen<Activity> {
  const ActivityScreen({super.key});

  @override
  AsyncValue<Activity> buildState(WidgetRef ref) {
    final state = ref.watch(activityControllerProvider);

    // Appel à fetch une seule fois
    if (state is! AsyncData) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(activityControllerProvider.notifier).fetchActivity();
      });
    }

    return state;
  }

  @override
  Widget buildSuccess(BuildContext context, WidgetRef ref, Activity data) {
    final controller = ref.read(activityControllerProvider.notifier);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(data.activity, style: const TextStyle(fontSize: 18), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: controller.fetchActivity,
              icon: const Icon(Icons.refresh),
              label: const Text("Rafraîchir"),
            )
          ],
        ),
      ),
    );
  }
}
