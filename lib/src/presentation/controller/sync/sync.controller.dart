import 'dart:async';
import 'package:field_service/src/models/dto/intervention/intervention_sync_request.dto.dart';
import 'package:field_service/src/models/dto/intervention/intervention_sync_item.dto.dart';
import 'package:field_service/src/services/applying/local/intervention/intervention_local.service.dart';
import 'package:field_service/src/services/applying/local/comment/comment_local.service.dart';
import 'package:field_service/src/services/applying/local/document/document_local.service.dart';
import 'package:field_service/src/services/applying/local/image/image_local.service.dart';
import 'package:field_service/src/services/applying/local/material/material_local.service.dart';
import 'package:field_service/src/services/applying/local/signature/signature_local.service.dart';
import 'package:field_service/src/services/applying/local/timesheet/timesheet_local.service.dart';
import 'package:field_service/src/services/applying/remote/intervention/intervention_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/comment/comment_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/document/document_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/image/image_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/material/material_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/signature/signature_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/timesheet/timesheet_remote.sa.dart';
import 'package:field_service/src/services/technical/app_shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync.controller.g.dart';

/// État de synchronisation
class SyncState {
  const SyncState({
    this.isSyncing = false,
    this.syncMessage,
    this.lastError,
  });

  final bool isSyncing;
  final String? syncMessage;
  final String? lastError;

  SyncState copyWith({
    bool? isSyncing,
    Object? syncMessage = _sentinel,
    Object? lastError = _sentinel,
  }) {
    return SyncState(
      isSyncing: isSyncing ?? this.isSyncing,
      syncMessage: syncMessage == _sentinel ? this.syncMessage : syncMessage as String?,
      lastError: lastError == _sentinel ? this.lastError : lastError as String?,
    );
  }
}

const _sentinel = Object();

/// Provider pour l'état de synchronisation
/// On utilise keepAlive pour éviter que le provider soit disposé
@Riverpod(keepAlive: true)
class SyncStateNotifier extends _$SyncStateNotifier {
  @override
  SyncState build() => const SyncState();
}

/// Controller pour gérer la synchronisation des interventions
@riverpod
class SyncController extends _$SyncController {
  @override
  FutureOr<void> build() async {
    // Le controller est initialisé, pas besoin de retourner de valeur
  }

  /// Met à jour l'état de synchronisation
  void _updateSyncState({
    bool? isSyncing,
    String? syncMessage,
    String? lastError,
    bool clearMessage = false,
    bool clearError = false,
  }) {
    // Essayer de mettre à jour l'état même si le ref pourrait être disposé
    // Le try-catch gérera les erreurs si le provider n'est plus disponible
    try {
      if (!ref.mounted) {
        // Si le ref n'est pas monté, on ne peut pas mettre à jour l'état
        return;
      }
      
      final currentState = ref.read(syncStateProvider);
      
      // Déterminer les valeurs à utiliser pour syncMessage et lastError
      // Si clearMessage/clearError est true, on passe explicitement null
      // Sinon, si syncMessage/lastError est fourni, on l'utilise, sinon on garde la valeur actuelle (_sentinel)
      final messageToUse = clearMessage 
          ? null 
          : (syncMessage != null ? syncMessage : _sentinel);
      final errorToUse = clearError 
          ? null 
          : (lastError != null ? lastError : _sentinel);
      
      // Créer un nouvel état explicitement pour forcer la mise à jour
      final newState = SyncState(
        isSyncing: isSyncing ?? currentState.isSyncing,
        syncMessage: messageToUse == _sentinel ? currentState.syncMessage : messageToUse as String?,
        lastError: errorToUse == _sentinel ? currentState.lastError : errorToUse as String?,
      );
      
      // Mettre à jour l'état de manière synchrone
      // syncStateProvider est keepAlive: true, donc il ne devrait pas être disposé
      ref.read(syncStateProvider.notifier).state = newState;
    } catch (e) {
      // Si le provider est déjà disposé ou une autre erreur, on ignore silencieusement
      // pour ne pas bloquer l'exécution
    }
  }

