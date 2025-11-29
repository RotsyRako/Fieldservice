// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_remote.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(scanRemoteRepository)
const scanRemoteRepositoryProvider = ScanRemoteRepositoryProvider._();

final class ScanRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          ScanRemoteRepository,
          ScanRemoteRepository,
          ScanRemoteRepository
        >
    with $Provider<ScanRemoteRepository> {
  const ScanRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'scanRemoteRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$scanRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<ScanRemoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ScanRemoteRepository create(Ref ref) {
    return scanRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScanRemoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScanRemoteRepository>(value),
    );
  }
}

String _$scanRemoteRepositoryHash() =>
    r'abf234398abff24616f4d0518621c70c1125b2f8';
