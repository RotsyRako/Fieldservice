// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_local.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le repository local des commentaires

@ProviderFor(commentLocalRepository)
const commentLocalRepositoryProvider = CommentLocalRepositoryProvider._();

/// Provider Riverpod pour le repository local des commentaires

final class CommentLocalRepositoryProvider
    extends
        $FunctionalProvider<
          CommentLocalRepository,
          CommentLocalRepository,
          CommentLocalRepository
        >
    with $Provider<CommentLocalRepository> {
  /// Provider Riverpod pour le repository local des commentaires
  const CommentLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentLocalRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<CommentLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentLocalRepository create(Ref ref) {
    return commentLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentLocalRepository>(value),
    );
  }
}

String _$commentLocalRepositoryHash() =>
    r'afcb516efb0de84f301c012725967a721c6840e4';
