import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/models/constants/urls.dart';
import 'package:field_service/src/models/dto/image/image_list_response.dto.dart';
import 'package:field_service/src/repository/remote/base_remote.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_remote.repository.g.dart';

/// Repository pour la récupération distante des images.
class ImageRemoteRepository {
  ImageRemoteRepository({
    required this.baseRemoteRepository,
  });

  final BaseRemoteRepository baseRemoteRepository;

  /// Récupère la liste des images pour une intervention.
  ///
  /// [idIntervention] : ID de l'intervention pour laquelle récupérer les images.
  Future<ImageListResponseDto> fetchImagesByIntervention({
    required String idIntervention,
  }) async {
    final response = await baseRemoteRepository.get(
      Urls.urls.imagesByIntervention(idIntervention),
    );

    if (response is Map<String, dynamic>) {
      final success = response['success'];
      if (success is bool && !success) {
        throw RemoteException(
          remoteMessage:
              response['message'] as String? ??
                  'Impossible de récupérer les images',
        );
      }

      return ImageListResponseDto.fromJson(response);
    }

    throw RemoteException(
      remoteMessage: 'Réponse inattendue du serveur lors de la récupération des images',
    );
  }
}

@Riverpod(keepAlive: true)
ImageRemoteRepository imageRemoteRepository(Ref ref) {
  final baseRemoteRepo = ref.watch(baseRemoteRepositoryProvider);
  return ImageRemoteRepository(
    baseRemoteRepository: baseRemoteRepo,
  );
}

