
import 'package:arkup_edoo/service/applying/remote/base_remote.sa.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/dto/intervention/intervention_response.dto.dart';
import '../../../models/dto/intervention/material_available_response.dto.dart';
import '../../../repository/remote/intervention_remote.repo.dart';
import '../../../repository/remote/material_available.repo.dart';

class MaterialAvailableRemoteSA extends BaseRemoteSA{
  final MaterialAvailableRemoteRepo  _repository;

  MaterialAvailableRemoteSA(this._repository);

  Future<MaterialAvailableResponseDto> getAllMaterialAvailable()async{
    return await _repository.getAllMaterialAvailable();
  }
}

final materialAvailableRemoteServiceProvider = Provider<MaterialAvailableRemoteSA>((ref) {
  return MaterialAvailableRemoteSA(ref.read(materialAvailableRemoteRepoProvider));
});