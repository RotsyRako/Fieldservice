import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/do/intervention/intervention_table.do.dart';
import '../base_local.repo.dart';
import '../db.dart';

class InterventionLocalRepo extends BaseLocalRepo<InterventionDO, InterventionDOData> {
  Future<InterventionDOData?> findRunningOrPausedIntervention() async {
    final query = db.select(table)
      ..where((tbl) =>
          tbl.timerStatus.equals(1) | tbl.timerStatus.equals(2));
    return await query.getSingleOrNull();
  }

  @override
  TableInfo<InterventionDO, InterventionDOData> get table => db.interventionDO;

  InterventionLocalRepo(Ref ref) {
    init(ref);
  }

}
