import 'package:flutter/material.dart';
import 'package:field_service/src/localization/arb/app_localizations.dart';

extension AppLocalizationsBootstrap on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
