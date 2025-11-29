import 'dart:async';

import 'package:field_service/src/models/dto/material/material_dto.dart';
import 'package:field_service/src/models/dto/material/material_list_response.dto.dart';
import 'package:field_service/src/repository/remote/material/material_remote.repository.dart';
import 'package:field_service/src/services/applying/remote/base_remote.sa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_remote.sa.g.dart';

class MaterialRemoteService extends BaseRemoteService {
  MaterialRemoteService({
    required MaterialRemoteRepository materialRemoteRepository,
  })  : _materialRemoteRepository = materialRemoteRepository,
        super(
          baseRemoteRepository:
              materialRemoteRepository.baseRemoteRepository,
        );

  final MaterialRemoteRepository _materialRemoteRepository;

  Future<List<MaterialDto>> fetchMaterialsByIntervention({
    required String idIntervention,
    LoadingCallback? loading,
    OnSuccessCallback<List<MaterialDto>>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    final completer = Completer<List<MaterialDto>>();

    await executeOperation<MaterialListResponseDto>(
      operation: () async => _materialRemoteRepository.fetchMaterialsByIntervention(
        idIntervention: idIntervention,
      ),
      loading: loading,
      onSuccess: (response) {
        final data = response.data;
        if (!completer.isCompleted) {
          completer.complete(data);
        }
        onSuccess?.call(data);
      },
      onFailure: (message) {
        if (!completer.isCompleted) {
          completer.complete(const <MaterialDto>[]);
        }
        onFailure?.call(message);
      },
      defaultErrorMessage: defaultErrorMessage,
    );

    if (!completer.isCompleted) {
      completer.complete(const <MaterialDto>[]);
    }

    return completer.future;
  }
}

@Riverpod(keepAlive: true)
MaterialRemoteService materialRemoteService(Ref ref) {
  final repository = ref.watch(materialRemoteRepositoryProvider);
  return MaterialRemoteService(
    materialRemoteRepository: repository,
  );
}

