import 'package:drift/drift.dart';
import 'package:arkup_edoo/models/do/base.do.dart';

class CommentairePjDO extends BaseDO {
  TextColumn get name => text()();
  TextColumn get location => text()();
}
