// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(connectionService)
const connectionServiceProvider = ConnectionServiceProvider._();

final class ConnectionServiceProvider
    extends
        $FunctionalProvider<
          ConnectionService,
          ConnectionService,
          ConnectionService
        >
    with $Provider<ConnectionService> {
  const ConnectionServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectionServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectionServiceHash();

  @$internal
  @override
  $ProviderElement<ConnectionService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConnectionService create(Ref ref) {
    return connectionService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectionService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectionService>(value),
    );
  }
}

String _$connectionServiceHash() => r'0e20430235dd6911ec82441e0d7a224280c598c3';

@ProviderFor(connectionStatus)
const connectionStatusProvider = ConnectionStatusProvider._();

final class ConnectionStatusProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  const ConnectionStatusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectionStatusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectionStatusHash();

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    return connectionStatus(ref);
  }
}

String _$connectionStatusHash() => r'6de0a5f0af0a0c6bbbca96882d26d441c5f95ae2';
