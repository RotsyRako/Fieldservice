
import 'package:arkup_edoo/models/dto/auth/login_response.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/constant/urls.dart';
import '../../models/dto/auth/login_request.dto.dart';
import '../../models/dto/intervention/intervention_response.dto.dart';
import '../../models/dto/intervention/material_available_response.dto.dart';
import 'base_remote.repo.dart';

class MaterialAvailableRemoteRepo {
  final BaseRemoteRepo helper;

  MaterialAvailableRemoteRepo(this.helper);

  Future<MaterialAvailableResponseDto> getAllMaterialAvailable() async{
    final response = await helper.get(Urls.url.materialsAvailable);
    return MaterialAvailableResponseDto.fromJson(response);
  }
}

final materialAvailableRemoteRepoProvider = Provider<MaterialAvailableRemoteRepo>((ref) {
  return MaterialAvailableRemoteRepo(ref.read(baseRemoteRepoProvider));
});