// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_remote.sa.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(materialRemoteService)
const materialRemoteServiceProvider = MaterialRemoteServiceProvider._();

final class MaterialRemoteServiceProvider
    extends
        $FunctionalProvider<
          MaterialRemoteService,
          MaterialRemoteService,
          MaterialRemoteService
        >
    with $Provider<MaterialRemoteService> {
  const MaterialRemoteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'materialRemoteServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$materialRemoteServiceHash();

  @$internal
  @override
  $ProviderElement<MaterialRemoteService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MaterialRemoteService create(Ref ref) {
    return materialRemoteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MaterialRemoteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MaterialRemoteService>(value),
    );
  }
}

String _$materialRemoteServiceHash() =>
    r'8a973e01e15f284d98b95e647b52c856e3722d5e';
