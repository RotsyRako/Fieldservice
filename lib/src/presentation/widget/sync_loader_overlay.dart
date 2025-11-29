import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:field_service/src/presentation/controller/sync/sync.controller.dart';
import 'package:field_service/src/common/theme/widgets/theme_loader/theme_loader.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';

/// Widget qui affiche un overlay avec un loader pendant la synchronisation
class SyncLoaderOverlay extends ConsumerWidget {
  const SyncLoaderOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncState = ref.watch(syncStateProvider);
    
    if (!syncState.isSyncing) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);

    return Material(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: theme.colors.baseWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ThemeLoader.animated(radius: 32),
              const ThemeGap.m(),
              ThemeText.bodySmallRegular(
                syncState.syncMessage ?? 'Synchronisation',
                color: theme.colors.primary50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

