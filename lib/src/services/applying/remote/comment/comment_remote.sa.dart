import 'dart:async';

import 'package:field_service/src/models/dto/comment/comment_dto.dart';
import 'package:field_service/src/models/dto/comment/comment_list_response.dto.dart';
import 'package:field_service/src/repository/remote/comment/comment_remote.repository.dart';
import 'package:field_service/src/services/applying/remote/base_remote.sa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_remote.sa.g.dart';

class CommentRemoteService extends BaseRemoteService {
  CommentRemoteService({
    required CommentRemoteRepository commentRemoteRepository,
  })  : _commentRemoteRepository = commentRemoteRepository,
        super(
          baseRemoteRepository:
              commentRemoteRepository.baseRemoteRepository,
        );

  final CommentRemoteRepository _commentRemoteRepository;

  Future<List<CommentDto>> fetchCommentsByIntervention({
    required String idIntervention,
    LoadingCallback? loading,
    OnSuccessCallback<List<CommentDto>>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    final completer = Completer<List<CommentDto>>();

    await executeOperation<CommentListResponseDto>(
      operation: () async => _commentRemoteRepository.fetchCommentsByIntervention(
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
          completer.complete(const <CommentDto>[]);
        }
        onFailure?.call(message);
      },
      defaultErrorMessage: defaultErrorMessage,
    );

    if (!completer.isCompleted) {
      completer.complete(const <CommentDto>[]);
    }

    return completer.future;
  }
}

@Riverpod(keepAlive: true)
CommentRemoteService commentRemoteService(Ref ref) {
  final repository = ref.watch(commentRemoteRepositoryProvider);
  return CommentRemoteService(
    commentRemoteRepository: repository,
  );
}

