// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_local.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le repository local des signatures

@ProviderFor(signatureLocalRepository)
const signatureLocalRepositoryProvider = SignatureLocalRepositoryProvider._();

/// Provider Riverpod pour le repository local des signatures

final class SignatureLocalRepositoryProvider
    extends
        $FunctionalProvider<
          SignatureLocalRepository,
          SignatureLocalRepository,
          SignatureLocalRepository
        >
    with $Provider<SignatureLocalRepository> {
  /// Provider Riverpod pour le repository local des signatures
  const SignatureLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signatureLocalRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signatureLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<SignatureLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SignatureLocalRepository create(Ref ref) {
    return signatureLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignatureLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignatureLocalRepository>(value),
    );
  }
}

String _$signatureLocalRepositoryHash() =>
    r'4847f5c44e41f5b6cf567ab2002c941d1747d225';
