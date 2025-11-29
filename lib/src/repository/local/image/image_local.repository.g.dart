// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_local.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le repository local des images

@ProviderFor(imageLocalRepository)
const imageLocalRepositoryProvider = ImageLocalRepositoryProvider._();

/// Provider Riverpod pour le repository local des images

final class ImageLocalRepositoryProvider
    extends
        $FunctionalProvider<
          ImageLocalRepository,
          ImageLocalRepository,
          ImageLocalRepository
        >
    with $Provider<ImageLocalRepository> {
  /// Provider Riverpod pour le repository local des images
  const ImageLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageLocalRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<ImageLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ImageLocalRepository create(Ref ref) {
    return imageLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageLocalRepository>(value),
    );
  }
}

String _$imageLocalRepositoryHash() =>
    r'e43ee2f5a3cab6433ef029cee4af5bd3d3e7b6bf';
