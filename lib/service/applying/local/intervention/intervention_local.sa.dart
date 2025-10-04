import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/do/intervention/intervention_table.do.dart';
import '../../../../models/dto/intervention/intervention.dto.dart';
import '../../../../models/factory/intervention/intervention.factory.dart';
import '../../../../repository/local/db.dart';
import '../../../../repository/local/intervention/intervention_local.repo.dart';
import '../base_local.sa.dart';

final interventionLocalSAProvider = Provider<InterventionLocalSA>((ref) {
  return InterventionLocalSA(ref);
});

class InterventionLocalSA extends BaseLocalSA<
    InterventionDO,
    InterventionDOData,
    InterventionDTO,
    InterventionDOCompanion,
    InterventionFactory,
    InterventionLocalRepo> {
  InterventionLocalSA(Ref ref) {
    initialize(
      factory: InterventionFactory(),
      repository: InterventionLocalRepo(ref),
    );
  }

  Future<InterventionDTO?> findRunningOrPausedIntervention() async {
    final intervention = await repository.findRunningOrPausedIntervention();
    if (intervention == null) return null;

    return factory.toDataTransfertObject(intervention);
  }
}
