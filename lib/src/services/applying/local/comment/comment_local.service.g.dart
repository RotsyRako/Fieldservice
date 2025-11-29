// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_local.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le service local des commentaires

@ProviderFor(commentLocalService)
const commentLocalServiceProvider = CommentLocalServiceProvider._();

/// Provider Riverpod pour le service local des commentaires

final class CommentLocalServiceProvider
    extends
        $FunctionalProvider<
          CommentLocalService,
          CommentLocalService,
          CommentLocalService
        >
    with $Provider<CommentLocalService> {
  /// Provider Riverpod pour le service local des commentaires
  const CommentLocalServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentLocalServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentLocalServiceHash();

  @$internal
  @override
  $ProviderElement<CommentLocalService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentLocalService create(Ref ref) {
    return commentLocalService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentLocalService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentLocalService>(value),
    );
  }
}

String _$commentLocalServiceHash() =>
    r'd42f987ab21934257b4311a2bb9479ac283928fc';