  /// Synchronise toutes les interventions avec leurs items
  /// 
  /// Cette méthode :
  /// 1. Récupère toutes les interventions depuis la base locale
  /// 2. Pour chaque intervention, récupère tous ses items (comments, documents, images, etc.)
  /// 3. Construit la requête de synchronisation
  /// 4. Envoie la requête au serveur
  /// 5. Met à jour isSync dans AppSharedPreferences
  Future<void> syncAllInterventions() async {
    // Capturer le notifier AU DÉBUT pour pouvoir l'utiliser même si le ref est disposé
    final syncStateNotifier = ref.read(syncStateProvider.notifier);
    final currentState = syncStateNotifier.state;
    
    if (currentState.isSyncing) {
      return; // Éviter les synchronisations multiples simultanées
    }

    try {
      // Mettre l'état à syncing au début
      syncStateNotifier.state = SyncState(
        isSyncing: true,
        syncMessage: 'Synchronisation',
        lastError: null,
      );

      // Récupérer les services nécessaires
      final interventionLocalService = ref.read(interventionLocalServiceProvider);
      final interventionRemoteService = ref.read(interventionRemoteServiceProvider);
      final commentLocalService = ref.read(commentLocalServiceProvider);
      final documentLocalService = ref.read(documentLocalServiceProvider);
      final imageLocalService = ref.read(imageLocalServiceProvider);
      final materialLocalService = ref.read(materialLocalServiceProvider);
      final signatureLocalService = ref.read(signatureLocalServiceProvider);
      final timesheetLocalService = ref.read(timesheetLocalServiceProvider);
      final appSharedPreferences = await ref.read(appSharedPreferencesProvider.future);

      // Mettre isSync à false avant de commencer
      if (ref.mounted) {
        await appSharedPreferences.setIsSync(false);
      }

      // Récupérer toutes les interventions
      final interventions = await interventionLocalService.findAll();

      // Filtrer seulement les interventions qui ont un ID serveur
      final interventionsToSync = interventions.where((i) => i.id != null).toList();

      if (interventionsToSync.isEmpty) {
        syncStateNotifier.state = const SyncState(
          isSyncing: false,
          syncMessage: null,
          lastError: null,
        );
        if (ref.mounted) {
          await appSharedPreferences.setIsSync(true);
        }
        return;
      }

      // Construire la requête de synchronisation avec tous les items
      final syncItems = <InterventionSyncItemDto>[];

      for (final intervention in interventionsToSync) {
        final idIntervention = intervention.id!;

        // Récupérer tous les items pour cette intervention
        final comments = await commentLocalService.findByInterventionId(idIntervention);
        final documents = await documentLocalService.findByInterventionId(idIntervention);
        final images = await imageLocalService.findByInterventionId(idIntervention);
        final materials = await materialLocalService.findByInterventionId(idIntervention);
        final signatures = await signatureLocalService.findByInterventionId(idIntervention);
        final timesheets = await timesheetLocalService.findByInterventionId(idIntervention);

        // Convertir les DTOs en Map pour la synchronisation
        final commentsMap = comments.map((c) => c.toJson()).toList();
        final documentsMap = documents.map((d) => d.toJson()).toList();
        final imagesMap = images.map((i) => i.toJson()).toList();
        final materialsMap = materials.map((m) => m.toJson()).toList();
        final signaturesMap = signatures.map((s) => s.toJson()).toList();
        final timesheetsMap = timesheets.map((t) => t.toJson()).toList();

        // Prendre la première signature si elle existe (ou null)
        final signatureMap = signaturesMap.isNotEmpty ? signaturesMap.first : null;

        syncItems.add(
          InterventionSyncItemDto(
            id: idIntervention,
            status: intervention.status,
            materials: materialsMap,
            timesheets: timesheetsMap,
            images: imagesMap,
            documents: documentsMap,
            signature: signatureMap,
            comments: commentsMap,
          ),
        );
      }

      // Effectuer la synchronisation
      final syncRequest = InterventionSyncRequestDto(data: syncItems);
      String? syncError;
      
      await interventionRemoteService.syncInterventions(
        request: syncRequest,
        onFailure: (message) {
          // Capturer l'erreur
          syncError = message;
          print('Erreur de synchronisation: $message');
        },
      );

      // Mettre à jour l'état IMMÉDIATEMENT après l'appel API, avant toute autre opération
      // Utiliser le notifier capturé pour éviter les problèmes de ref disposé
      if (syncError != null) {
        // Erreur de synchronisation
        syncStateNotifier.state = SyncState(
          isSyncing: false,
          syncMessage: null,
          lastError: syncError,
        );
        
        // Mettre isSync à true même en cas d'erreur pour éviter les tentatives répétées
        if (ref.mounted) {
          try {
            await appSharedPreferences.setIsSync(true);
          } catch (e) {
            // Ignorer si le provider est déjà disposé
          }
        }
        throw Exception(syncError);
      }

      // Synchronisation réussie - mettre l'état à false
      syncStateNotifier.state = const SyncState(
        isSyncing: false,
        syncMessage: null,
        lastError: null,
      );

      // Mettre isSync à true après la mise à jour de l'état
      if (ref.mounted) {
        try {
          await appSharedPreferences.setIsSync(true);
        } catch (e) {
          // Ignorer si le provider est déjà disposé
        }
      }
    } catch (e) {
      // S'assurer que l'état est toujours réinitialisé même en cas d'erreur
      // Utiliser le notifier capturé au début pour éviter les problèmes de ref disposé
      try {
        syncStateNotifier.state = SyncState(
          isSyncing: false,
          syncMessage: null,
          lastError: e.toString(),
        );
      } catch (stateError) {
        // Ignorer si le provider est déjà disposé
      }
      
      // Mettre isSync à true même en cas d'erreur pour éviter les tentatives répétées
      if (ref.mounted) {
        try {
          final appSharedPreferences = await ref.read(appSharedPreferencesProvider.future);
          await appSharedPreferences.setIsSync(true);
        } catch (_) {
          // Ignorer si le provider est déjà disposé
        }
      }
      rethrow;
    }
  }

