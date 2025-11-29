// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_remote.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(materialRemoteRepository)
const materialRemoteRepositoryProvider = MaterialRemoteRepositoryProvider._();

final class MaterialRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          MaterialRemoteRepository,
          MaterialRemoteRepository,
          MaterialRemoteRepository
        >
    with $Provider<MaterialRemoteRepository> {
  const MaterialRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'materialRemoteRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$materialRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<MaterialRemoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MaterialRemoteRepository create(Ref ref) {
    return materialRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MaterialRemoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MaterialRemoteRepository>(value),
    );
  }
}

String _$materialRemoteRepositoryHash() =>
    r'81c0cd562653c120673f5d6e967d85cc3e9e6e62';
