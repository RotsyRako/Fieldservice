import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/models/constants/urls.dart';
import 'package:field_service/src/models/dto/signature/signature_list_response.dto.dart';
import 'package:field_service/src/repository/remote/base_remote.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signature_remote.repository.g.dart';

/// Repository pour la récupération distante des signatures.
class SignatureRemoteRepository {
  SignatureRemoteRepository({
    required this.baseRemoteRepository,
  });

  final BaseRemoteRepository baseRemoteRepository;

  /// Récupère la liste des signatures pour une intervention.
  ///
  /// [idIntervention] : ID de l'intervention pour laquelle récupérer les signatures.
  Future<SignatureListResponseDto> fetchSignaturesByIntervention({
    required String idIntervention,
  }) async {
    final response = await baseRemoteRepository.get(
      Urls.urls.signaturesByIntervention(idIntervention),
    );

    if (response is Map<String, dynamic>) {
      final success = response['success'];
      if (success is bool && !success) {
        throw RemoteException(
          remoteMessage:
              response['message'] as String? ??
                  'Impossible de récupérer les signatures',
        );
      }

      return SignatureListResponseDto.fromJson(response);
    }

    throw RemoteException(
      remoteMessage: 'Réponse inattendue du serveur lors de la récupération des signatures',
    );
  }
}

@Riverpod(keepAlive: true)
SignatureRemoteRepository signatureRemoteRepository(Ref ref) {
  final baseRemoteRepo = ref.watch(baseRemoteRepositoryProvider);
  return SignatureRemoteRepository(
    baseRemoteRepository: baseRemoteRepo,
  );
}

