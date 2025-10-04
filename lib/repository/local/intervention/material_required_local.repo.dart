import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/do/intervention/material_required.do.dart';
import '../base_local.repo.dart';
import '../db.dart';

class MaterialRequiredLocalRepo
    extends BaseLocalRepo<MaterialRequiredDO, MaterialRequiredDOData> {
  @override
  TableInfo<MaterialRequiredDO, MaterialRequiredDOData> get table =>
      db.materialRequiredDO;

  MaterialRequiredLocalRepo(Ref ref) {
    init(ref);
  }

  Future<List<MaterialRequiredDOData>> findByInterventionId(
    int interventionId,
  ) async {
    return (db.select(db.materialRequiredDO)
      ..where((tbl) => tbl.idIntervention.equals(interventionId))).get();
  }

  Future<int> deleteByInterventionId(int localInterventionId) async {
    return await (db.delete(table)..where(
      (tbl) => (tbl as dynamic).idIntervention.equals(localInterventionId),
    )).go();
  }
}
