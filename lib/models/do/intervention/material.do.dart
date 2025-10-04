import 'package:arkup_edoo/models/do/base.do.dart';
import 'package:drift/drift.dart';

import 'intervention_table.do.dart';

class MaterialDO extends BaseDO {
  TextColumn get name => text()();
  RealColumn get quantity => real()();
  
  IntColumn get idIntervention => integer().references(InterventionDO, #localId)();
}