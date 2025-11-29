import 'package:flutter/material.dart';

enum SupportedLocale {
  french(Locale('fr'), 'FR');

  const SupportedLocale(this.associatedLocale, this.countryCode);

  final Locale associatedLocale;
  // ** Needs to override the default country code from the Locale class
  // ** because the country code can be null
  final String countryCode;
}
