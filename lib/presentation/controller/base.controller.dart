import 'package:arkup_edoo/common/utils/app.utils.dart';
import 'package:arkup_edoo/models/dto/feedback_state.dart';
import 'package:arkup_edoo/models/dto/intervention/commentaire.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/document.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/material.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/photo.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/comment_pj_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/comment_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/document_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/material_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/photo_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/signature_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation_request.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/timesheet_synchro.dto.dart';
import 'package:arkup_edoo/service/applying/local/intervention/comment_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/document_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/intervention_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/material_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/photo_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/temps_intervention_local.sa.dart';
import 'package:arkup_edoo/service/applying/remote/synchronisation_remote.sa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseController<T> extends StateNotifier<AsyncValue<T>> {
  final Ref ref;
  bool _isShowingFeedback = false; // Nouveau flag pour suivre l'état

  BaseController(this.ref, AsyncValue<T> initialState) : super(initialState);

  Future<void> executeAsyncRequest({
    required Future<T> Function() request,
    void Function(T value)? onSuccess,
    void Function(Object error, StackTrace stack)? onError,
  }) async {
    setLoading(show: true);
    try {
      final result = await request();
      state = AsyncValue.data(result);
      onSuccess?.call(result);
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
      if (onError != null) {
        onError(e, stack);
      } else {
        _showErrorOnce(e.toString()); // Utilisez la nouvelle méthode
      }
    } finally {
      setLoading(show: false);
    }
  }

  void setLoading({required bool show, String? message}) {
    ref.read(loadingStateProvider.notifier).state = LoadingState(
      show: show,
      message: message,
    );
  }

  void _showErrorOnce(String message) {
    if (_isShowingFeedback) return;
    _isShowingFeedback = true;
    
    ref.read(errorStateProvider.notifier).state = ErrorState(
      show: true,
      message: message,
    );
    
    Future.delayed(const Duration(milliseconds: 500), () {
      _isShowingFeedback = false;
    });
  }

  void showSnackbar(String message, {bool isError = false}) {
    if (_isShowingFeedback) return;
    _isShowingFeedback = true;
    
    ref.read(snackbarStateProvider.notifier).state = SnackbarState(
      show: true,
      message: message,
      isError: isError,
    );
    
    Future.delayed(const Duration(milliseconds: 500), () {
      _isShowingFeedback = false;
      ref.read(snackbarStateProvider.notifier).state = const SnackbarState();
    });
  }

  Future<bool> synchro() async {

  try {
    final sa = ref.read(sychronisationRemoteServiceProvider);
    final interventionSa = ref.read(interventionLocalSAProvider);

    final allIntervention = await interventionSa.findAll();

    if (allIntervention.isEmpty) {
      showSnackbar("Aucune intervention à synchroniser.");
      return false;
    }

    List<SynchrositionDTO>? data = [];

    for (InterventionDTO intervention in allIntervention) {
      if (intervention.localId == null) {
        debugPrint("❌ Intervention locale invalide : localId manquant.");
        continue;
      }

      // ✅ Initialisation du DTO
      var dto = SynchrositionDTO(
        id: intervention.id,
        status: intervention.status,
      );

      // 🔹 1. Temps d'intervention
      final timerSA = ref.read(tempsinterventionLocalSAProvider);
      final List<TempsInterventionDTO> timer =
          await timerSA.findByInterventionId(intervention.localId!);

      final List<TimesheetSynchroDTO> timesheetSynchroDTOList =
          timer.map((e) {
        if (e.date == null || e.temps == null) return null;
        return TimesheetSynchroDTO(
          date: normalizeToDdMMyyyy(e.date!),
          timeAllocated: convertTimeToDoubleHours(e.temps!),
          description: e.description ?? "",
        );
      }).whereType<TimesheetSynchroDTO>().toList();

      if (timesheetSynchroDTOList.isNotEmpty) {
        dto = dto.copyWith(timesheets: timesheetSynchroDTOList);
      }

      // 🔹 2. Matériaux
      final materialSA = ref.read(materialLocalSAProvider);
      final List<MaterialDTO> materials =
          await materialSA.findByInterventionId(intervention.localId!);

      final List<MaterialSynchroDTO> materialSynchroDTOList =
          materials.map((e) {
        if (e.id == null || e.name == null || e.quantity == null) return null;
        return MaterialSynchroDTO(
          id: e.id!,
          name: e.name,
          quantity: e.quantity!,
        );
      }).whereType<MaterialSynchroDTO>().toList();

      if (materialSynchroDTOList.isNotEmpty) {
        dto = dto.copyWith(materials: materialSynchroDTOList);
      }

      // 🔹 3. Photos
      final photoSA = ref.read(photoLocalSAProvider);
      final List<PhotoDTO> photos =
          await photoSA.findByInterventionId(intervention.localId!);

      final List<PhotoSynchroDTO> photoSynchroDTOList = (await Future.wait(
        photos.map((photo) async {
          if (photo.name == null || photo.location == null) return null;
          final base64Data = await fileToBase64(photo.location);
          if (base64Data == null) return null;
          return PhotoSynchroDTO(
            filename: photo.name!,
            data: base64Data,
          );
        }),
      )).whereType<PhotoSynchroDTO>().toList();

      if (photoSynchroDTOList.isNotEmpty) {
        dto = dto.copyWith(photos: photoSynchroDTOList);
      }

      // 🔹 4. Documents
      final documentSA = ref.read(documentLocalSAProvider);
      final List<DocumentDTO> documents =
          await documentSA.findByInterventionId(intervention.localId!);

      final List<DocumentSynchroDTO> documentSynchroDTOList =
          (await Future.wait(
        documents.map((document) async {
          if (document.name == null || document.location == null) return null;
          final base64Data = await fileToBase64(document.location);
          if (base64Data == null) return null;
          return DocumentSynchroDTO(
            filename: document.name!,
            data: base64Data,
          );
        }),
      )).whereType<DocumentSynchroDTO>().toList();

      if (documentSynchroDTOList.isNotEmpty) {
        dto = dto.copyWith(documents: documentSynchroDTOList);
      }

      // 🔹 5. Commentaires
      final commentSA = ref.read(commentLocalSAProvider);
      final List<CommentaireDTO> comments =
          await commentSA.findByInterventionId(intervention.localId!);

      final List<CommentSynchroDTO> commentSynchroDTOList = [];
      for (final comment in comments) {
        if (comment.comment == null || comment.date == null) continue;

        final List<CommentPjSynchroDTO> attachments = [];
        if (comment.pj != null && comment.pj!.isNotEmpty) {
          final base64Data = await fileToBase64(comment.pj!);
          if (base64Data != null) {
            final ext = extensionFromPath(comment.pj!);
            attachments.add(CommentPjSynchroDTO(
              filename: "pj_${comment.localId}$ext",
              data: base64Data,
            ));
          }
        }

        commentSynchroDTOList.add(CommentSynchroDTO(
          message: comment.comment!,
          dateCreated: comment.date!.toIso8601String(),
          attachmentFiles: attachments,
        ));
      }

      if (commentSynchroDTOList.isNotEmpty) {
        dto = dto.copyWith(comments: commentSynchroDTOList);
      }

      // 🔹 6. Signature
      if (intervention.signature != null &&
          intervention.signature!.isNotEmpty) {
        final signature = await fileToBase64(intervention.signature!);
        if (signature != null) {
          final signatureExt = extensionFromPath(intervention.signature!);
          dto = dto.copyWith(
            signature: SignatureSynchro(
              filename: "signature_${intervention.id}$signatureExt",
              data: signature,
            ),
          );
        }
      }

      data.add(dto);      
    }

    final value = await sa.synchronise(SynchrositionRequestDTO(data: data));

    if(value.success) {
      for(InterventionDTO intervention in allIntervention) {
        await updateAllIntervention(intervention, true);
      }
    }
  
    return value.success;
  } catch (e, stack) {
    showSnackbar("Erreur imprévue : ${e.toString()}", isError: true);
    debugPrint("❌ Erreur synchro : $e");
    debugPrint("Stack trace : $stack");
    return false;
  } 
}

  updateAllIntervention(InterventionDTO intervention, bool status) async {
    final interventionLocalService = ref.read(interventionLocalSAProvider);
    final updatedIntervention = intervention.copyWith(isSync: status);
    await interventionLocalService.insertOrUpdate(data: updatedIntervention);
  }

}