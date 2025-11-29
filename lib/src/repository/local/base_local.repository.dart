import 'package:drift/drift.dart';
import 'package:field_service/src/repository/local/app_database.dart';

/// Classe de base générique pour tous les repositories locaux
/// 
/// Fournit les opérations CRUD de base pour toutes les tables de la base de données locale.
/// Chaque repository spécifique doit étendre cette classe et fournir la table correspondante.
abstract class BaseLocalRepository<T extends Table, D extends DataClass> {
  /// Base de données locale
  late final AppDatabase db;

  /// Table correspondant à ce repository
  TableInfo<T, D> get table;

  BaseLocalRepository(AppDatabase database) : db = database;

  /// Récupère tous les enregistrements de la table
  Future<List<D>> getAll() async {
    return await db.select(table).get();
  }

  /// Récupère un enregistrement par son ID local
  Future<D?> getOneByLocalId(int localId) async {
    final query = db.select(table)..where((tbl) => (tbl as dynamic).localId.equals(localId));
    return await query.getSingleOrNull();
  }

  /// Récupère un enregistrement par son ID serveur
  Future<D?> getOneByServerId(String serverId) async {
    final query = db.select(table)..where((tbl) => (tbl as dynamic).id.equals(serverId));
    return await query.getSingleOrNull();
  }

  /// Insère un nouvel enregistrement
  /// Retourne l'ID local généré
  Future<int> insertOne(Insertable<D> entity) async {
    return await db.into(table).insert(entity);
  }

  /// Met à jour un enregistrement existant
  /// Retourne true si la mise à jour a réussi
  Future<bool> updateOne(Insertable<D> entity) async {
    return await db.update(table).replace(entity);
  }

  /// Supprime un enregistrement par son ID local
  /// Retourne le nombre de lignes supprimées
  Future<int> deleteOne(int localId) async {
    return await (db.delete(table)..where((tbl) => (tbl as dynamic).localId.equals(localId))).go();
  }

  /// Supprime tous les enregistrements de la table
  /// Retourne le nombre de lignes supprimées
  Future<int> deleteAll() async {
    return await db.delete(table).go();
  }

  /// Compte le nombre total d'enregistrements
  Future<int> count() async {
    final result = await db.customSelect(
      'SELECT COUNT(*) as count FROM ${table.actualTableName}',
      readsFrom: {table},
    ).getSingle();
    return result.read<int>('count');
  }
}
