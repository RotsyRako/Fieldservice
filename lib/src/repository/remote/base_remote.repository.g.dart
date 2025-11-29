// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_remote.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider pour BaseRemoteRepository

@ProviderFor(baseRemoteRepository)
const baseRemoteRepositoryProvider = BaseRemoteRepositoryProvider._();

/// Provider pour BaseRemoteRepository

final class BaseRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          BaseRemoteRepository,
          BaseRemoteRepository,
          BaseRemoteRepository
        >
    with $Provider<BaseRemoteRepository> {
  /// Provider pour BaseRemoteRepository
  const BaseRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'baseRemoteRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$baseRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<BaseRemoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BaseRemoteRepository create(Ref ref) {
    return baseRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseRemoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseRemoteRepository>(value),
    );
  }
}

String _$baseRemoteRepositoryHash() =>
    r'cdac8e9541fa35a09bb12ab80f2c0b31f470d922';
