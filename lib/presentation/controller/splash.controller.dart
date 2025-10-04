import 'package:arkup_edoo/repository/remote/base_remote.repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:arkup_edoo/models/constant/routes.dart';
import 'package:arkup_edoo/presentation/controller/base.controller.dart';

final splashControllerProvider =
    StateNotifierProvider.autoDispose<SplashController, AsyncValue<void>>(
  (ref) => SplashController(ref),
);

class SplashController extends BaseController<void> {
  SplashController(Ref ref) : super(ref, const AsyncValue.data(null));

  Future<void> init(BuildContext context) async {
    final storage = ref.read(secureStorageProvider);
    // Navigation
    final baseUrl = await storage.getBaseUrl();
    final token = await storage.getAccessToken();
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      if (baseUrl == null || baseUrl.isEmpty) {
        context.go(Routes.serverConfig);
      } else if (token == null || token.isEmpty) {
        context.go(Routes.login);
      } else {
        context.go(Routes.home);
      }
    }


  }
}
