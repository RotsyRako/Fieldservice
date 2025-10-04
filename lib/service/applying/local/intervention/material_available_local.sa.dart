import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/do/intervention/material_available.do.dart';
import '../../../../models/dto/intervention/material_available.dto.dart';
import '../../../../models/factory/intervention/material_available.factory.dart';
import '../../../../repository/local/db.dart';
import '../../../../repository/local/intervention/material_available_local.repo.dart';
import '../base_local.sa.dart';

final materialAvailableLocalSAProvider = Provider<MaterialAvailableLocalSA>((ref) {
  return MaterialAvailableLocalSA(ref);
});

class MaterialAvailableLocalSA extends BaseLocalSA<
    MaterialAvailableDO,
    MaterialAvailableDOData,
    MaterialAvailableDTO,
    MaterialAvailableDOCompanion,
    MaterialAvailableFactory,
    MaterialAvailableLocalRepo> {
  MaterialAvailableLocalSA(Ref ref) {
    initialize(
      factory: MaterialAvailableFactory(),
      repository: MaterialAvailableLocalRepo(ref),
    );
  }
}
