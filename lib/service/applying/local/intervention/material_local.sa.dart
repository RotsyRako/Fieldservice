import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/do/intervention/material.do.dart';
import '../../../../models/dto/intervention/material.dto.dart';
import '../../../../models/factory/intervention/material.factory.dart';
import '../../../../repository/local/db.dart';
import '../../../../repository/local/intervention/material_local.repo.dart';
import '../base_local.sa.dart';

final materialsForInterventionProvider = FutureProvider.family<List<MaterialDTO>, int>((ref, interventionId) {
  final materialService = ref.watch(materialLocalSAProvider);
  return materialService.findByInterventionId(interventionId);
});

final materialLocalSAProvider = Provider<MaterialLocalSA>((ref) {
  return MaterialLocalSA(ref);
});

class MaterialLocalSA extends BaseLocalSA<
    MaterialDO,
    MaterialDOData,
    MaterialDTO,
    MaterialDOCompanion,
    MaterialFactory,
    MaterialLocalRepo> {
  MaterialLocalSA(Ref ref) {
    initialize(
      factory: MaterialFactory(),
      repository: MaterialLocalRepo(ref),
    );
  }

  Future<List<MaterialDTO>> findByInterventionId(int interventionId) async {
    final results = await repository.findByInterventionId(interventionId);
    return factory.toDataTransfertObjects(results);
  }
}
