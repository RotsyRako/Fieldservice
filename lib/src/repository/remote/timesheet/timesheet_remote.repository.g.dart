// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timesheet_remote.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(timesheetRemoteRepository)
const timesheetRemoteRepositoryProvider = TimesheetRemoteRepositoryProvider._();

final class TimesheetRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          TimesheetRemoteRepository,
          TimesheetRemoteRepository,
          TimesheetRemoteRepository
        >
    with $Provider<TimesheetRemoteRepository> {
  const TimesheetRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'timesheetRemoteRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$timesheetRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<TimesheetRemoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TimesheetRemoteRepository create(Ref ref) {
    return timesheetRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TimesheetRemoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TimesheetRemoteRepository>(value),
    );
  }
}

String _$timesheetRemoteRepositoryHash() =>
    r'3ab4632d77d17b4bf112e8c612979190497ff0de';
