import 'package:drift/drift.dart';
import 'package:field_service/src/models/factory/base.factory.dart';
import 'package:field_service/src/repository/local/base_local.repository.dart';

/// Classe de base générique pour tous les services locaux
/// 
/// Cette classe fournit une couche d'abstraction entre les DTOs et les repositories.
/// Chaque service spécifique doit étendre cette classe et initialiser la factory et le repository.
abstract class BaseLocalService<
  Do extends Table,
  DoData extends DataClass,
  Dto,
  Companion extends Insertable<DoData>,
  Factory extends BaseFactory<DoData, Dto, Companion>,
  Repository extends BaseLocalRepository<Do, DoData>
> {
  late Factory factory;
  late Repository repository;

  /// Initialise la factory et le repository
  void initialize({
    required Factory factory,
    required Repository repository,
  }) {
    this.factory = factory;
    this.repository = repository;
  }

  /// Insère ou met à jour un enregistrement selon la présence du localId
  /// 
  /// - Si localId est présent : met à jour l'enregistrement existant
  /// - Sinon : insère un nouvel enregistrement
  /// 
  /// Retourne l'ID local (soit celui existant, soit le nouveau)
  Future<int> insertOrUpdate(Dto dto) async {
    final int? localId = (dto as dynamic).localId;
    DoData? existing;

    if (localId != null) {
      existing = await repository.getOneByLocalId(localId);
    }

    final includeId = existing != null;
    final companion = factory.toCompanion(dto, includeId: includeId);

    if (existing == null) {
      final insertId = await repository.insertOne(companion);
      return insertId;
    } else {
      final updated = await repository.updateOne(companion);
      if (!updated) {
        throw Exception('Échec de la mise à jour de l\'enregistrement avec localId: $localId');
      }
      return localId!;
    }
  }

  /// Insère ou met à jour un enregistrement selon l'ID serveur
  /// 
  /// - Si un enregistrement avec cet ID serveur existe : le met à jour
  /// - Sinon : insère un nouvel enregistrement
  /// 
  /// Retourne l'ID local (soit celui existant, soit le nouveau)
  Future<int> insertOrUpdateByServerId(Dto dto) async {
    final String? serverId = (dto as dynamic).id;

    if (serverId == null) {
      throw Exception('L\'ID serveur est requis pour insertOrUpdateByServerId');
    }

    // Recherche d'un enregistrement existant par ID serveur
    final existing = await repository.getOneByServerId(serverId);

    if (existing == null) {
      // Insertion d'un nouvel enregistrement
      final companion = factory.toCompanion(dto, includeId: false);
      final insertId = await repository.insertOne(companion);
      return insertId;
    } else {
      // Mise à jour : on utilise le localId de l'enregistrement existant
      final updatedDto = (dto as dynamic).copyWith(
        localId: (existing as dynamic).localId,
      ) as Dto;
      final companion = factory.toCompanion(updatedDto, includeId: true);
      final updated = await repository.updateOne(companion);
      if (!updated) {
        throw Exception('Échec de la mise à jour de l\'enregistrement avec serverId: $serverId');
      }
      return (existing as dynamic).localId;
    }
  }

  /// Insère uniquement un nouvel enregistrement
  /// Retourne l'ID local généré
  Future<int> insertOnly(Dto dto) async {
    final companion = factory.toCompanion(dto, includeId: false);
    final insertId = await repository.insertOne(companion);
    return insertId;
  }

  /// Met à jour uniquement un enregistrement existant
  /// Retourne true si la mise à jour a réussi
  Future<bool> updateOnly(Dto dto) async {
    final int? localId = (dto as dynamic).localId;
    
    if (localId == null) {
      throw Exception('Le localId est requis pour updateOnly');
    }

    final existing = await repository.getOneByLocalId(localId);
    if (existing == null) {
      throw Exception('Aucun enregistrement trouvé avec localId: $localId');
    }

    final companion = factory.toCompanion(dto, includeId: true);
    return await repository.updateOne(companion);
  }

  /// Récupère tous les enregistrements et les convertit en DTOs
  Future<List<Dto>> findAll() async {
    final results = await repository.getAll();
    return factory.toDataTransfertObjects(results);
  }

  /// Récupère un enregistrement par son ID local et le convertit en DTO
  Future<Dto?> findById(int localId) async {
    final result = await repository.getOneByLocalId(localId);
    return result != null ? factory.toDataTransfertObject(result) : null;
  }

  /// Récupère un enregistrement par son ID serveur et le convertit en DTO
  Future<Dto?> findByServerId(String serverId) async {
    final result = await repository.getOneByServerId(serverId);
    return result != null ? factory.toDataTransfertObject(result) : null;
  }

  /// Supprime un enregistrement par son ID local
  /// Retourne true si la suppression a réussi
  Future<bool> delete(int localId) async {
    final result = await repository.deleteOne(localId);
    return result > 0;
  }

  /// Compte le nombre total d'enregistrements
  Future<int> count() async {
    return await repository.count();
  }
}
