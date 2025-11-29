// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_remote.sa.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(imageRemoteService)
const imageRemoteServiceProvider = ImageRemoteServiceProvider._();

final class ImageRemoteServiceProvider
    extends
        $FunctionalProvider<
          ImageRemoteService,
          ImageRemoteService,
          ImageRemoteService
        >
    with $Provider<ImageRemoteService> {
  const ImageRemoteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'imageRemoteServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$imageRemoteServiceHash();

  @$internal
  @override
  $ProviderElement<ImageRemoteService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ImageRemoteService create(Ref ref) {
    return imageRemoteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ImageRemoteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ImageRemoteService>(value),
    );
  }
}

String _$imageRemoteServiceHash() =>
    r'bf7eb8bf99b715ec66876eb8c2587e248486295c';
