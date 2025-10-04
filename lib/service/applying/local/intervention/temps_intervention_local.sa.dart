import 'package:arkup_edoo/models/do/intervention/temps_intervetion.do.dart';
import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:arkup_edoo/models/factory/intervention/temps_intervention.factory.dart';
import 'package:arkup_edoo/repository/local/intervention/temps_intervention_local.repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../repository/local/db.dart';
import '../base_local.sa.dart';

final tempsinterventionLocalSAProvider = Provider<TempsInterventionLocalSA>((ref) {
  return TempsInterventionLocalSA(ref);
});

class TempsInterventionLocalSA extends BaseLocalSA<
    TempsInterventionDO,
    TempsInterventionDOData,
    TempsInterventionDTO,
    TempsInterventionDOCompanion,
    TempsInterventionFactory,
    TempsInterventionLocalRepo
> {
  TempsInterventionLocalSA(Ref ref) {
    initialize(
      factory: TempsInterventionFactory(),
      repository: TempsInterventionLocalRepo(ref),
    );
  }

  Future<List<TempsInterventionDTO>> findByInterventionId(int id) async {
    final result = await repository.getByInterventionId(id);
    return result.map((e) => factory.toDataTransfertObject(e)).toList();
  }

}
