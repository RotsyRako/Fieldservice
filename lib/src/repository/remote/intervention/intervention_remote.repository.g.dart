// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_remote.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(interventionRemoteRepository)
const interventionRemoteRepositoryProvider =
    InterventionRemoteRepositoryProvider._();

final class InterventionRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          InterventionRemoteRepository,
          InterventionRemoteRepository,
          InterventionRemoteRepository
        >
    with $Provider<InterventionRemoteRepository> {
  const InterventionRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'interventionRemoteRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$interventionRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<InterventionRemoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InterventionRemoteRepository create(Ref ref) {
    return interventionRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InterventionRemoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InterventionRemoteRepository>(value),
    );
  }
}

String _$interventionRemoteRepositoryHash() =>
    r'cb733e7ae6aae48d689ce92cb8877f60f2420b03';
