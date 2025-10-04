import 'package:arkup_edoo/models/do/intervention/photo_table.do.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../base_local.repo.dart';
import '../db.dart';

class PhotoLocalRepo extends BaseLocalRepo<PhotoDO, PhotoDOData> {
  @override
  TableInfo<PhotoDO, PhotoDOData> get table => db.photoDO;

  PhotoLocalRepo(Ref ref) {
    init(ref);
  }

  Future<List<PhotoDOData>> getByInterventionId(int id) async {
    return await (db.select(table)..where((t) => t.idIntervention.equals(id))).get();
  }

}
