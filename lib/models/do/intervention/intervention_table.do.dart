import 'package:arkup_edoo/models/constant/timer_status.enum.dart';
import 'package:arkup_edoo/models/do/base.do.dart';
import 'package:drift/drift.dart';

/// Table User qui hérite des champs communs via la classe abstraite
class InterventionDO extends BaseDO{
  TextColumn get title => text()();
  TextColumn get dateStart => text().nullable()(); // ou DateTime si parsé
  TextColumn get dateEnd => text().nullable()();
  IntColumn get status => integer()();
  TextColumn get priority => text()();
  TextColumn get description => text()();
  TextColumn get customer => text()();
  RealColumn get long => real()();
  RealColumn get lat => real()();
  TextColumn get address => text()();
  TextColumn get telephone => text().nullable()();
  RealColumn get distance => real()();
  TextColumn get signature => text().nullable()();
  BoolColumn get isSync => boolean().withDefault(const Constant(false)).nullable()();

  IntColumn get timerStatus => intEnum<TimerStatus>().withDefault(const Constant(0)).nullable()();
  IntColumn get elapsedSeconds => integer().withDefault(const Constant(0)).nullable()();

}