  /// Récupère toutes les interventions depuis le serveur et les synchronise localement
  /// 
  /// Cette méthode :
  /// 1. Récupère les interventions depuis le serveur
  /// 2. Synchronise les interventions dans la base locale
  /// 3. Pour chaque intervention, récupère et synchronise tous ses items
  Future<void> fetchAndSyncAllInterventions({String? userId}) async {
    final currentState = ref.read(syncStateProvider);
    if (currentState.isSyncing) {
      return; // Éviter les synchronisations multiples simultanées
    }

    try {
      _updateSyncState(isSyncing: true, syncMessage: 'Récupération des données');

      // Récupérer les services nécessaires
      final interventionLocalService = ref.read(interventionLocalServiceProvider);
      final interventionRemoteService = ref.read(interventionRemoteServiceProvider);
      final commentLocalService = ref.read(commentLocalServiceProvider);
      final commentRemoteService = ref.read(commentRemoteServiceProvider);
      final documentLocalService = ref.read(documentLocalServiceProvider);
      final documentRemoteService = ref.read(documentRemoteServiceProvider);
      final imageLocalService = ref.read(imageLocalServiceProvider);
      final imageRemoteService = ref.read(imageRemoteServiceProvider);
      final materialLocalService = ref.read(materialLocalServiceProvider);
      final materialRemoteService = ref.read(materialRemoteServiceProvider);
      final signatureLocalService = ref.read(signatureLocalServiceProvider);
      final signatureRemoteService = ref.read(signatureRemoteServiceProvider);
      final timesheetLocalService = ref.read(timesheetLocalServiceProvider);
      final timesheetRemoteService = ref.read(timesheetRemoteServiceProvider);
      final appSharedPreferences = await ref.read(appSharedPreferencesProvider.future);

      // Mettre isSync à false avant de commencer
      if (ref.mounted) {
        await appSharedPreferences.setIsSync(false);
      }

      // Si pas de userId, essayer de le récupérer depuis une intervention existante
      String? finalUserId = userId;
      if (finalUserId == null) {
        final existingInterventions = await interventionLocalService.findAll();
        if (existingInterventions.isNotEmpty) {
          finalUserId = existingInterventions.first.userId;
        }
      }

      if (finalUserId == null) {
        _updateSyncState(isSyncing: false, clearMessage: true);
        throw Exception('Impossible de récupérer le userId pour la synchronisation');
      }

      // 1. Récupérer et synchroniser les interventions
      _updateSyncState(syncMessage: 'Synchronisation des interventions');
      final interventions = await interventionRemoteService.fetchInterventions(
        userId: finalUserId,
        onFailure: (message) {
          print('Erreur lors de la récupération des interventions: $message');
        },
      );

      for (final remoteIntervention in interventions) {
        final sanitized = remoteIntervention.copyWith(isSync: true);
        final serverId = sanitized.id;

        if (serverId == null) continue;

        final existing = await interventionLocalService.findByServerId(serverId);
        if (existing == null) {
          await interventionLocalService.insertOnly(sanitized.copyWith(localId: null));
        } else {
          final candidate = sanitized.copyWith(localId: existing.localId);
          if (existing != candidate) {
            await interventionLocalService.updateOnly(candidate);
          }
        }
      }

      // 2. Pour chaque intervention, récupérer et synchroniser tous les items
      final allInterventions = await interventionLocalService.findAll();
      for (final intervention in allInterventions) {
        if (intervention.id == null) continue;

        final idIntervention = intervention.id!;

        // Synchroniser les commentaires
        _updateSyncState(syncMessage: 'Synchronisation des commentaires');
        final comments = await commentRemoteService.fetchCommentsByIntervention(
          idIntervention: idIntervention,
          onFailure: (message) {
            print('Erreur lors de la récupération des commentaires: $message');
          },
        );
        for (final remoteComment in comments) {
          final sanitized = remoteComment.copyWith(isSync: true);
          final serverId = sanitized.id;
          if (serverId == null) {
            await commentLocalService.insertOnly(sanitized.copyWith(localId: null));
          } else {
            final existing = await commentLocalService.findByServerId(serverId);
            if (existing == null) {
              await commentLocalService.insertOnly(sanitized.copyWith(localId: null));
            } else {
              final candidate = sanitized.copyWith(localId: existing.localId);
              if (existing != candidate) {
                await commentLocalService.updateOnly(candidate);
              }
            }
          }
        }

        // Synchroniser les documents
        _updateSyncState(syncMessage: 'Synchronisation des documents');
        final documents = await documentRemoteService.fetchDocumentsByIntervention(
          idIntervention: idIntervention,
          onFailure: (message) {
            print('Erreur lors de la récupération des documents: $message');
          },
        );
        for (final remoteDocument in documents) {
          final sanitized = remoteDocument.copyWith(isSync: true);
          final serverId = sanitized.id;
          if (serverId == null) {
            await documentLocalService.insertOnly(sanitized.copyWith(localId: null));
          } else {
            final existing = await documentLocalService.findByServerId(serverId);
            if (existing == null) {
              await documentLocalService.insertOnly(sanitized.copyWith(localId: null));
            } else {
              final candidate = sanitized.copyWith(localId: existing.localId);
              if (existing != candidate) {
                await documentLocalService.updateOnly(candidate);
              }
            }
          }
        }

        // Synchroniser les images
        _updateSyncState(syncMessage: 'Synchronisation des images');
        final images = await imageRemoteService.fetchImagesByIntervention(
          idIntervention: idIntervention,
          onFailure: (message) {
            print('Erreur lors de la récupération des images: $message');
          },
        );
        for (final remoteImage in images) {
          final sanitized = remoteImage.copyWith(isSync: true);
          final serverId = sanitized.id;
          if (serverId == null) {
            await imageLocalService.insertOnly(sanitized.copyWith(localId: null));
          } else {
            final existing = await imageLocalService.findByServerId(serverId);
            if (existing == null) {
              await imageLocalService.insertOnly(sanitized.copyWith(localId: null));
            } else {
              final candidate = sanitized.copyWith(localId: existing.localId);
              if (existing != candidate) {
                await imageLocalService.updateOnly(candidate);
              }
            }
          }
        }

        // Synchroniser les matériaux
        _updateSyncState(syncMessage: 'Synchronisation des matériaux');
        final materials = await materialRemoteService.fetchMaterialsByIntervention(
          idIntervention: idIntervention,
          onFailure: (message) {
            print('Erreur lors de la récupération des matériaux: $message');
          },
        );
        for (final remoteMaterial in materials) {
          final sanitized = remoteMaterial.copyWith(isSync: true);
          final serverId = sanitized.id;
          if (serverId == null) {
            await materialLocalService.insertOnly(sanitized.copyWith(localId: null));
          } else {
            final existing = await materialLocalService.findByServerId(serverId);
            if (existing == null) {
              await materialLocalService.insertOnly(sanitized.copyWith(localId: null));
            } else {
              final candidate = sanitized.copyWith(localId: existing.localId);
              if (existing != candidate) {
                await materialLocalService.updateOnly(candidate);
              }
            }
          }
        }

        // Synchroniser les signatures
        _updateSyncState(syncMessage: 'Synchronisation des signatures');
        final signatures = await signatureRemoteService.fetchSignaturesByIntervention(
          idIntervention: idIntervention,
          onFailure: (message) {
            print('Erreur lors de la récupération des signatures: $message');
          },
        );
        for (final remoteSignature in signatures) {
          final sanitized = remoteSignature.copyWith(isSync: true);
          final serverId = sanitized.id;
          if (serverId == null) {
            await signatureLocalService.insertOnly(sanitized.copyWith(localId: null));
          } else {
            final existing = await signatureLocalService.findByServerId(serverId);
            if (existing == null) {
              await signatureLocalService.insertOnly(sanitized.copyWith(localId: null));
            } else {
              final candidate = sanitized.copyWith(localId: existing.localId);
              if (existing != candidate) {
                await signatureLocalService.updateOnly(candidate);
              }
            }
          }
        }

        // Synchroniser les feuilles de temps
        _updateSyncState(syncMessage: 'Synchronisation des feuilles de temps');
        final timesheets = await timesheetRemoteService.fetchTimesheetsByIntervention(
          idIntervention: idIntervention,
          onFailure: (message) {
            print('Erreur lors de la récupération des feuilles de temps: $message');
          },
        );
        for (final remoteTimesheet in timesheets) {
          final sanitized = remoteTimesheet.copyWith(isSync: true);
          final serverId = sanitized.id;
          if (serverId == null) {
            await timesheetLocalService.insertOnly(sanitized.copyWith(localId: null));
          } else {
            final existing = await timesheetLocalService.findByServerId(serverId);
            if (existing == null) {
              await timesheetLocalService.insertOnly(sanitized.copyWith(localId: null));
            } else {
              final candidate = sanitized.copyWith(localId: existing.localId);
              if (existing != candidate) {
                await timesheetLocalService.updateOnly(candidate);
              }
            }
          }
        }
      }

      // Mettre isSync à true après la synchronisation réussie
      if (ref.mounted) {
        await appSharedPreferences.setIsSync(true);
      }

      _updateSyncState(
        isSyncing: false,
        clearMessage: true,
        clearError: true,
      );
    } catch (e) {
      print('Erreur lors de la récupération et synchronisation: $e');
      // S'assurer que l'état est toujours réinitialisé même en cas d'erreur
      _updateSyncState(
        isSyncing: false,
        lastError: e.toString(),
        clearMessage: true,
      );
      rethrow;
    }
  }

  /// Met à jour le statut de synchronisation dans AppSharedPreferences
  Future<void> setSyncStatus(bool isSync) async {
    final appSharedPreferences = await ref.read(appSharedPreferencesProvider.future);
    await appSharedPreferences.setIsSync(isSync);
  }
}

