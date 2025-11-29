// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.sa.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signInRemoteService)
const signInRemoteServiceProvider = SignInRemoteServiceProvider._();

final class SignInRemoteServiceProvider
    extends
        $FunctionalProvider<
          SignInRemoteService,
          SignInRemoteService,
          SignInRemoteService
        >
    with $Provider<SignInRemoteService> {
  const SignInRemoteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInRemoteServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInRemoteServiceHash();

  @$internal
  @override
  $ProviderElement<SignInRemoteService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SignInRemoteService create(Ref ref) {
    return signInRemoteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInRemoteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInRemoteService>(value),
    );
  }
}

String _$signInRemoteServiceHash() =>
    r'4b6405354cc845f4bcee930bd9a0f14efbbfcbe6';
