import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/models/constants/urls.dart';
import 'package:field_service/src/models/dto/scan/scan_image_response.dto.dart';
import 'package:field_service/src/repository/remote/base_remote.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_remote.repository.g.dart';

/// Repository pour la reconnaissance d'images distante.
class ScanRemoteRepository {
  ScanRemoteRepository({
    required this.baseRemoteRepository,
  });

  final BaseRemoteRepository baseRemoteRepository;

  /// Envoie une image pour reconnaissance.
  ///
  /// [filePath] : Chemin du fichier image à envoyer.
  Future<ScanImageResponseDto> recognizeImage({
    required String filePath,
  }) async {
    final response = await baseRemoteRepository.postMultipart(
      Urls.urls.recognizeImageUpload,
      filePath: filePath,
      fileFieldName: 'file',
    );

    if (response is Map<String, dynamic>) {
      final success = response['success'];
      if (success is bool && !success) {
        throw RemoteException(
          remoteMessage:
              response['message'] as String? ??
                  'Impossible de reconnaître l\'image',
        );
      }

      return ScanImageResponseDto.fromJson(response);
    }

    throw RemoteException(
      remoteMessage: 'Réponse inattendue du serveur lors de la reconnaissance d\'image',
    );
  }
}

@Riverpod(keepAlive: true)
ScanRemoteRepository scanRemoteRepository(Ref ref) {
  final baseRemoteRepo = ref.watch(baseRemoteRepositoryProvider);
  return ScanRemoteRepository(
    baseRemoteRepository: baseRemoteRepo,
  );
}

