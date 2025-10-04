import 'package:arkup_edoo/models/do/intervention/intervention_table.do.dart';
import 'package:drift/drift.dart';
import 'package:arkup_edoo/models/do/base.do.dart';

class CommentaireDO extends BaseDO {
  TextColumn get user => text()();

  TextColumn get comment => text()();

  DateTimeColumn get date => dateTime()();

  IntColumn get idIntervention => integer().references(InterventionDO, #localId)();

  TextColumn get pj => text().nullable()();

}
