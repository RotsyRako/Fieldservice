import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:field_service/src/localization/supported_locale.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization.g.dart';

const SupportedLocale kDefaultLocale = SupportedLocale.french;

final IList<SupportedLocale> supportedLocales = SupportedLocale.values
    .toIList();

SupportedLocale localeListResolutionCallback(IList<Locale>? userLocales) {
  if (userLocales != null) {
    for (final userLocale in userLocales) {
      final supportedUserLocale = supportedLocales.firstWhereOrNull(
        (supportedLocale) =>
            supportedLocale.associatedLocale.languageCode ==
            userLocale.languageCode,
      );

      if (supportedUserLocale != null) {
        return supportedUserLocale;
      }
    }
  }

  return kDefaultLocale;
}

@riverpod
Locale locale(Ref _) => PlatformDispatcher.instance.locale;

@riverpod
String languageCode(Ref ref) =>
    ref.watch(localeProvider.select((locale) => locale.languageCode));

@riverpod
String countryCode(Ref ref) =>
    ref.watch(localeProvider.select((locale) => locale.countryCode)) ??
    kDefaultLocale.countryCode;
