// ignore_for_file: unused-code
import 'package:drift/drift.dart';

/// Table des feuilles de temps
class Timesheets extends Table {
  const Timesheets();

  /// Clé primaire locale (auto-incrément)
  IntColumn get localId => integer().autoIncrement()();

  /// ID du serveur (nullable si pas encore synchronisé)
  TextColumn get id => text().nullable()();

  /// Description du travail
  TextColumn get description => text()();

  /// Temps alloué en heures
  RealColumn get timeAllocated => real()();

  /// Date du travail
  TextColumn get date => text()();

  /// ID de l'intervention associée
  TextColumn get idIntervention => text()();

  /// Date de création
  DateTimeColumn get createdAt => dateTime().nullable()();

  /// Date de mise à jour
  DateTimeColumn get updatedAt => dateTime().nullable()();

  /// Indique si la feuille de temps est synchronisée avec le serveur
  BoolColumn get isSync => boolean().withDefault(const Constant(false))();
}

