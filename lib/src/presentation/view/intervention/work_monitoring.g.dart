// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_monitoring.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider pour récupérer les feuilles de temps d'une intervention

@ProviderFor(timesheetsByIntervention)
const timesheetsByInterventionProvider = TimesheetsByInterventionFamily._();

/// Provider pour récupérer les feuilles de temps d'une intervention

final class TimesheetsByInterventionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TimesheetDto>>,
          List<TimesheetDto>,
          FutureOr<List<TimesheetDto>>
        >
    with
        $FutureModifier<List<TimesheetDto>>,
        $FutureProvider<List<TimesheetDto>> {
  /// Provider pour récupérer les feuilles de temps d'une intervention
  const TimesheetsByInterventionProvider._({
    required TimesheetsByInterventionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'timesheetsByInterventionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$timesheetsByInterventionHash();

  @override
  String toString() {
    return r'timesheetsByInterventionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<TimesheetDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<TimesheetDto>> create(Ref ref) {
    final argument = this.argument as String;
    return timesheetsByIntervention(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TimesheetsByInterventionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$timesheetsByInterventionHash() =>
    r'38050feae802cb990d8638d5713d60c6bfca52a9';

/// Provider pour récupérer les feuilles de temps d'une intervention

final class TimesheetsByInterventionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<TimesheetDto>>, String> {
  const TimesheetsByInterventionFamily._()
    : super(
        retry: null,
        name: r'timesheetsByInterventionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider pour récupérer les feuilles de temps d'une intervention

  TimesheetsByInterventionProvider call(String interventionId) =>
      TimesheetsByInterventionProvider._(argument: interventionId, from: this);

  @override
  String toString() => r'timesheetsByInterventionProvider';
}

/// Provider pour récupérer les matériaux d'une intervention

@ProviderFor(materialsByIntervention)
const materialsByInterventionProvider = MaterialsByInterventionFamily._();

/// Provider pour récupérer les matériaux d'une intervention

final class MaterialsByInterventionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MaterialDto>>,
          List<MaterialDto>,
          FutureOr<List<MaterialDto>>
        >
    with
        $FutureModifier<List<MaterialDto>>,
        $FutureProvider<List<MaterialDto>> {
  /// Provider pour récupérer les matériaux d'une intervention
  const MaterialsByInterventionProvider._({
    required MaterialsByInterventionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'materialsByInterventionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$materialsByInterventionHash();

  @override
  String toString() {
    return r'materialsByInterventionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<MaterialDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MaterialDto>> create(Ref ref) {
    final argument = this.argument as String;
    return materialsByIntervention(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MaterialsByInterventionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$materialsByInterventionHash() =>
    r'c145327170e17c25b815c047c3e94fdbc60214cf';

/// Provider pour récupérer les matériaux d'une intervention

final class MaterialsByInterventionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<MaterialDto>>, String> {
  const MaterialsByInterventionFamily._()
    : super(
        retry: null,
        name: r'materialsByInterventionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider pour récupérer les matériaux d'une intervention

  MaterialsByInterventionProvider call(String interventionId) =>
      MaterialsByInterventionProvider._(argument: interventionId, from: this);

  @override
  String toString() => r'materialsByInterventionProvider';
}

/// Provider pour récupérer les images d'une intervention

@ProviderFor(imagesByIntervention)
const imagesByInterventionProvider = ImagesByInterventionFamily._();

/// Provider pour récupérer les images d'une intervention

final class ImagesByInterventionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ImageDto>>,
          List<ImageDto>,
          FutureOr<List<ImageDto>>
        >
    with $FutureModifier<List<ImageDto>>, $FutureProvider<List<ImageDto>> {
  /// Provider pour récupérer les images d'une intervention
  const ImagesByInterventionProvider._({
    required ImagesByInterventionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'imagesByInterventionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$imagesByInterventionHash();

  @override
  String toString() {
    return r'imagesByInterventionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ImageDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ImageDto>> create(Ref ref) {
    final argument = this.argument as String;
    return imagesByIntervention(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ImagesByInterventionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$imagesByInterventionHash() =>
    r'181839a797448c5252e79083dcf82cfb5eb924b0';

/// Provider pour récupérer les images d'une intervention

final class ImagesByInterventionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ImageDto>>, String> {
  const ImagesByInterventionFamily._()
    : super(
        retry: null,
        name: r'imagesByInterventionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider pour récupérer les images d'une intervention

  ImagesByInterventionProvider call(String interventionId) =>
      ImagesByInterventionProvider._(argument: interventionId, from: this);

  @override
  String toString() => r'imagesByInterventionProvider';
}

/// Provider pour récupérer les documents d'une intervention

@ProviderFor(documentsByIntervention)
const documentsByInterventionProvider = DocumentsByInterventionFamily._();

/// Provider pour récupérer les documents d'une intervention

final class DocumentsByInterventionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<DocumentDto>>,
          List<DocumentDto>,
          FutureOr<List<DocumentDto>>
        >
    with
        $FutureModifier<List<DocumentDto>>,
        $FutureProvider<List<DocumentDto>> {
  /// Provider pour récupérer les documents d'une intervention
  const DocumentsByInterventionProvider._({
    required DocumentsByInterventionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'documentsByInterventionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$documentsByInterventionHash();

  @override
  String toString() {
    return r'documentsByInterventionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<DocumentDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<DocumentDto>> create(Ref ref) {
    final argument = this.argument as String;
    return documentsByIntervention(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is DocumentsByInterventionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$documentsByInterventionHash() =>
    r'195752ff45af6bc94f82f28ba05b833c58a91e2c';

/// Provider pour récupérer les documents d'une intervention

final class DocumentsByInterventionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<DocumentDto>>, String> {
  const DocumentsByInterventionFamily._()
    : super(
        retry: null,
        name: r'documentsByInterventionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider pour récupérer les documents d'une intervention

  DocumentsByInterventionProvider call(String interventionId) =>
      DocumentsByInterventionProvider._(argument: interventionId, from: this);

  @override
  String toString() => r'documentsByInterventionProvider';
}

/// Provider pour récupérer les commentaires d'une intervention

@ProviderFor(commentsByIntervention)
const commentsByInterventionProvider = CommentsByInterventionFamily._();

/// Provider pour récupérer les commentaires d'une intervention

final class CommentsByInterventionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CommentDto>>,
          List<CommentDto>,
          FutureOr<List<CommentDto>>
        >
    with $FutureModifier<List<CommentDto>>, $FutureProvider<List<CommentDto>> {
  /// Provider pour récupérer les commentaires d'une intervention
  const CommentsByInterventionProvider._({
    required CommentsByInterventionFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentsByInterventionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentsByInterventionHash();

  @override
  String toString() {
    return r'commentsByInterventionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<CommentDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<CommentDto>> create(Ref ref) {
    final argument = this.argument as String;
    return commentsByIntervention(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentsByInterventionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentsByInterventionHash() =>
    r'0dda7cc7f4e74dd8e4c9b657057d103664d504ff';

/// Provider pour récupérer les commentaires d'une intervention

final class CommentsByInterventionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<CommentDto>>, String> {
  const CommentsByInterventionFamily._()
    : super(
        retry: null,
        name: r'commentsByInterventionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider pour récupérer les commentaires d'une intervention

  CommentsByInterventionProvider call(String interventionId) =>
      CommentsByInterventionProvider._(argument: interventionId, from: this);

  @override
  String toString() => r'commentsByInterventionProvider';
}

/// Provider pour gérer l'état du timer par intervention

@ProviderFor(TimerState)
const timerStateProvider = TimerStateFamily._();

/// Provider pour gérer l'état du timer par intervention
final class TimerStateProvider extends $NotifierProvider<TimerState, bool> {
  /// Provider pour gérer l'état du timer par intervention
  const TimerStateProvider._({
    required TimerStateFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'timerStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$timerStateHash();

  @override
  String toString() {
    return r'timerStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TimerState create() => TimerState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TimerStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$timerStateHash() => r'b01ffced95bccd56955f808dfeaeedbc2aadabc0';

/// Provider pour gérer l'état du timer par intervention

final class TimerStateFamily extends $Family
    with $ClassFamilyOverride<TimerState, bool, bool, bool, String> {
  const TimerStateFamily._()
    : super(
        retry: null,
        name: r'timerStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider pour gérer l'état du timer par intervention

  TimerStateProvider call(String interventionId) =>
      TimerStateProvider._(argument: interventionId, from: this);

  @override
  String toString() => r'timerStateProvider';
}

/// Provider pour gérer l'état du timer par intervention

abstract class _$TimerState extends $Notifier<bool> {
  late final _$args = ref.$arg as String;
  String get interventionId => _$args;

  bool build(String interventionId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
