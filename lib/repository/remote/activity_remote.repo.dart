import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/models/constant/urls.dart';
import 'package:arkup_edoo/models/dto/activity/activity.dto.dart';
import 'package:arkup_edoo/repository/remote/base_remote.repo.dart';



class ActivityRemoteRepo {
  final BaseRemoteRepo helper;

  ActivityRemoteRepo(this.helper);  // Injection via constructeur

  Future<Activity> getRandomActivity() async {
    print("repo start =========");
    final response = await helper.get(Urls.activity.random, params: {}, tokenRequired: false );
    print("reponse SA ========= ${response}");
    return Activity.fromJson(response);
  }
}

final activityRemoteRepoProvider = Provider<ActivityRemoteRepo>((ref) {
  return ActivityRemoteRepo(ref.read(baseRemoteRepoProvider)); // Injecté
});