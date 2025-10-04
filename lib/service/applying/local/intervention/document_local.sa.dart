import 'package:arkup_edoo/models/do/intervention/document.do.dart';
import 'package:arkup_edoo/models/dto/intervention/document.dto.dart';
import 'package:arkup_edoo/models/factory/intervention/document.factory.dart';
import 'package:arkup_edoo/repository/local/intervention/document_local.repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../repository/local/db.dart';
import '../base_local.sa.dart';

final documentLocalSAProvider = Provider<DocumentLocalSA>((ref) {
  return DocumentLocalSA(ref);
});

class DocumentLocalSA extends BaseLocalSA<
    DocumentDO,
    DocumentDOData,
    DocumentDTO,
    DocumentDOCompanion,
    DocumentFactory,
    DocumentLocalRepo
> {
  DocumentLocalSA(Ref ref) {
    initialize(
      factory: DocumentFactory(),
      repository: DocumentLocalRepo(ref),
    );
  }

  Future<List<DocumentDTO>> findByInterventionId(int id) async {
    final result = await repository.getByInterventionId(id);
    return result.map((e) => factory.toDataTransfertObject(e)).toList();
  }
}
