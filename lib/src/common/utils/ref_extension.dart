import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

extension RefExtension on Ref {
  // When invoked keeps your provider alive for [duration].
  void cacheDataFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);

    onDispose(timer.cancel);
  }
}
