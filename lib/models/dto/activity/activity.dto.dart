import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.dto.freezed.dart';
part 'activity.dto.g.dart';

@freezed
abstract class Activity with _$Activity {
  const factory Activity({
    required String activity,
    required double availability,
    required String type,
    required int participants,
    required double price,
    required String accessibility,
    required String duration,
    required bool kidFriendly,
    required String link,
    required String key,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json) =>
      _$ActivityFromJson(json);
}
