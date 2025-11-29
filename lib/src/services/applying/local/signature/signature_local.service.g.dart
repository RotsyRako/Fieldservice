// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signature_local.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le service local des signatures

@ProviderFor(signatureLocalService)
const signatureLocalServiceProvider = SignatureLocalServiceProvider._();

/// Provider Riverpod pour le service local des signatures

final class SignatureLocalServiceProvider
    extends
        $FunctionalProvider<
          SignatureLocalService,
          SignatureLocalService,
          SignatureLocalService
        >
    with $Provider<SignatureLocalService> {
  /// Provider Riverpod pour le service local des signatures
  const SignatureLocalServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signatureLocalServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signatureLocalServiceHash();

  @$internal
  @override
  $ProviderElement<SignatureLocalService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SignatureLocalService create(Ref ref) {
    return signatureLocalService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignatureLocalService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignatureLocalService>(value),
    );
  }
}

String _$signatureLocalServiceHash() =>
    r'e96691e6a0f3885dad3648a4cef07716e1d224aa';
