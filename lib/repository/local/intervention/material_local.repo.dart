import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/do/intervention/material.do.dart';
import '../base_local.repo.dart';
import '../db.dart';

class MaterialLocalRepo extends BaseLocalRepo<MaterialDO, MaterialDOData> {
  Future<List<MaterialDOData>> findByInterventionId(int interventionId) async {
    return (db.select(db.materialDO)..where((tbl) => tbl.idIntervention.equals(interventionId))).get();
  }

  @override
  TableInfo<MaterialDO, MaterialDOData> get table => db.materialDO;

  MaterialLocalRepo(Ref ref) {
    init(ref);
  }
}