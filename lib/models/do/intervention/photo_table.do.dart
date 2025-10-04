import 'package:arkup_edoo/models/do/base.do.dart';
import 'package:arkup_edoo/models/do/intervention/intervention_table.do.dart';
import 'package:drift/drift.dart';

class PhotoDO extends BaseDO {
  TextColumn get name => text()();
  TextColumn get location => text()();
  
  IntColumn get idIntervention => integer().references(InterventionDO, #localId)();
}
