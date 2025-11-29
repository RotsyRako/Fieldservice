// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention_remote.sa.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(interventionRemoteService)
const interventionRemoteServiceProvider = InterventionRemoteServiceProvider._();

final class InterventionRemoteServiceProvider
    extends
        $FunctionalProvider<
          InterventionRemoteService,
          InterventionRemoteService,
          InterventionRemoteService
        >
    with $Provider<InterventionRemoteService> {
  const InterventionRemoteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'interventionRemoteServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$interventionRemoteServiceHash();

  @$internal
  @override
  $ProviderElement<InterventionRemoteService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InterventionRemoteService create(Ref ref) {
    return interventionRemoteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InterventionRemoteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InterventionRemoteService>(value),
    );
  }
}

String _$interventionRemoteServiceHash() =>
    r'9c9bdbf0d7afeb94955c33ad20cf87670e4545e0';
