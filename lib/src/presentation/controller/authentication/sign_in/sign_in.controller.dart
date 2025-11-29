// ignore_for_file: unused-code
import 'dart:async';

import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/models/dto/auth/sign_in/sign_in.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/services/applying/local/comment/comment_local.service.dart';
import 'package:field_service/src/services/applying/local/document/document_local.service.dart';
import 'package:field_service/src/services/applying/local/image/image_local.service.dart';
import 'package:field_service/src/services/applying/local/intervention/intervention_local.service.dart';
import 'package:field_service/src/services/applying/local/material/material_local.service.dart';
import 'package:field_service/src/services/applying/local/signature/signature_local.service.dart';
import 'package:field_service/src/services/applying/local/timesheet/timesheet_local.service.dart';
import 'package:field_service/src/services/applying/remote/authentication/sign_in.sa.dart';
import 'package:field_service/src/services/applying/remote/comment/comment_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/document/document_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/image/image_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/intervention/intervention_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/material/material_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/signature/signature_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/timesheet/timesheet_remote.sa.dart';
import 'package:field_service/src/services/technical/app_shared_preferences.dart';
import 'package:field_service/src/routing/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in.controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  Object? _key;

  @override
  FutureOr<void> build() {
    _key = Object();
    ref.onDispose(() => _key = null);
  }

  Future<void> makeUserAuthenticated({
    required SignInDto signInDto,
    void Function(String message)? onError,
    void Function()? onSuccess,
  }) async {
    print('makeUserAuthenticated: start');
    final key = _key;
    if (key == null) {
      print('makeUserAuthenticated: key is null, returning');
      return;
    }

    final signInService = ref.read(signInRemoteServiceProvider);
    final interventionRemoteService =
        ref.read(interventionRemoteServiceProvider);
    final interventionLocalService =
        ref.read(interventionLocalServiceProvider);
    final commentRemoteService = ref.read(commentRemoteServiceProvider);
    final commentLocalService = ref.read(commentLocalServiceProvider);
    final documentRemoteService = ref.read(documentRemoteServiceProvider);
    final documentLocalService = ref.read(documentLocalServiceProvider);
    final imageRemoteService = ref.read(imageRemoteServiceProvider);
    final imageLocalService = ref.read(imageLocalServiceProvider);
    final materialRemoteService = ref.read(materialRemoteServiceProvider);
    final materialLocalService = ref.read(materialLocalServiceProvider);
    final signatureRemoteService = ref.read(signatureRemoteServiceProvider);
    final signatureLocalService = ref.read(signatureLocalServiceProvider);
    final timesheetRemoteService = ref.read(timesheetRemoteServiceProvider);
    final timesheetLocalService = ref.read(timesheetLocalServiceProvider);

    try {
      state = const AsyncValue.loading();
      print('makeUserAuthenticated: state set to loading');
    } catch (_) {
      print('makeUserAuthenticated: error setting loading state');
      // Provider has been disposed, ignore
      return;
    }

    String? errorMessage;
    final userToken = await signInService.signIn(
      signInDto: signInDto,
      onFailure: (message) {
        errorMessage = message;
      },
    );

    print('makeUserAuthenticated: after service call, checking key');
    if (key != _key || _key == null) {
      print('makeUserAuthenticated: key changed or null, returning');
      return;
    }

    if (userToken == null) {
      final message = errorMessage ?? signInService.defaultError;
      print('makeUserAuthenticated: failure detected with message: $message');
      try {
        if (!ref.mounted) {
          print('makeUserAuthenticated: ref not mounted on failure, returning');
          return;
        }
        state = AsyncError(
          RemoteException(remoteMessage: message),
          StackTrace.current,
        );
        onError?.call(message);
      } catch (e) {
        print('makeUserAuthenticated: error setting failure state: $e');
        // Provider has been disposed, ignore
      }
      return;
    }

    try {
      await _syncInterventions(
        remoteService: interventionRemoteService,
        localService: interventionLocalService,
        userId: userToken.id,
      );
      
      print('makeUserAuthenticated: interventions sync completed');
      
      if (!ref.mounted) {
        print('makeUserAuthenticated: ref not mounted after sync, returning');
        return;
      }

      // Synchroniser toutes les données liées (comments, documents, images, materials, signatures, timesheets)
      final interventions = await interventionLocalService.findAll();
      for (final intervention in interventions) {
        if (intervention.id == null) continue;

        await _syncComments(
          remoteService: commentRemoteService,
          localService: commentLocalService,
          idIntervention: intervention.id!,
        );

        await _syncDocuments(
          remoteService: documentRemoteService,
          localService: documentLocalService,
          idIntervention: intervention.id!,
        );

        await _syncImages(
          remoteService: imageRemoteService,
          localService: imageLocalService,
          idIntervention: intervention.id!,
        );

        await _syncMaterials(
          remoteService: materialRemoteService,
          localService: materialLocalService,
          idIntervention: intervention.id!,
        );

        await _syncSignatures(
          remoteService: signatureRemoteService,
          localService: signatureLocalService,
          idIntervention: intervention.id!,
        );

        await _syncTimesheets(
          remoteService: timesheetRemoteService,
          localService: timesheetLocalService,
          idIntervention: intervention.id!,
        );
      }
      
      print('makeUserAuthenticated: all sync completed');
      
      if (!ref.mounted) {
        print('makeUserAuthenticated: ref not mounted after all sync, returning');
        return;
      }

      // Marquer isInterventionTableCreated et isSync en true après que toute la synchronisation soit terminée
      final appSharedPrefs = await ref.read(appSharedPreferencesProvider.future);
      await appSharedPrefs.setIsInterventionTableCreated(true);
      await appSharedPrefs.setIsSync(true);
      print('makeUserAuthenticated: isInterventionTableCreated and isSync set to true');

      if (!ref.mounted) {
        print('makeUserAuthenticated: ref not mounted after setting preferences, returning');
        return;
      }

      state = const AsyncValue.data(null);
      ref.invalidate(isAuthenticatedProvider);
      // Invalider le router pour forcer un refresh et réexécuter la logique de redirect
      ref.invalidate(appRouterProvider);
      print('makeUserAuthenticated: success, calling onSuccess');
      onSuccess?.call();
    } catch (e) {
      print('makeUserAuthenticated: error setting success state: $e');
      // Provider has been disposed, ignore
    }
    print('makeUserAuthenticated: end');
  }

  Future<void> _syncInterventions({
    required InterventionRemoteService remoteService,
    required InterventionLocalService localService,
    required String userId,
  }) async {
    String? syncError;
    final interventions = await remoteService.fetchInterventions(
      userId: userId,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Intervention sync error: $syncError');
    }

    for (final remoteIntervention in interventions) {
      final sanitized = remoteIntervention.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (!_areInterventionsEqual(existing, candidate)) {
        await localService.updateOnly(candidate);
      }
    }
  }

  bool _areInterventionsEqual(
    InterventionDto a,
    InterventionDto b,
  ) {
    return a == b;
  }

  Future<void> _syncComments({
    required CommentRemoteService remoteService,
    required CommentLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final comments = await remoteService.fetchCommentsByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Comment sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteComment in comments) {
      final sanitized = remoteComment.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  Future<void> _syncDocuments({
    required DocumentRemoteService remoteService,
    required DocumentLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final documents = await remoteService.fetchDocumentsByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Document sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteDocument in documents) {
      final sanitized = remoteDocument.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  Future<void> _syncImages({
    required ImageRemoteService remoteService,
    required ImageLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final images = await remoteService.fetchImagesByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Image sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteImage in images) {
      final sanitized = remoteImage.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  Future<void> _syncMaterials({
    required MaterialRemoteService remoteService,
    required MaterialLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final materials = await remoteService.fetchMaterialsByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Material sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteMaterial in materials) {
      final sanitized = remoteMaterial.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  Future<void> _syncSignatures({
    required SignatureRemoteService remoteService,
    required SignatureLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final signatures = await remoteService.fetchSignaturesByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Signature sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteSignature in signatures) {
      final sanitized = remoteSignature.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }

  Future<void> _syncTimesheets({
    required TimesheetRemoteService remoteService,
    required TimesheetLocalService localService,
    required String idIntervention,
  }) async {
    String? syncError;
    final timesheets = await remoteService.fetchTimesheetsByIntervention(
      idIntervention: idIntervention,
      onFailure: (message) {
        syncError = message;
      },
    );

    if (syncError != null) {
      print('Timesheet sync error for intervention $idIntervention: $syncError');
      return;
    }

    for (final remoteTimesheet in timesheets) {
      final sanitized = remoteTimesheet.copyWith(isSync: true);
      final serverId = sanitized.id;

      if (serverId == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final existing = await localService.findByServerId(serverId);
      if (existing == null) {
        await localService.insertOnly(sanitized.copyWith(localId: null));
        continue;
      }

      final candidate = sanitized.copyWith(localId: existing.localId);
      if (existing != candidate) {
        await localService.updateOnly(candidate);
      }
    }
  }
}
