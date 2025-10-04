import 'package:drift/drift.dart';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseLocalRepo<T extends Table, D extends DataClass> {
  late final AppDatabase db;

  BaseLocalRepo();

  void init(Ref ref) {
    db = ref.read(appDatabaseProvider);
  }

  TableInfo<T, D> get table;

  Future<List<D>> getAll() async {
    return await db.select(table).get();
  }

  Future<D?> getOneById(int id) async {
    final query = db.select(table)
      ..where((tbl) => (tbl as dynamic).localId.equals(id));
    return await query.getSingleOrNull();
  }

  Future<D?> getOneByServerId(int serverId) async {
    return (db.select(table)
      ..where((tbl) => (tbl as dynamic).id.equals(serverId))).getSingleOrNull();
  }

  Future<int> insertOne(Insertable<D> entity) async {
    return await db.into(table).insert(entity);
  }

  Future<bool> updateOne(Insertable<D> entity) async {
    final result = await db.update(table).replace(entity);
    return result;
  }

  Future<int> deleteOne(int id) async {
    return await (db.delete(table)
      ..where((tbl) => (tbl as dynamic).localId.equals(id))).go();
  }
}
