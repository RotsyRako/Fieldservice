import 'package:arkup_edoo/models/do/base.do.dart';
import 'package:drift/drift.dart';

class MaterialAvailableDO extends BaseDO {
  TextColumn get name => text()();
  RealColumn get quantity => real()();
}