import 'package:arkup_edoo/models/do/intervention/document.do.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../base_local.repo.dart';
import '../db.dart';

class DocumentLocalRepo extends BaseLocalRepo<DocumentDO, DocumentDOData> {
  @override
  TableInfo<DocumentDO, DocumentDOData> get table => db.documentDO;

  DocumentLocalRepo(Ref ref) {
    init(ref);
  }

  Future<List<DocumentDOData>> getByInterventionId(int id) async {
    return await (db.select(table)..where((t) => t.idIntervention.equals(id))).get();
  }

}
