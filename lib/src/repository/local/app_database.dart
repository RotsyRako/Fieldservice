import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:field_service/src/models/do/comment/comment.do.dart';
import 'package:field_service/src/models/do/document/document.do.dart';
import 'package:field_service/src/models/do/image/image.do.dart';
import 'package:field_service/src/models/do/intervention/intervention.do.dart';
import 'package:field_service/src/models/do/material/material.do.dart';
import 'package:field_service/src/models/do/signature/signature.do.dart';
import 'package:field_service/src/models/do/timesheet/timesheet.do.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Interventions,
    Comments,
    Documents,
    Images,
    Materials,
    Signatures,
    Timesheets,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          // Migration simple et destructive si nécessaire (ajout de nouvelles tables)
          // Pour éviter les incohérences, on recrée toutes les tables.
          await m.deleteTable(interventions.actualTableName);
          // Supprimer les nouvelles tables si elles existent déjà
          if (from < 3) {
            // Supprimer les tables qui pourraient exister dans une version antérieure
            try {
              await m.deleteTable(comments.actualTableName);
            } catch (_) {}
            try {
              await m.deleteTable(documents.actualTableName);
            } catch (_) {}
            try {
              await m.deleteTable(images.actualTableName);
            } catch (_) {}
            try {
              await m.deleteTable(materials.actualTableName);
            } catch (_) {}
            try {
              await m.deleteTable(signatures.actualTableName);
            } catch (_) {}
            try {
              await m.deleteTable(timesheets.actualTableName);
            } catch (_) {}
          }
          await m.createAll();
        },
      );

  static LazyDatabase _openConnection() {
    // the LazyDatabase util lets us find the right location for the file async.
    return LazyDatabase(() async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));

      // Also work around limitations on old Android versions
      if (Platform.isAndroid) {
        await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      }

      // Make sqlite3 pick a more suitable location for temporary files - the
      // one from the system may be inaccessible due to sandboxing.
      final cachebase = (await getTemporaryDirectory()).path;
      // We can't access /tmp on Android, which sqlite3 would try by default.
      // Explicitly tell it about the correct temporary directory.
      sqlite3.tempDirectory = cachebase;

      // Use to spawn a background isolate to open the database to
      // improve performance
      // See https://drift.simonbinder.eu/isolates/
      return NativeDatabase.createInBackground(file, logStatements: true);
    });
  }
}

@Riverpod(keepAlive: true)
AppDatabase database(Ref _) => AppDatabase();
