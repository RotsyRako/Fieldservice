// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_remote.sa.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signatureRemoteService)
const signatureRemoteServiceProvider = SignatureRemoteServiceProvider._();

final class SignatureRemoteServiceProvider
    extends
        $FunctionalProvider<
          SignatureRemoteService,
          SignatureRemoteService,
          SignatureRemoteService
        >
    with $Provider<SignatureRemoteService> {
  const SignatureRemoteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signatureRemoteServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signatureRemoteServiceHash();

  @$internal
  @override
  $ProviderElement<SignatureRemoteService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SignatureRemoteService create(Ref ref) {
    return signatureRemoteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignatureRemoteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignatureRemoteService>(value),
    );
  }
}

String _$signatureRemoteServiceHash() =>
    r'f7e19971cc73c7a5467fc56969670a5e6422f74b';
