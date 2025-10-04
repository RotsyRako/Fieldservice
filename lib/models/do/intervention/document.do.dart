import 'package:arkup_edoo/models/do/base.do.dart';
import 'package:arkup_edoo/models/do/intervention/intervention_table.do.dart';
import 'package:drift/drift.dart';

class DocumentDO extends BaseDO {
  TextColumn get name => text()();
  TextColumn get location => text()();

  BoolColumn get isSync => boolean().withDefault(const Constant(false)).nullable()();
  
  IntColumn get idIntervention => integer().references(InterventionDO, #localId)();
}
