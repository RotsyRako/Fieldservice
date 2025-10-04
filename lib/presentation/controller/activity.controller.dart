import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/models/dto/activity/activity.dto.dart';
import 'package:arkup_edoo/service/applying/remote/activity_remote.sa.dart';
import 'package:arkup_edoo/presentation/controller/base.controller.dart';

class ActivityController extends BaseController<Activity> {
  ActivityController(Ref ref) : super(ref, const AsyncValue.loading()) {}

  Future<void> fetchActivity() async {
    await executeAsyncRequest(
      request: () => ref.read(activityRemoteServiceProvider).getRandomActivity(),
    );
  }
}

final activityControllerProvider =
    StateNotifierProvider.autoDispose<ActivityController, AsyncValue<Activity>>(
  (ref) => ActivityController(ref),
);
