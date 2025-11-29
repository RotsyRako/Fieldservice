// ignore_for_file: unused-code
import 'package:drift/drift.dart';

/// Table des interventions
class Interventions extends Table {
  const Interventions();

  /// Clé primaire locale (auto-incrément)
  IntColumn get localId => integer().autoIncrement()();

  /// ID du serveur (nullable si pas encore synchronisé)
  TextColumn get id => text().nullable()();

  /// Titre de l'intervention
  TextColumn get titre => text()();

  /// Date de début au format ISO-8601
  TextColumn get dateStart => text()();

  /// Date de fin au format ISO-8601
  TextColumn get dateEnd => text()();

  /// Statut de l'intervention (1=planifié, 2=en cours, 3=terminé)
  IntColumn get status => integer()();

  /// Priorité (haute, moyenne, basse)
  TextColumn get priority => text()();

  /// Nom du client
  TextColumn get customer => text()();

  /// Longitude
  RealColumn get long => real()();

  /// Latitude
  RealColumn get lat => real()();

  /// Distance en km
  RealColumn get distance => real()();

  /// Description de l'intervention
  TextColumn get description => text()();

  /// Date de création
  DateTimeColumn get createdAt => dateTime().nullable()();

  /// Date de mise à jour
  DateTimeColumn get updatedAt => dateTime().nullable()();

  /// ID de l'utilisateur
  TextColumn get userId => text()();

  /// Indique si l'intervention est synchronisée avec le serveur
  BoolColumn get isSync => boolean().withDefault(const Constant(false))();
}

