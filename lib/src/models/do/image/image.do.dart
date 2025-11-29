// ignore_for_file: unused-code
import 'package:drift/drift.dart';

/// Table des images
class Images extends Table {
  const Images();

  /// Clé primaire locale (auto-incrément)
  IntColumn get localId => integer().autoIncrement()();

  /// ID du serveur (nullable si pas encore synchronisé)
  TextColumn get id => text().nullable()();

  /// Nom du fichier
  TextColumn get filename => text()();

  /// Données de l'image encodées en base64
  TextColumn get data => text()();

  /// ID de l'intervention associée
  TextColumn get idIntervention => text()();

  /// Date de création
  DateTimeColumn get createdAt => dateTime().nullable()();

  /// Date de mise à jour
  DateTimeColumn get updatedAt => dateTime().nullable()();

  /// Indique si l'image est synchronisée avec le serveur
  BoolColumn get isSync => boolean().withDefault(const Constant(false))();
}

