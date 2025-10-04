import 'package:arkup_edoo/models/do/base.do.dart';
import 'package:drift/drift.dart';

import 'intervention_table.do.dart';

class MaterialRequiredDO extends BaseDO {
  TextColumn get name => text()();
  IntColumn get idIntervention => integer().references(InterventionDO, #localId)();
}