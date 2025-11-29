// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_remote.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(documentRemoteRepository)
const documentRemoteRepositoryProvider = DocumentRemoteRepositoryProvider._();

final class DocumentRemoteRepositoryProvider
    extends
        $FunctionalProvider<
          DocumentRemoteRepository,
          DocumentRemoteRepository,
          DocumentRemoteRepository
        >
    with $Provider<DocumentRemoteRepository> {
  const DocumentRemoteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentRemoteRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentRemoteRepositoryHash();

  @$internal
  @override
  $ProviderElement<DocumentRemoteRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DocumentRemoteRepository create(Ref ref) {
    return documentRemoteRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentRemoteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentRemoteRepository>(value),
    );
  }
}

String _$documentRemoteRepositoryHash() =>
    r'9f9d7dcd8cce3e22b2b5e120f0bc0638fd90b851';
