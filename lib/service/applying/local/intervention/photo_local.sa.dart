import 'package:arkup_edoo/models/do/intervention/photo_table.do.dart';
import 'package:arkup_edoo/models/dto/intervention/photo.dto.dart';
import 'package:arkup_edoo/models/factory/intervention/photo.factory.dart';
import 'package:arkup_edoo/repository/local/intervention/photo_local.repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../repository/local/db.dart';
import '../base_local.sa.dart';

final photoLocalSAProvider = Provider<PhotoLocalSA>((ref) {
  return PhotoLocalSA(ref);
});

class PhotoLocalSA extends BaseLocalSA<
    PhotoDO,
    PhotoDOData,
    PhotoDTO,
    PhotoDOCompanion,
    PhotoFactory,
    PhotoLocalRepo
> {
  PhotoLocalSA(Ref ref) {
    initialize(
      factory: PhotoFactory(),
      repository: PhotoLocalRepo(ref),
    );
  }

  Future<List<PhotoDTO>> findByInterventionId(int id) async {
    final result = await repository.getByInterventionId(id);
    return result.map((e) => factory.toDataTransfertObject(e)).toList();
  }
}
