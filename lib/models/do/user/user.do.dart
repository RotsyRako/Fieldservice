import 'package:arkup_edoo/models/do/base.do.dart';
import 'package:drift/drift.dart';

/// Table User qui hérite des champs communs via la classe abstraite
class UserDO extends BaseDO {
  TextColumn get email => text()();
  TextColumn get password => text()();
  TextColumn get name => text()();
  TextColumn get token => text()();
}
