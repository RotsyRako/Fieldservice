import 'package:field_service/src/models/dto/scan/scan_image_response.dto.dart';
import 'package:field_service/src/repository/remote/scan/scan_remote.repository.dart';
import 'package:field_service/src/services/applying/remote/base_remote.sa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scan_remote.sa.g.dart';

class ScanRemoteService extends BaseRemoteService {
  ScanRemoteService({
    required ScanRemoteRepository scanRemoteRepository,
  })  : _scanRemoteRepository = scanRemoteRepository,
        super(
          baseRemoteRepository:
              scanRemoteRepository.baseRemoteRepository,
        );

  final ScanRemoteRepository _scanRemoteRepository;

  /// Reconnaît un matériau depuis une image
  /// 
  /// [filePath] : Le chemin du fichier image
  /// [loading] : Callback pour gérer l'état de chargement
  /// [onSuccess] : Callback appelé en cas de succès
  /// [onFailure] : Callback appelé en cas d'échec
  /// [defaultErrorMessage] : Message d'erreur par défaut
  Future<ScanImageResponseDto?> recognizeImage({
    required String filePath,
    LoadingCallback? loading,
    OnSuccessCallback<ScanImageResponseDto>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    return await executeOperationSafe<ScanImageResponseDto>(
      operation: () async => _scanRemoteRepository.recognizeImage(
        filePath: filePath,
      ),
    );
  }
}

@Riverpod(keepAlive: true)
ScanRemoteService scanRemoteService(Ref ref) {
  final repository = ref.watch(scanRemoteRepositoryProvider);
  return ScanRemoteService(
    scanRemoteRepository: repository,
  );
}

