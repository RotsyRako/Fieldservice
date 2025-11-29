// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_sync.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider qui écoute les changements de connexion et déclenche la synchronisation automatique

@ProviderFor(AutoSyncNotifier)
const autoSyncProvider = AutoSyncNotifierProvider._();

/// Provider qui écoute les changements de connexion et déclenche la synchronisation automatique
final class AutoSyncNotifierProvider
    extends $AsyncNotifierProvider<AutoSyncNotifier, void> {
  /// Provider qui écoute les changements de connexion et déclenche la synchronisation automatique
  const AutoSyncNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'autoSyncProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$autoSyncNotifierHash();

  @$internal
  @override
  AutoSyncNotifier create() => AutoSyncNotifier();
}

String _$autoSyncNotifierHash() => r'90adacca90b4ca60182bf40ab3d6a0b8d3ac6a6b';

/// Provider qui écoute les changements de connexion et déclenche la synchronisation automatique

abstract class _$AutoSyncNotifier extends $AsyncNotifier<void> {
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
