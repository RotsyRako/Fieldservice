// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_shared_preferences.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(isAuthenticated)
const isAuthenticatedProvider = IsAuthenticatedProvider._();

final class IsAuthenticatedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const IsAuthenticatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isAuthenticatedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isAuthenticatedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isAuthenticated(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isAuthenticatedHash() => r'ed927c0655057a078d3a80e6d422c87404759c29';

@ProviderFor(authStateChanges)
const authStateChangesProvider = AuthStateChangesProvider._();

final class AuthStateChangesProvider
    extends $FunctionalProvider<AsyncValue<String?>, String?, Stream<String?>>
    with $FutureModifier<String?>, $StreamProvider<String?> {
  const AuthStateChangesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateChangesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateChangesHash();

  @$internal
  @override
  $StreamProviderElement<String?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<String?> create(Ref ref) {
    return authStateChanges(ref);
  }
}

String _$authStateChangesHash() => r'd123a1352dcdd915dc43ab6217e1c867b4d5eb79';

@ProviderFor(isInterventionTableCreated)
const isInterventionTableCreatedProvider =
    IsInterventionTableCreatedProvider._();

final class IsInterventionTableCreatedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const IsInterventionTableCreatedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isInterventionTableCreatedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isInterventionTableCreatedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isInterventionTableCreated(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isInterventionTableCreatedHash() =>
    r'd0daa7ffd3e6a0cc39a2924f111f920b1803eedf';

@ProviderFor(isSync)
const isSyncProvider = IsSyncProvider._();

final class IsSyncProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const IsSyncProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isSyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isSyncHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return isSync(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isSyncHash() => r'3c4f34135c35f75787e8a4b12c24c5236c7b0364';

@ProviderFor(appSharedPreferences)
const appSharedPreferencesProvider = AppSharedPreferencesProvider._();

final class AppSharedPreferencesProvider
    extends
        $FunctionalProvider<
          AsyncValue<AppSharedPreferences>,
          AppSharedPreferences,
          FutureOr<AppSharedPreferences>
        >
    with
        $FutureModifier<AppSharedPreferences>,
        $FutureProvider<AppSharedPreferences> {
  const AppSharedPreferencesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSharedPreferencesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSharedPreferencesHash();

  @$internal
  @override
  $FutureProviderElement<AppSharedPreferences> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AppSharedPreferences> create(Ref ref) {
    return appSharedPreferences(ref);
  }
}

String _$appSharedPreferencesHash() =>
    r'31c7b2e96f071b15a4bf3632637370c87109cc4e';
