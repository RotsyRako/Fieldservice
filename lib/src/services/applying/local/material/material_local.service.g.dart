// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_local.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le service local des matériaux

@ProviderFor(materialLocalService)
const materialLocalServiceProvider = MaterialLocalServiceProvider._();

/// Provider Riverpod pour le service local des matériaux

final class MaterialLocalServiceProvider
    extends
        $FunctionalProvider<
          MaterialLocalService,
          MaterialLocalService,
          MaterialLocalService
        >
    with $Provider<MaterialLocalService> {
  /// Provider Riverpod pour le service local des matériaux
  const MaterialLocalServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'materialLocalServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$materialLocalServiceHash();

  @$internal
  @override
  $ProviderElement<MaterialLocalService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MaterialLocalService create(Ref ref) {
    return materialLocalService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MaterialLocalService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MaterialLocalService>(value),
    );
  }
}

String _$materialLocalServiceHash() =>
    r'6e79d5a4076a4ecd20f777e82202e659db6f9362';
