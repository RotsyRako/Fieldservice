// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_remote.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(imageRemoteRepository)
const imageRemoteRepositoryProvider = ImageRemoteRepositoryProvider._();

final class ImageRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          ImageRemoteRepository,
          ImageRemoteRepository,
          ImageRemoteRepository
        >
    with $Provider<ImageRemoteRepository> {
  const ImageRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageRemoteRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<ImageRemoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ImageRemoteRepository create(Ref ref) {
    return imageRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageRemoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageRemoteRepository>(value),
    );
  }
}

String _$imageRemoteRepositoryHash() =>
    r'a8c5c5cc16645abd31e7d83edf890eafbd9325e0';
