// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_remote.sa.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(commentRemoteService)
const commentRemoteServiceProvider = CommentRemoteServiceProvider._();

final class CommentRemoteServiceProvider
    extends
        $FunctionalProvider<
          CommentRemoteService,
          CommentRemoteService,
          CommentRemoteService
        >
    with $Provider<CommentRemoteService> {
  const CommentRemoteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentRemoteServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentRemoteServiceHash();

  @$internal
  @override
  $ProviderElement<CommentRemoteService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentRemoteService create(Ref ref) {
    return commentRemoteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentRemoteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentRemoteService>(value),
    );
  }
}

String _$commentRemoteServiceHash() =>
    r'25c280e08d4d5aebc1911f6ac09dd99140a969aa';
