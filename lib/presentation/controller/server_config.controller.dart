import 'package:arkup_edoo/models/constant/routes.dart';
import 'package:arkup_edoo/presentation/controller/base.controller.dart';
import 'package:arkup_edoo/repository/secure_storage.dart';
import 'package:arkup_edoo/service/applying/remote/server_remote.sa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final serverConfigControllerProvider =
    StateNotifierProvider<ServerConfigController, AsyncValue<void>>(
  (ref) => ServerConfigController(ref),
);

class ServerConfigController extends BaseController<void> {
  ServerConfigController(Ref ref) : super(ref, const AsyncValue.data(null));

  Future<void> validateAndSave({
    required String baseUrl,
    required BuildContext context,
  }) async {
    final url = _sanitizeBaseUrl(baseUrl);

    setLoading(show: true, message: 'Validation du serveur...');
    try {
      final response = await ref
          .read(serverRemoteServiceProvider)
          .ping(baseUrl: url);

      final success = response['success'] == true;
      if (success) {
        final storage = ref.read(secureStorageProvider);
        await storage.saveBaseUrl(url);
        showSnackbar('Serveur validé');
        if (context.mounted) {
          context.go(Routes.login);
        }
      } else {
        showSnackbar(response['message']?.toString() ?? 'Serveur invalide', isError: true);
      }
    } catch (e) {
      showSnackbar('Erreur de validation du serveur', isError: true);
    } finally {
      setLoading(show: false);
    }
  }

  String _sanitizeBaseUrl(String input) {
    var url = input.trim();
    if (url.endsWith('/')) {
      url = url.substring(0, url.length - 1);
    }
    return url;
  }
}
