import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/common/utils/app.utils.dart';
import 'package:arkup_edoo/models/dto/activity/activity.dto.dart';
import 'package:arkup_edoo/repository/remote/activity_remote.repo.dart';
import 'package:arkup_edoo/service/applying/remote/base_remote.sa.dart';


class ActivityRemoteSA extends BaseRemoteSA{
  final ActivityRemoteRepo _repository;

  ActivityRemoteSA(this._repository);

  Future<Activity> getRandomActivity() async {
  return await _repository.getRandomActivity();
}
}

final activityRemoteServiceProvider = Provider<ActivityRemoteSA>((ref) {
  return ActivityRemoteSA(ref.read(activityRemoteRepoProvider));
});