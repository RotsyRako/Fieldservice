// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_local.repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le repository local des documents

@ProviderFor(documentLocalRepository)
const documentLocalRepositoryProvider = DocumentLocalRepositoryProvider._();

/// Provider Riverpod pour le repository local des documents

final class DocumentLocalRepositoryProvider
    extends
        $FunctionalProvider<
          DocumentLocalRepository,
          DocumentLocalRepository,
          DocumentLocalRepository
        >
    with $Provider<DocumentLocalRepository> {
  /// Provider Riverpod pour le repository local des documents
  const DocumentLocalRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentLocalRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentLocalRepositoryHash();

  @$internal
  @override
  $ProviderElement<DocumentLocalRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DocumentLocalRepository create(Ref ref) {
    return documentLocalRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentLocalRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentLocalRepository>(value),
    );
  }
}

String _$documentLocalRepositoryHash() =>
    r'e3ff13024f32e47223e41a913bf6db497ecc40ca';
