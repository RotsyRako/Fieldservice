// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_local.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le repository local des interventions

@ProviderFor(interventionLocalRepository)
const interventionLocalRepositoryProvider =
    InterventionLocalRepositoryProvider._();

/// Provider Riverpod pour le repository local des interventions

final class InterventionLocalRepositoryProvider
    extends
        $FunctionalProvider<
          InterventionLocalRepository,
          InterventionLocalRepository,
          InterventionLocalRepository
        >
    with $Provider<InterventionLocalRepository> {
  /// Provider Riverpod pour le repository local des interventions
  const InterventionLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'interventionLocalRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$interventionLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<InterventionLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InterventionLocalRepository create(Ref ref) {
    return interventionLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InterventionLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InterventionLocalRepository>(value),
    );
  }
}

String _$interventionLocalRepositoryHash() =>
    r'34fc091c883d9247e57a455300831e737bfa2a17';
