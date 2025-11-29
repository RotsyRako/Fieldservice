// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_remote.sa.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(timesheetRemoteService)
const timesheetRemoteServiceProvider = TimesheetRemoteServiceProvider._();

final class TimesheetRemoteServiceProvider
    extends
        $FunctionalProvider<
          TimesheetRemoteService,
          TimesheetRemoteService,
          TimesheetRemoteService
        >
    with $Provider<TimesheetRemoteService> {
  const TimesheetRemoteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timesheetRemoteServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timesheetRemoteServiceHash();

  @$internal
  @override
  $ProviderElement<TimesheetRemoteService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TimesheetRemoteService create(Ref ref) {
    return timesheetRemoteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TimesheetRemoteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TimesheetRemoteService>(value),
    );
  }
}

String _$timesheetRemoteServiceHash() =>
    r'f3fb9f753bb3510000e91b2aa540969f8630af27';
