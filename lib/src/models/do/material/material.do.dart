// ignore_for_file: unused-code
import 'package:drift/drift.dart';

/// Table des matériaux
class Materials extends Table {
  const Materials();

  /// Clé primaire locale (auto-incrément)
  IntColumn get localId => integer().autoIncrement()();

  /// ID du serveur (nullable si pas encore synchronisé)
  TextColumn get id => text().nullable()();

  /// Nom du matériau
  TextColumn get name => text()();

  /// Quantité
  IntColumn get quantity => integer()();

  /// ID de l'intervention associée
  TextColumn get idIntervention => text()();

  /// Date de création
  DateTimeColumn get createdAt => dateTime().nullable()();

  /// Date de mise à jour
  DateTimeColumn get updatedAt => dateTime().nullable()();

  /// Indique si le matériau est synchronisé avec le serveur
  BoolColumn get isSync => boolean().withDefault(const Constant(false))();
}

