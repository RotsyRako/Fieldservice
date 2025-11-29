// ignore_for_file: unused-code
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/services/applying/local/intervention/intervention_local.service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home.controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  Future<List<InterventionDto>> build() async {
    final localService = ref.watch(interventionLocalServiceProvider);
    return await localService.findAll();
  }
}

