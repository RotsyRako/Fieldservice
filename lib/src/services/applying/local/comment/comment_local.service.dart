import 'package:field_service/src/models/dto/comment/comment_dto.dart';
import 'package:field_service/src/models/factory/comment/comment.factory.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/comment/comment_local.repository.dart';
import 'package:field_service/src/services/applying/local/base_local.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_local.service.g.dart';

/// Service local pour la gestion des commentaires
/// 
/// Fournit les opérations CRUD au niveau service avec conversion entre DTOs et DOs.
class CommentLocalService extends BaseLocalService<
    $CommentsTable,
    Comment,
    CommentDto,
    CommentsCompanion,
    CommentFactory,
    CommentLocalRepository> {
  
  CommentLocalService({
    required CommentFactory factory,
    required CommentLocalRepository repository,
  }) {
    initialize(
      factory: factory,
      repository: repository,
    );
  }

  /// Récupère tous les commentaires pour une intervention donnée
  Future<List<CommentDto>> findByInterventionId(String idIntervention) async {
    final results = await repository.getByInterventionId(idIntervention);
    return factory.toDataTransfertObjects(results);
  }
}

/// Provider Riverpod pour le service local des commentaires
@Riverpod(keepAlive: true)
CommentLocalService commentLocalService(Ref ref) {
  final repository = ref.watch(commentLocalRepositoryProvider);
  final factory = CommentFactory.instance;
  return CommentLocalService(
    factory: factory,
    repository: repository,
  );
}

