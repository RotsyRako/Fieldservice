import 'package:drift/drift.dart';
import 'package:field_service/src/repository/local/app_database.dart';
import 'package:field_service/src/repository/local/base_local.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signature_local.repository.g.dart';

// Les types $SignaturesTable et Signature sont générés dans app_database.g.dart
// qui est un part de app_database.dart, donc ils sont accessibles via app_database.dart

/// Repository local pour la gestion des signatures
class SignatureLocalRepository extends BaseLocalRepository<$SignaturesTable, Signature> {
  SignatureLocalRepository(super.database);

  @override
  TableInfo<$SignaturesTable, Signature> get table => db.signatures;

  /// Récupère toutes les signatures pour une intervention donnée
  Future<List<Signature>> getByInterventionId(String idIntervention) async {
    final query = db.select(table)
      ..where((tbl) => tbl.idIntervention.equals(idIntervention));
    return await query.get();
  }
}

/// Provider Riverpod pour le repository local des signatures
@Riverpod(keepAlive: true)
SignatureLocalRepository signatureLocalRepository(Ref ref) {
  final database = ref.watch(databaseProvider);
  return SignatureLocalRepository(database);
}

