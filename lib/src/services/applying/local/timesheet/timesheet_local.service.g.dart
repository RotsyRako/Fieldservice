// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_local.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le service local des feuilles de temps

@ProviderFor(timesheetLocalService)
const timesheetLocalServiceProvider = TimesheetLocalServiceProvider._();

/// Provider Riverpod pour le service local des feuilles de temps

final class TimesheetLocalServiceProvider
    extends
        $FunctionalProvider<
          TimesheetLocalService,
          TimesheetLocalService,
          TimesheetLocalService
        >
    with $Provider<TimesheetLocalService> {
  /// Provider Riverpod pour le service local des feuilles de temps
  const TimesheetLocalServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timesheetLocalServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timesheetLocalServiceHash();

  @$internal
  @override
  $ProviderElement<TimesheetLocalService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TimesheetLocalService create(Ref ref) {
    return timesheetLocalService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TimesheetLocalService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TimesheetLocalService>(value),
    );
  }
}

String _$timesheetLocalServiceHash() =>
    r'cb81eb1f22b2ccdefb320708b56b30d4c7d4048d';
