// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_local.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le service local des interventions

@ProviderFor(interventionLocalService)
const interventionLocalServiceProvider = InterventionLocalServiceProvider._();

/// Provider Riverpod pour le service local des interventions

final class InterventionLocalServiceProvider
    extends
        $FunctionalProvider<
          InterventionLocalService,
          InterventionLocalService,
          InterventionLocalService
        >
    with $Provider<InterventionLocalService> {
  /// Provider Riverpod pour le service local des interventions
  const InterventionLocalServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'interventionLocalServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$interventionLocalServiceHash();

  @$internal
  @override
  $ProviderElement<InterventionLocalService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InterventionLocalService create(Ref ref) {
    return interventionLocalService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InterventionLocalService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InterventionLocalService>(value),
    );
  }
}

String _$interventionLocalServiceHash() =>
    r'71ed604b2c6e0a6ef1066e7b4cc07828d028b0a2';
