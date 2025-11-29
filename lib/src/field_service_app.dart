import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/localization/app_localizations_bootstrap.dart';
import 'package:field_service/src/localization/arb/app_localizations.dart';
import 'package:field_service/src/localization/localization.dart';
import 'package:field_service/src/presentation/controller/sync/auto_sync.provider.dart';
import 'package:field_service/src/presentation/widget/sync_loader_overlay.dart';
import 'package:field_service/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FieldServiceApp extends ConsumerWidget {
  const FieldServiceApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    
    // Initialiser le provider de synchronisation automatique
    ref.watch(autoSyncProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      theme: lightTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeListResolutionCallback: (locales, _) =>
          localeListResolutionCallback(locales?.lock).associatedLocale,
      restorationScopeId: 'app',
      onGenerateTitle: (context) => context.l10n.appTitle,
      builder: (context, child) {
        return Stack(
          children: [
            if (child != null) child,
            SyncLoaderOverlay(),
          ],
        );
      },
    );
  }
}
