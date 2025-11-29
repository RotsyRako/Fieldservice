// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention.controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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
    r'025183a7f18301e105771419b6b37994171dabaf';

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
