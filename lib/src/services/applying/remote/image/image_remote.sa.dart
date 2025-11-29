import 'dart:async';

import 'package:field_service/src/models/dto/image/image_dto.dart';
import 'package:field_service/src/models/dto/image/image_list_response.dto.dart';
import 'package:field_service/src/repository/remote/image/image_remote.repository.dart';
import 'package:field_service/src/services/applying/remote/base_remote.sa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_remote.sa.g.dart';

class ImageRemoteService extends BaseRemoteService {
  ImageRemoteService({
    required ImageRemoteRepository imageRemoteRepository,
  })  : _imageRemoteRepository = imageRemoteRepository,
        super(
          baseRemoteRepository:
              imageRemoteRepository.baseRemoteRepository,
        );

  final ImageRemoteRepository _imageRemoteRepository;

  Future<List<ImageDto>> fetchImagesByIntervention({
    required String idIntervention,
    LoadingCallback? loading,
    OnSuccessCallback<List<ImageDto>>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    final completer = Completer<List<ImageDto>>();

    await executeOperation<ImageListResponseDto>(
      operation: () async => _imageRemoteRepository.fetchImagesByIntervention(
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
          completer.complete(const <ImageDto>[]);
        }
        onFailure?.call(message);
      },
      defaultErrorMessage: defaultErrorMessage,
    );

    if (!completer.isCompleted) {
      completer.complete(const <ImageDto>[]);
    }

    return completer.future;
  }
}

@Riverpod(keepAlive: true)
ImageRemoteService imageRemoteService(Ref ref) {
  final repository = ref.watch(imageRemoteRepositoryProvider);
  return ImageRemoteService(
    imageRemoteRepository: repository,
  );
}

