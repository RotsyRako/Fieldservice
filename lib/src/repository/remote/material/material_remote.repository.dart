import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/models/constants/urls.dart';
import 'package:field_service/src/models/dto/material/material_list_response.dto.dart';
import 'package:field_service/src/repository/remote/base_remote.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_remote.repository.g.dart';

/// Repository pour la récupération distante des matériaux.
class MaterialRemoteRepository {
  MaterialRemoteRepository({
    required this.baseRemoteRepository,
  });

  final BaseRemoteRepository baseRemoteRepository;

  /// Récupère la liste des matériaux pour une intervention.
  ///
  /// [idIntervention] : ID de l'intervention pour laquelle récupérer les matériaux.
  Future<MaterialListResponseDto> fetchMaterialsByIntervention({
    required String idIntervention,
  }) async {
    final response = await baseRemoteRepository.get(
      Urls.urls.materialsByIntervention(idIntervention),
    );

    if (response is Map<String, dynamic>) {
      final success = response['success'];
      if (success is bool && !success) {
        throw RemoteException(
          remoteMessage:
              response['message'] as String? ??
                  'Impossible de récupérer les matériaux',
        );
      }

      return MaterialListResponseDto.fromJson(response);
    }

    throw RemoteException(
      remoteMessage: 'Réponse inattendue du serveur lors de la récupération des matériaux',
    );
  }
}

@Riverpod(keepAlive: true)
MaterialRemoteRepository materialRemoteRepository(Ref ref) {
  final baseRemoteRepo = ref.watch(baseRemoteRepositoryProvider);
  return MaterialRemoteRepository(
    baseRemoteRepository: baseRemoteRepo,
  );
}

