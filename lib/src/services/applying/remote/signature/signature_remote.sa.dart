import 'dart:async';

import 'package:field_service/src/models/dto/signature/signature_dto.dart';
import 'package:field_service/src/models/dto/signature/signature_list_response.dto.dart';
import 'package:field_service/src/repository/remote/signature/signature_remote.repository.dart';
import 'package:field_service/src/services/applying/remote/base_remote.sa.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signature_remote.sa.g.dart';

class SignatureRemoteService extends BaseRemoteService {
  SignatureRemoteService({
    required SignatureRemoteRepository signatureRemoteRepository,
  })  : _signatureRemoteRepository = signatureRemoteRepository,
        super(
          baseRemoteRepository:
              signatureRemoteRepository.baseRemoteRepository,
        );

  final SignatureRemoteRepository _signatureRemoteRepository;

  Future<List<SignatureDto>> fetchSignaturesByIntervention({
    required String idIntervention,
    LoadingCallback? loading,
    OnSuccessCallback<List<SignatureDto>>? onSuccess,
    OnFailureCallback<String>? onFailure,
    String? defaultErrorMessage,
  }) async {
    final completer = Completer<List<SignatureDto>>();

    await executeOperation<SignatureListResponseDto>(
      operation: () async => _signatureRemoteRepository.fetchSignaturesByIntervention(
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
          completer.complete(const <SignatureDto>[]);
        }
        onFailure?.call(message);
      },
      defaultErrorMessage: defaultErrorMessage,
    );

    if (!completer.isCompleted) {
      completer.complete(const <SignatureDto>[]);
    }

    return completer.future;
  }
}

@Riverpod(keepAlive: true)
SignatureRemoteService signatureRemoteService(Ref ref) {
  final repository = ref.watch(signatureRemoteRepositoryProvider);
  return SignatureRemoteService(
    signatureRemoteRepository: repository,
  );
}

