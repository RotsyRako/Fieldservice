import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/do/intervention/material.do.dart';
import '../../../models/do/intervention/material_available.do.dart';
import '../base_local.repo.dart';
import '../db.dart';

class MaterialAvailableLocalRepo extends BaseLocalRepo<MaterialAvailableDO, MaterialAvailableDOData> {

  @override
  TableInfo<MaterialAvailableDO, MaterialAvailableDOData> get table => db.materialAvailableDO;

  MaterialAvailableLocalRepo(Ref ref) {
    init(ref);
  }
}