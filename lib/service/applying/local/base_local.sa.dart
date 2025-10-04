import 'package:arkup_edoo/common/utils/app.utils.dart';
import 'package:drift/drift.dart';
import 'package:arkup_edoo/models/factory/base.factory.dart';
import 'package:arkup_edoo/repository/local/base_local.repo.dart';

// typedef CompletionClosure<T> = void Function(T result);

class BaseLocalSA<
  Do extends Table,
  DoData extends DataClass,
  Dto,
  Companion extends Insertable<DoData>,
  Factory extends BaseFactory<DoData, Dto, Companion>,
  Repository extends BaseLocalRepo<Do, DoData>
> {
  late Factory factory;
  late Repository repository;

  void initialize({
    required Factory factory,
    required Repository repository,
  }) {
    this.factory = factory;
    this.repository = repository;
  }

  Future<void> insertOrUpdate({
    required Dto data,
    CompletionClosure<bool>? completion,
    CompletionClosure<int>? dataId,
  }) async {
    try {
      final int? id = (data as dynamic).localId;
      DoData? existing;

      if (id != null) {
        existing = await repository.getOneById(id);
      }

      final includeId = existing != null;
      final companion = factory.toCompanion(data, includeId: includeId);

      if (existing == null) {
        final insertId = await repository.insertOne(companion);
        completion?.call(insertId > 0);
        dataId?.call(insertId);
      } else {
        final updated = await repository.updateOne(companion);
        completion?.call(updated);
        dataId?.call((existing as dynamic).id);
      }
    } catch (e, stack) {
      print("❌ insertOrUpdate Error: $e");
      print(stack);
      completion?.call(false);
      dataId?.call(-1);
    }
  }

Future<void> insertOrUpdateByServerId({
  required Dto data,
  CompletionClosure<bool>? completion,
  CompletionClosure<int>? dataId,
}) async {
  try {
    final int? serverId = (data as dynamic).id;

    if (serverId == null) {
      print("❌ insertOrUpdateByServerId: ID manquant");
      completion?.call(false);
      dataId?.call(-1);
      return;
    }

    // 🔍 Cherche si on a déjà une donnée avec ce serverId
    DoData? existing = await repository.getOneByServerId(serverId);

    if (existing == null) {
      // ✅ Insert
      var companion = factory.toCompanion(data, includeId: false);

      print("companion insert ===== > ${companion.toString()}");

      final insertId = await repository.insertOne(companion);
      completion?.call(insertId > 0);
      dataId?.call(insertId);
    } else {
      // ✅ Update
      // 🔑 On met à jour le DTO avec le localId de la donnée existante
      data = (data as dynamic).copyWith(localId: (existing as dynamic).localId);

      print("data ===== > ${data.toString()}");

      // Maintenant on peut créer le Companion avec includeId = true
      var companion = factory.toCompanion(data, includeId: true);

      print("companion update ===== > ${companion.toString()}");

      final updated = await repository.updateOne(companion);
      completion?.call(updated);
      dataId?.call((existing as dynamic).localId);
    }
  } catch (e, stack) {
    print("❌ insertOrUpdateByServerId Error: $e");
    print(stack);
    completion?.call(false);
    dataId?.call(-1);
  }
}



  // ✅ Insert uniquement
  Future<void> insertOnly({
    required Dto data,
    CompletionClosure<bool>? completion,
    CompletionClosure<int>? dataId,
  }) async {
    try {
      final companion = factory.toCompanion(data, includeId: false);
      final insertId = await repository.insertOne(companion);
      completion?.call(insertId > 0);
      dataId?.call(insertId);
    } catch (e, stack) {
      print("❌ insertOnly Error: $e");
      print(stack);
      completion?.call(false);
      dataId?.call(-1);
    }
  }

  // ✅ Update uniquement
  Future<void> updateOnly({
    required Dto data,
    CompletionClosure<bool>? completion,
    CompletionClosure<int>? dataId,
  }) async {
    try {
      final int? id = (data as dynamic).localId;
      if (id == null) {
        print("❌ updateOnly: ID manquant");
        completion?.call(false);
        dataId?.call(-1);
        return;
      }

      final existing = await repository.getOneById(id);
      if (existing == null) {
        print("❌ updateOnly: Donnée non trouvée pour l'ID $id");
        completion?.call(false);
        dataId?.call(-1);
        return;
      }

      final companion = factory.toCompanion(data, includeId: true);
      final updated = await repository.updateOne(companion);
      completion?.call(updated);
      dataId?.call(id);
    } catch (e, stack) {
      print("❌ updateOnly Error: $e");
      print(stack);
      completion?.call(false);
      dataId?.call(-1);
    }
  }

  Future<List<Dto>> findAll() async {
    final results = await repository.getAll();
    return factory.toDataTransfertObjects(results);
  }

  Future<Dto?> findById(int id) async {
    final result = await repository.getOneById(id);
    return result != null ? factory.toDataTransfertObject(result) : null;
  }

  Future<bool> delete(int id) async {
    final result = await repository.deleteOne(id);
    return result > 0;
  }
}
