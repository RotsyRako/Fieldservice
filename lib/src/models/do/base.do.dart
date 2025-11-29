/// Classe de base pour toutes les tables DO (Data Objects)
/// 
/// Fournit les colonnes communes que toutes les tables DO doivent avoir :
/// - `localId` : Clé primaire locale (auto-increment)
/// - `id` : ID du serveur (nullable, peut être null si l'enregistrement n'a pas encore été synchronisé)
/// 
/// **Note** : En Drift, on ne peut pas vraiment faire d'héritage de tables.
/// Chaque table DO doit inclure ces colonnes manuellement en utilisant
/// les colonnes définies dans cette classe comme référence.
/// 
/// Exemple d'utilisation :
/// ```dart
/// class Interventions extends Table {
///   IntColumn get localId => integer().autoIncrement()();
///   IntColumn get id => integer().nullable()();
///   // ... autres colonnes spécifiques
/// }
/// ```
class BaseDoColumns {
  /// Colonne localId - Clé primaire locale (auto-increment)
  /// 
  /// Cette colonne doit être définie dans chaque table DO comme :
  /// ```dart
  /// IntColumn get localId => integer().autoIncrement()();
  /// ```
  static const String localIdColumnName = 'localId';

  /// Colonne id - ID du serveur (nullable)
  /// 
  /// Cette colonne doit être définie dans chaque table DO comme :
  /// ```dart
  /// IntColumn get id => integer().nullable()();
  /// ```
  /// 
  /// Cette valeur est null tant que l'enregistrement n'a pas été synchronisé
  /// avec le serveur.
  static const String idColumnName = 'id';
}

