import 'package:arkup_edoo/models/do/intervention/commentaire.do.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../base_local.repo.dart';
import '../db.dart';

class CommentLocalRepo extends BaseLocalRepo<CommentaireDO, CommentaireDOData> {
  @override
  TableInfo<CommentaireDO, CommentaireDOData> get table => db.commentaireDO;

  CommentLocalRepo(Ref ref) {
    init(ref);
  }

  Future<List<CommentaireDOData>> getByInterventionId(int id) async {
    return await (db.select(table)..where((t) => t.idIntervention.equals(id))).get();
  }

}
