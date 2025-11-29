import 'dart:async';

import 'package:field_service/src/models/dto/document/document_dto.dart';
import 'package:field_service/src/models/dto/document/document_list_response.dto.dart';
import 'package:field_service/src/repository/remote/document/document_remote.repository.dart';
import 'package:field_service/src/services/applying/remote/base_remote.sa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'document_remote.sa.g.dart';

class DocumentRemoteService extends BaseRemoteService {
  DocumentRemoteService({
    required DocumentRemoteRepository documentRemoteRepository,
  })  : _documentRemoteRepository = documentRemoteRepository,
        super(
          baseRemoteRepository:
              documentRemoteRepository.baseRemoteRepository,
        );

  final DocumentRemoteRepository _documentRemoteRepository;

  Future<List<DocumentDto>> fetchDocumentsByIntervention({
    required String idIntervention,
    LoadingCallback? loading,
    OnSuccessCallback<List<DocumentDto>>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    final completer = Completer<List<DocumentDto>>();

    await executeOperation<DocumentListResponseDto>(
      operation: () async => _documentRemoteRepository.fetchDocumentsByIntervention(
        idIntervention: idIntervention,
      ),
      loading: loading,
      onSuccess: (response) {
        final data = response.data;
        if (!completer.isCompleted) {
          completer.complete(data);
        }
        onSuccess?.call(data);
      },
      onFailure: (message) {
        if (!completer.isCompleted) {
          completer.complete(const <DocumentDto>[]);
        }
        onFailure?.call(message);
      },
      defaultErrorMessage: defaultErrorMessage,
    );

    if (!completer.isCompleted) {
      completer.complete(const <DocumentDto>[]);
    }

    return completer.future;
  }
}

@Riverpod(keepAlive: true)
DocumentRemoteService documentRemoteService(Ref ref) {
  final repository = ref.watch(documentRemoteRepositoryProvider);
  return DocumentRemoteService(
    documentRemoteRepository: repository,
  );
}

