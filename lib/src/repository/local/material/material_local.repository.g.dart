// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_local.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le repository local des matériaux

@ProviderFor(materialLocalRepository)
const materialLocalRepositoryProvider = MaterialLocalRepositoryProvider._();

/// Provider Riverpod pour le repository local des matériaux

final class MaterialLocalRepositoryProvider
    extends
        $FunctionalProvider<
          MaterialLocalRepository,
          MaterialLocalRepository,
          MaterialLocalRepository
        >
    with $Provider<MaterialLocalRepository> {
  /// Provider Riverpod pour le repository local des matériaux
  const MaterialLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'materialLocalRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$materialLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<MaterialLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MaterialLocalRepository create(Ref ref) {
    return materialLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MaterialLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MaterialLocalRepository>(value),
    );
  }
}

String _$materialLocalRepositoryHash() =>
    r'a326a4e3c1233a9de80aa96f6becff64a0a963a7';
