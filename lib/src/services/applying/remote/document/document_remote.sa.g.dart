// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_remote.sa.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(documentRemoteService)
const documentRemoteServiceProvider = DocumentRemoteServiceProvider._();

final class DocumentRemoteServiceProvider
    extends
        $FunctionalProvider<
          DocumentRemoteService,
          DocumentRemoteService,
          DocumentRemoteService
        >
    with $Provider<DocumentRemoteService> {
  const DocumentRemoteServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'documentRemoteServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$documentRemoteServiceHash();

  @$internal
  @override
  $ProviderElement<DocumentRemoteService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DocumentRemoteService create(Ref ref) {
    return documentRemoteService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DocumentRemoteService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DocumentRemoteService>(value),
    );
  }
}

String _$documentRemoteServiceHash() =>
    r'1c639309e76ccfd54d71e7e279b62b1a16d9ae35';
