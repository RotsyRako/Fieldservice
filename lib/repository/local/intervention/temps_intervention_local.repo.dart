import 'package:arkup_edoo/models/do/intervention/temps_intervetion.do.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../base_local.repo.dart';
import '../db.dart';

class TempsInterventionLocalRepo extends BaseLocalRepo<TempsInterventionDO, TempsInterventionDOData> {
  @override
  TableInfo<TempsInterventionDO, TempsInterventionDOData> get table => db.tempsInterventionDO;

  TempsInterventionLocalRepo(Ref ref) {
    init(ref);
  }

  Future<List<TempsInterventionDOData>> getByInterventionId(int id) async {
    return await (db.select(table)..where((t) => t.idIntervention.equals(id))).get();
  }
}
