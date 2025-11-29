// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_remote.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signatureRemoteRepository)
const signatureRemoteRepositoryProvider = SignatureRemoteRepositoryProvider._();

final class SignatureRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          SignatureRemoteRepository,
          SignatureRemoteRepository,
          SignatureRemoteRepository
        >
    with $Provider<SignatureRemoteRepository> {
  const SignatureRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signatureRemoteRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signatureRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<SignatureRemoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SignatureRemoteRepository create(Ref ref) {
    return signatureRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignatureRemoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignatureRemoteRepository>(value),
    );
  }
}

String _$signatureRemoteRepositoryHash() =>
    r'4f635d1961c6ce2dc77903fb5945d88ba2e0b30a';
