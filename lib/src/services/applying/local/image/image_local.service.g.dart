// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_local.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le service local des images

@ProviderFor(imageLocalService)
const imageLocalServiceProvider = ImageLocalServiceProvider._();

/// Provider Riverpod pour le service local des images

final class ImageLocalServiceProvider
    extends
        $FunctionalProvider<
          ImageLocalService,
          ImageLocalService,
          ImageLocalService
        >
    with $Provider<ImageLocalService> {
  /// Provider Riverpod pour le service local des images
  const ImageLocalServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageLocalServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageLocalServiceHash();

  @$internal
  @override
  $ProviderElement<ImageLocalService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ImageLocalService create(Ref ref) {
    return imageLocalService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageLocalService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageLocalService>(value),
    );
  }
}

String _$imageLocalServiceHash() => r'59385c3bf3ac89305a758a2a7e6f0c59183299bb';
