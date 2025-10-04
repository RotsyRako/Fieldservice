import 'package:arkup_edoo/models/do/user/user.do.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:arkup_edoo/repository/local/base_local.repo.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserLocalRepo extends BaseLocalRepo<UserDO, UserDOData> {
  @override
  TableInfo<UserDO, UserDOData> get table => db.userDO;

  UserLocalRepo(Ref ref) {
    init(ref); // initialisation de db
  }

  Future<UserDOData?> getOneByEmail(String email) async {
    return await (db.select(table)..where((t) => t.email.equals(email))).getSingleOrNull();
  }
}
