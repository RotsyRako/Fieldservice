import 'package:arkup_edoo/models/do/intervention/commentaire.do.dart';
import 'package:arkup_edoo/models/dto/intervention/commentaire.dto.dart';
import 'package:arkup_edoo/models/factory/intervention/commentaire.factory.dart';
import 'package:arkup_edoo/repository/local/intervention/comment_local.repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../repository/local/db.dart';
import '../base_local.sa.dart';

final commentLocalSAProvider = Provider<CommentLocalSA>((ref) {
  return CommentLocalSA(ref);
});

class CommentLocalSA extends BaseLocalSA<
    CommentaireDO,
    CommentaireDOData,
    CommentaireDTO,
    CommentaireDOCompanion,
    CommentaireFactory,
    CommentLocalRepo
> {
  CommentLocalSA(Ref ref) {
    initialize(
      factory: CommentaireFactory(),
      repository: CommentLocalRepo(ref),
    );
  }

  Future<List<CommentaireDTO>> findByInterventionId(int id) async {
    final result = await repository.getByInterventionId(id);
    return result.map((e) => factory.toDataTransfertObject(e)).toList();
  }
}
