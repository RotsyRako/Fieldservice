import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:field_service/src/localization/app_localizations_bootstrap.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/services/technical/app_shared_preferences.dart';
import 'package:field_service/src/services/technical/connection_service.dart';

class StatusAppBar extends ConsumerWidget {
  const StatusAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final connectionStatusAsync = ref.watch(connectionStatusProvider);
    
    return Container(
      decoration: BoxDecoration(
        color: theme.colors.baseWhite,
      ),
      child: SafeArea(
        bottom: false,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Statut de connexion dynamique
              connectionStatusAsync.when(
                data: (isOnline) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: isOnline
                        ? const Color(0xFF2F781D).withValues(alpha: 0.12)
                        : const Color(0xFF73233C).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: isOnline
                              ? const Color(0xFF2F781D)
                              : const Color(0xFF73233C),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const ThemeGap.xs(),
                      ThemeText.bodyXSmallSemiBold(
                        isOnline ? l10n.online : 'Hors ligne',
                        color: isOnline
                            ? const Color(0xFF2F781D)
                            : const Color(0xFF73233C),
                      ),
                    ],
                  ),
                ),
                loading: () => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF73233C).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF73233C),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const ThemeGap.xs(),
                      ThemeText.bodyXSmallSemiBold(
                        'Hors ligne',
                        color: const Color(0xFF73233C),
                      ),
                    ],
                  ),
                ),
                error: (_, __) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF73233C).withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 4,
                        height: 4,
                        decoration: const BoxDecoration(
                          color: Color(0xFF73233C),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const ThemeGap.xs(),
                      ThemeText.bodyXSmallSemiBold(
                        'Hors ligne',
                        color: const Color(0xFF73233C),
                      ),
                    ],
                  ),
                ),
              ),
              
              // Bouton de déconnexion
              GestureDetector(
                onTap: () async {
                  final appSharedPreferences = 
                      await ref.read(appSharedPreferencesProvider.future);
                  await appSharedPreferences.signOut();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.power_settings_new,
                      size: 12,
                      color: theme.colors.grey50.withValues(alpha: 0.64),
                    ),
                    const ThemeGap.xs(),
                    ThemeText.bodyXSmallSemiBold(
                      l10n.signOut,
                      color: theme.colors.grey50.withValues(alpha: 0.64),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
