import 'package:drift/drift.dart';

mixin HasId on Table {
  IntColumn get localId;
  IntColumn get id;
}

abstract class BaseDO extends Table with HasId {
  @override
  IntColumn get localId => integer().autoIncrement()();

  @override
  IntColumn get id => integer().nullable()();
}