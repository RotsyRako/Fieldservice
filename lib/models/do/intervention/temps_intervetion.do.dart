import 'package:arkup_edoo/models/do/base.do.dart';
import 'package:arkup_edoo/models/do/intervention/intervention_table.do.dart';
import 'package:drift/drift.dart';

class TempsInterventionDO extends BaseDO {
  TextColumn get date => text()(); 
  TextColumn get temps => text()();
  TextColumn get description => text()();

  IntColumn get idIntervention => integer().references(InterventionDO, #localId)();
}
