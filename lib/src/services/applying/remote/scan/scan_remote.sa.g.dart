// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_remote.sa.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(scanRemoteService)
const scanRemoteServiceProvider = ScanRemoteServiceProvider._();

final class ScanRemoteServiceProvider
    extends
        $FunctionalProvider<
          ScanRemoteService,
          ScanRemoteService,
          ScanRemoteService
        >
    with $Provider<ScanRemoteService> {
  const ScanRemoteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanRemoteServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanRemoteServiceHash();

  @$internal
  @override
  $ProviderElement<ScanRemoteService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ScanRemoteService create(Ref ref) {
    return scanRemoteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScanRemoteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScanRemoteService>(value),
    );
  }
}

String _$scanRemoteServiceHash() => r'385e7873cd918154295c1f49628a89768e4777e3';
