// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(locale)
const localeProvider = LocaleProvider._();

final class LocaleProvider extends $FunctionalProvider<Locale, Locale, Locale>
    with $Provider<Locale> {
  const LocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localeHash();

  @$internal
  @override
  $ProviderElement<Locale> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Locale create(Ref ref) {
    return locale(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$localeHash() => r'7373526ff99a5827cacbf612d68191e83bf8aee3';

@ProviderFor(languageCode)
const languageCodeProvider = LanguageCodeProvider._();

final class LanguageCodeProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const LanguageCodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'languageCodeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$languageCodeHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return languageCode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$languageCodeHash() => r'6215467f1818af1e331c3b217b72158f1f18ef04';

@ProviderFor(countryCode)
const countryCodeProvider = CountryCodeProvider._();

final class CountryCodeProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const CountryCodeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'countryCodeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$countryCodeHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return countryCode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$countryCodeHash() => r'c140e54c35eab32ff0ff9806d4acaceede067ded';
