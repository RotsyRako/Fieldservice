// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider pour l'état de synchronisation
/// On utilise keepAlive pour éviter que le provider soit disposé

@ProviderFor(SyncStateNotifier)
const syncStateProvider = SyncStateNotifierProvider._();

/// Provider pour l'état de synchronisation
/// On utilise keepAlive pour éviter que le provider soit disposé
final class SyncStateNotifierProvider
    extends $NotifierProvider<SyncStateNotifier, SyncState> {
  /// Provider pour l'état de synchronisation
  /// On utilise keepAlive pour éviter que le provider soit disposé
  const SyncStateNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncStateProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncStateNotifierHash();

  @$internal
  @override
  SyncStateNotifier create() => SyncStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SyncState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SyncState>(value),
    );
  }
}

String _$syncStateNotifierHash() => r'9dff300a65e2961ed44f13b74003bff5c8dc8f95';

/// Provider pour l'état de synchronisation
/// On utilise keepAlive pour éviter que le provider soit disposé

abstract class _$SyncStateNotifier extends $Notifier<SyncState> {
  SyncState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SyncState, SyncState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SyncState, SyncState>,
              SyncState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Controller pour gérer la synchronisation des interventions

@ProviderFor(SyncController)
const syncControllerProvider = SyncControllerProvider._();

/// Controller pour gérer la synchronisation des interventions
final class SyncControllerProvider
    extends $AsyncNotifierProvider<SyncController, void> {
  /// Controller pour gérer la synchronisation des interventions
  const SyncControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'syncControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$syncControllerHash();

  @$internal
  @override
  SyncController create() => SyncController();
}

String _$syncControllerHash() => r'9ec191d608074b3fe873818cbe4e3a744e839dd6';

/// Controller pour gérer la synchronisation des interventions

abstract class _$SyncController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
