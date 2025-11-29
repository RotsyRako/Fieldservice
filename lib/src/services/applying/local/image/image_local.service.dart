import 'package:field_service/src/models/dto/image/image_dto.dart';
import 'package:field_service/src/models/factory/image/image.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/image/image_local.repository.dart';
import 'package:field_service/src/services/applying/local/base_local.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_local.service.g.dart';

/// Service local pour la gestion des images
/// 
/// Fournit les opérations CRUD au niveau service avec conversion entre DTOs et DOs.
class ImageLocalService extends BaseLocalService<
    $ImagesTable,
    Image,
    ImageDto,
    ImagesCompanion,
    ImageFactory,
    ImageLocalRepository> {
  
  ImageLocalService({
    required ImageFactory factory,
    required ImageLocalRepository repository,
  }) {
    initialize(
      factory: factory,
      repository: repository,
    );
  }

  /// Récupère toutes les images pour une intervention donnée
  Future<List<ImageDto>> findByInterventionId(String idIntervention) async {
    final results = await repository.getByInterventionId(idIntervention);
    return factory.toDataTransfertObjects(results);
  }
}

/// Provider Riverpod pour le service local des images
@Riverpod(keepAlive: true)
ImageLocalService imageLocalService(Ref ref) {
  final repository = ref.watch(imageLocalRepositoryProvider);
  final factory = ImageFactory.instance;
  return ImageLocalService(
    factory: factory,
    repository: repository,
  );
}

