// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_local.service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider Riverpod pour le service local des documents

@ProviderFor(documentLocalService)
const documentLocalServiceProvider = DocumentLocalServiceProvider._();

/// Provider Riverpod pour le service local des documents

final class DocumentLocalServiceProvider
    extends
        $FunctionalProvider<
          DocumentLocalService,
          DocumentLocalService,
          DocumentLocalService
        >
    with $Provider<DocumentLocalService> {
  /// Provider Riverpod pour le service local des documents
  const DocumentLocalServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentLocalServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentLocalServiceHash();

  @$internal
  @override
  $ProviderElement<DocumentLocalService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DocumentLocalService create(Ref ref) {
    return documentLocalService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentLocalService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentLocalService>(value),
    );
  }
}

String _$documentLocalServiceHash() =>
    r'4f6a3c690a14b872e8bbcf724c77a6705bc7c941';
