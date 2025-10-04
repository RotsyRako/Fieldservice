import 'package:arkup_edoo/models/constant/timer_status.enum.dart';
import 'package:arkup_edoo/models/do/user/user.do.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:arkup_edoo/models/do/intervention/intervention_table.do.dart';
import 'package:arkup_edoo/models/do/intervention/commentaire.do.dart';
import 'package:arkup_edoo/models/do/intervention/commentaire_Pj.do.dart';
import 'package:arkup_edoo/models/do/intervention/document.do.dart';
import 'package:arkup_edoo/models/do/intervention/material.do.dart';
import 'package:arkup_edoo/models/do/intervention/photo_table.do.dart';
import 'package:arkup_edoo/models/do/intervention/temps_intervetion.do.dart';
import 'package:arkup_edoo/models/do/intervention/material_available.do.dart';
import 'package:arkup_edoo/models/do/intervention/material_required.do.dart';

part 'db.g.dart';

@DriftDatabase(
  tables: [
    UserDO,
    InterventionDO,
    PhotoDO,
    TempsInterventionDO,
    DocumentDO,
    CommentairePjDO,
    CommentaireDO,
    MaterialDO,
    MaterialAvailableDO,
    MaterialRequiredDO,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final directory = await getDatabasesPath();
    final dbPath = p.join(directory, 'app.db');
    return NativeDatabase(File(dbPath));
  });
}

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  throw UnimplementedError('Database not initialized');
});
