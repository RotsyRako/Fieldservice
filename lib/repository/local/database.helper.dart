import 'dart:io';
import 'package:arkup_edoo/repository/local/db.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';


class DatabaseHelper {
  static AppDatabase? _dbInstance;

  /// Récupère une instance unique de la base
  static Future<AppDatabase> getDatabase() async {
    _dbInstance ??= AppDatabase();
    return _dbInstance!;
  }

  /// Ferme proprement la base
  static Future<void> closeDatabase() async {
    await _dbInstance?.close();
    _dbInstance = null;
  }

  /// Supprime physiquement la base
  static Future<void> deleteDatabase() async {
    await closeDatabase();

    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'app.db');
    final dbFile = File(path);

    if (await dbFile.exists()) {
      await dbFile.delete();
    }
  }

  /// Réinitialise la base
  static Future<AppDatabase> resetDatabase() async {
    await deleteDatabase();
    return await getDatabase();
  }
}
