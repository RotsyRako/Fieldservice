// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider pour SignInRepository

@ProviderFor(signInRepository)
const signInRepositoryProvider = SignInRepositoryProvider._();

/// Provider pour SignInRepository

final class SignInRepositoryProvider
    extends
        $FunctionalProvider<
          SignInRepository,
          SignInRepository,
          SignInRepository
        >
    with $Provider<SignInRepository> {
  /// Provider pour SignInRepository
  const SignInRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'signInRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$signInRepositoryHash();

  @$internal
  @override
  $ProviderElement<SignInRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignInRepository create(Ref ref) {
    return signInRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInRepository>(value),
    );
  }
}

String _$signInRepositoryHash() => r'99b160102ee23c9d8393880ac70e3f19d84266ce';
