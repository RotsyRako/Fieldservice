// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider pour récupérer l'estimation d'une intervention

@ProviderFor(interventionEstimate)
const interventionEstimateProvider = InterventionEstimateFamily._();

/// Provider pour récupérer l'estimation d'une intervention

final class InterventionEstimateProvider
    extends
        $FunctionalProvider<
          AsyncValue<InterventionEstimateDataDto?>,
          InterventionEstimateDataDto?,
          FutureOr<InterventionEstimateDataDto?>
        >
    with
        $FutureModifier<InterventionEstimateDataDto?>,
        $FutureProvider<InterventionEstimateDataDto?> {
  /// Provider pour récupérer l'estimation d'une intervention
  const InterventionEstimateProvider._({
    required InterventionEstimateFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'interventionEstimateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$interventionEstimateHash();

  @override
  String toString() {
    return r'interventionEstimateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<InterventionEstimateDataDto?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<InterventionEstimateDataDto?> create(Ref ref) {
    final argument = this.argument as String;
    return interventionEstimate(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is InterventionEstimateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$interventionEstimateHash() =>
    r'77f3133af2b7a7c8caef122e2b54a31b3ce6dc8e';

/// Provider pour récupérer l'estimation d'une intervention

final class InterventionEstimateFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<InterventionEstimateDataDto?>,
          String
        > {
  const InterventionEstimateFamily._()
    : super(
        retry: null,
        name: r'interventionEstimateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider pour récupérer l'estimation d'une intervention

  InterventionEstimateProvider call(String interventionId) =>
      InterventionEstimateProvider._(argument: interventionId, from: this);

  @override
  String toString() => r'interventionEstimateProvider';
}

@ProviderFor(InterventionController)
const interventionControllerProvider = InterventionControllerFamily._();

final class InterventionControllerProvider
    extends $AsyncNotifierProvider<InterventionController, InterventionDto?> {
  const InterventionControllerProvider._({
    required InterventionControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'interventionControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$interventionControllerHash();

  @override
  String toString() {
    return r'interventionControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  InterventionController create() => InterventionController();

  @override
  bool operator ==(Object other) {
    return other is InterventionControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$interventionControllerHash() =>
    r'7bcad522f0c182d6a466bc1e564a239f63e4df53';

final class InterventionControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          InterventionController,
          AsyncValue<InterventionDto?>,
          InterventionDto?,
          FutureOr<InterventionDto?>,
          String
        > {
  const InterventionControllerFamily._()
    : super(
        retry: null,
        name: r'interventionControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  InterventionControllerProvider call(String id) =>
      InterventionControllerProvider._(argument: id, from: this);

  @override
  String toString() => r'interventionControllerProvider';
}

abstract class _$InterventionController
    extends $AsyncNotifier<InterventionDto?> {
  late final _$args = ref.$arg as String;
  String get id => _$args;

  FutureOr<InterventionDto?> build(String id);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<InterventionDto?>, InterventionDto?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<InterventionDto?>, InterventionDto?>,
              AsyncValue<InterventionDto?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
