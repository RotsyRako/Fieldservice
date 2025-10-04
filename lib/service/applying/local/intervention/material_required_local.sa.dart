import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/do/intervention/material_required.do.dart';
import '../../../../models/dto/intervention/material_required.dto.dart';
import '../../../../models/factory/intervention/material_required.factory.dart';
import '../../../../repository/local/db.dart';
import '../../../../repository/local/intervention/material_required_local.repo.dart';
import '../base_local.sa.dart';

final materialRequiredsForInterventionProvider = FutureProvider.family<List<MaterialRequiredDTO>, int>((ref, interventionId) {
  final materialRequiredService = ref.watch(materialRequiredLocalSAProvider);
  return materialRequiredService.findByInterventionId(interventionId);
});

final materialRequiredLocalSAProvider = Provider<MaterialRequiredLocalSA>((ref) {
  return MaterialRequiredLocalSA(ref);
});

class MaterialRequiredLocalSA extends BaseLocalSA<
    MaterialRequiredDO,
    MaterialRequiredDOData,
    MaterialRequiredDTO,
    MaterialRequiredDOCompanion,
    MaterialRequiredFactory,
    MaterialRequiredLocalRepo> {
  MaterialRequiredLocalSA(Ref ref) {
    initialize(
      factory: MaterialRequiredFactory(),
      repository: MaterialRequiredLocalRepo(ref),
    );
  }

  Future<List<MaterialRequiredDTO>> findByInterventionId(int interventionId) async {
    final results = await repository.findByInterventionId(interventionId);
    return factory.toDataTransfertObjects(results);
  }

  Future<int> deleteByInterventionId(int localInterventionId) async {
    final results = await repository.deleteByInterventionId(localInterventionId);
    return results;
  }
}
