// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_local.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le repository local des feuilles de temps

@ProviderFor(timesheetLocalRepository)
const timesheetLocalRepositoryProvider = TimesheetLocalRepositoryProvider._();

/// Provider Riverpod pour le repository local des feuilles de temps

final class TimesheetLocalRepositoryProvider
    extends
        $FunctionalProvider<
          TimesheetLocalRepository,
          TimesheetLocalRepository,
          TimesheetLocalRepository
        >
    with $Provider<TimesheetLocalRepository> {
  /// Provider Riverpod pour le repository local des feuilles de temps
  const TimesheetLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timesheetLocalRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timesheetLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<TimesheetLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TimesheetLocalRepository create(Ref ref) {
    return timesheetLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TimesheetLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TimesheetLocalRepository>(value),
    );
  }
}

String _$timesheetLocalRepositoryHash() =>
    r'dfe8d6f67bbf7d41ed2caf2dfd7bce4fa5b94a4c';
