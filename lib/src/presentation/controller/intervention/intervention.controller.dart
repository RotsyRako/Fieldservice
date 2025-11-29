import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/models/dto/material/material_dto.dart';
import 'package:field_service/src/models/dto/timesheet/timesheet_dto.dart';
import 'package:field_service/src/models/dto/image/image_dto.dart';
import 'package:field_service/src/models/dto/document/document_dto.dart';
import 'package:field_service/src/models/dto/comment/comment_dto.dart';
import 'package:field_service/src/presentation/controller/home/home.controller.dart';
import 'package:field_service/src/presentation/view/intervention/widget/work_time_entry.dart';
import 'package:field_service/src/services/applying/local/material/material_local.service.dart';
import 'package:field_service/src/services/applying/local/timesheet/timesheet_local.service.dart';
import 'package:field_service/src/services/applying/local/image/image_local.service.dart';
import 'package:field_service/src/services/applying/local/document/document_local.service.dart';
import 'package:field_service/src/services/applying/local/comment/comment_local.service.dart';
import 'package:field_service/src/services/applying/local/signature/signature_local.service.dart';
import 'package:field_service/src/services/applying/local/intervention/intervention_local.service.dart';
import 'package:field_service/src/models/dto/signature/signature_dto.dart';
import 'package:field_service/src/services/applying/remote/intervention/intervention_remote.sa.dart';
import 'package:field_service/src/services/applying/remote/scan/scan_remote.sa.dart';
import 'package:image_picker/image_picker.dart';

part 'intervention.controller.g.dart';

@riverpod
class InterventionController extends _$InterventionController {
  @override
  FutureOr<InterventionDto?> build(String id) async {
    final interventions = await ref.read(homeControllerProvider.future);
    try {
      return interventions.firstWhere(
        (intervention) => intervention.id == id,
      );
    } catch (e) {
      return null;
    }
  }

  /// Met à jour le statut d'une intervention
  /// 
  /// [intervention] : L'intervention à mettre à jour
  /// [newStatus] : Le nouveau statut (1=planifié, 2=en cours, 3=terminé)
  /// [interventionRemoteService] : Le service remote (optionnel, sera récupéré depuis le ref si non fourni)
  /// 
  /// Retourne l'intervention mise à jour ou null en cas d'erreur
  Future<InterventionDto?> updateStatus({
    required InterventionDto intervention,
    required int newStatus,
    InterventionRemoteService? interventionRemoteService,
  }) async {
    // Utiliser le service fourni ou le récupérer depuis le ref
    // Vérifier que le ref est toujours monté avant de l'utiliser
    final service = interventionRemoteService ?? 
        (ref.mounted ? ref.read(interventionRemoteServiceProvider) : null);
    
    if (service == null) {
      print('Impossible de mettre à jour le statut : service non disponible');
      return null;
    }

    try {
      final updatedIntervention = await service.updateStatusOfflineFirst(
        intervention: intervention,
        newStatus: newStatus,
        loading: (_) {
          // Le loading est géré par le service
        },
        onSuccess: (updatedIntervention) {
          // Rafraîchir la liste des interventions seulement si le ref est toujours monté
          if (ref.mounted) {
            ref.invalidate(homeControllerProvider);
          }
        },
        onFailure: (_) {
          // La base locale est toujours mise à jour même si l'API échoue
          // Ce callback est appelé uniquement pour informer l'utilisateur
        },
      );

      // Rafraîchir la liste des interventions seulement si le ref est toujours monté
      if (ref.mounted) {
        ref.invalidate(homeControllerProvider);
      }

      return updatedIntervention;
    } catch (e) {
      // En cas d'erreur, on retourne null
      // L'erreur sera gérée dans la vue
      return null;
    }
  }

  /// Sauvegarde un timesheet dans la base locale
  /// 
  /// [interventionId] : L'ID de l'intervention associée
  /// [date] : La date au format dd/MM/yyyy
  /// [timeSpent] : Le temps passé au format HH:mm:ss
  /// [description] : La description optionnelle
  /// 
  /// Retourne true si la sauvegarde a réussi, false sinon
  Future<bool> saveTimesheet({
    required String interventionId,
    required String date,
    required String timeSpent,
    String? description,
  }) async {
    try {
      // Convertir le temps passé (format HH:mm:ss) en heures (double)
      final timeParts = timeSpent.split(':');
      final hours = int.parse(timeParts[0]);
      final minutes = int.parse(timeParts[1]);
      final seconds = int.parse(timeParts[2]);
      final totalHours = hours + (minutes / 60) + (seconds / 3600);

      final timesheetDto = TimesheetDto(
        description: description ?? 'Intervention',
        timeAllocated: totalHours,
        date: date,
        idIntervention: interventionId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isSync: false,
      );

      final timesheetService = ref.read(timesheetLocalServiceProvider);
      await timesheetService.insertOnly(timesheetDto);

      return true;
    } catch (e) {
      // L'erreur sera gérée dans la vue
      return false;
    }
  }

  /// Met à jour un timesheet existant dans la base locale
  /// 
  /// [localId] : L'ID local du timesheet à mettre à jour
  /// [date] : La date au format dd/MM/yyyy
  /// [timeSpent] : Le temps passé au format HH:mm:ss
  /// [description] : La description optionnelle
  /// 
  /// Retourne true si la mise à jour a réussi, false sinon
  Future<bool> updateTimesheet({
    required int localId,
    required String date,
    required String timeSpent,
    String? description,
  }) async {
    try {
      final timesheetService = ref.read(timesheetLocalServiceProvider);
      
      // Récupérer le timesheet existant
      final existingTimesheet = await timesheetService.findById(localId);
      if (existingTimesheet == null) {
        return false;
      }

      // Convertir le temps passé (format HH:mm:ss) en heures (double)
      final timeParts = timeSpent.split(':');
      final hours = int.parse(timeParts[0]);
      final minutes = int.parse(timeParts[1]);
      final seconds = int.parse(timeParts[2]);
      final totalHours = hours + (minutes / 60) + (seconds / 3600);

      // Créer un nouveau DTO avec les valeurs mises à jour
      final updatedTimesheet = existingTimesheet.copyWith(
        description: description ?? existingTimesheet.description,
        timeAllocated: totalHours,
        date: date,
        updatedAt: DateTime.now(),
        isSync: false, // Marquer comme non synchronisé après modification
      );

      // Mettre à jour dans la base locale
      await timesheetService.updateOnly(updatedTimesheet);

      return true;
    } catch (e) {
      // L'erreur sera gérée dans la vue
      return false;
    }
  }

  /// Supprime un timesheet de la base locale
  /// 
  /// [localId] : L'ID local du timesheet à supprimer
  /// 
  /// Retourne true si la suppression a réussi, false sinon
  Future<bool> deleteTimesheet(int localId) async {
    try {
      final timesheetService = ref.read(timesheetLocalServiceProvider);
      return await timesheetService.delete(localId);
    } catch (e) {
      // L'erreur sera gérée dans la vue
      return false;
    }
  }

  /// Sauvegarde un matériau dans la base locale
  /// 
  /// [interventionId] : L'ID de l'intervention associée
  /// [name] : Le nom du matériau
  /// [quantity] : La quantité
  /// 
  /// Retourne true si la sauvegarde a réussi, false sinon
  Future<bool> saveMaterial({
    required String interventionId,
    required String name,
    required int quantity,
  }) async {
    try {
      final materialDto = MaterialDto(
        name: name,
        quantity: quantity,
        idIntervention: interventionId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isSync: false,
      );

      final materialService = ref.read(materialLocalServiceProvider);
      final localId = await materialService.insertOnly(materialDto);
      print('Matériau inséré avec succès: $name, localId: $localId');
      return true;
    } catch (e, stackTrace) {
      print('Erreur lors de l\'insertion du matériau $name: $e');
      print('Stack trace: $stackTrace');
      // L'erreur sera gérée dans la vue
      return false;
    }
  }

  /// Met à jour un matériau existant dans la base locale
  /// 
  /// [localId] : L'ID local du matériau à mettre à jour
  /// [name] : Le nom du matériau
  /// [quantity] : La quantité
  /// 
  /// Retourne true si la mise à jour a réussi, false sinon
  Future<bool> updateMaterial({
    required int localId,
    required String name,
    required int quantity,
  }) async {
    try {
      final materialService = ref.read(materialLocalServiceProvider);
      
      // Récupérer le matériau existant
      final existingMaterial = await materialService.findById(localId);
      if (existingMaterial == null) {
        return false;
      }

      // Créer un nouveau DTO avec les valeurs mises à jour
      final updatedMaterial = existingMaterial.copyWith(
        name: name,
        quantity: quantity,
        updatedAt: DateTime.now(),
        isSync: false, // Marquer comme non synchronisé après modification
      );

      // Mettre à jour dans la base locale
      await materialService.updateOnly(updatedMaterial);

      return true;
    } catch (e) {
      // L'erreur sera gérée dans la vue
      return false;
    }
  }

  /// Supprime un matériau de la base locale
  /// 
  /// [localId] : L'ID local du matériau à supprimer
  /// 
  /// Retourne true si la suppression a réussi, false sinon
  Future<bool> deleteMaterial(int localId) async {
    try {
      final materialService = ref.read(materialLocalServiceProvider);
      return await materialService.delete(localId);
    } catch (e) {
      // L'erreur sera gérée dans la vue
      return false;
    }
  }

  /// Charge les matériaux d'une intervention
  /// 
  /// [interventionId] : L'ID de l'intervention
  /// 
  /// Retourne la liste des matériaux
  Future<List<MaterialDto>> loadMaterials(String interventionId) async {
    try {
      final materialService = ref.read(materialLocalServiceProvider);
      return await materialService.findByInterventionId(interventionId);
    } catch (e) {
      print('Erreur lors du chargement des matériaux: $e');
      return [];
    }
  }

  /// Scanne une image pour reconnaître un matériau
  /// 
  /// [source] : La source de l'image (caméra ou galerie)
  /// 
  /// Retourne le nom du matériau reconnu ou null en cas d'erreur
  Future<String?> scanMaterialFromImage(ImageSource source) async {
    print('Scanning material from image: $source');
    try {
      // Capturer le service AVANT l'opération asynchrone pour pouvoir l'utiliser
      // même si le provider est disposé après
      final scanService = ref.read(scanRemoteServiceProvider);

      // Sélectionner une image
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: source,
        imageQuality: 85,
      );

      if (image == null) {
        print('Aucune image sélectionnée');
        return null;
      }

      print('Image sélectionnée: ${image.path}');

      // Appeler le service de reconnaissance d'image
      // Le service est déjà capturé, donc on peut l'utiliser même si le provider est disposé
      print('Appel du service de reconnaissance d\'image...');
      final response = await scanService.recognizeImage(
        filePath: image.path,
      );

      print('Réponse reçue du service: ${response != null}');

      if (response == null || response.data == null) {
        print('Aucune réponse du service de reconnaissance');
        return null;
      }

      final data = response.data!;

      // Afficher les labels pour debug
      print('Analyse terminée. Nombre de labels trouvés: ${data.labels.length}');
      for (var label in data.labels) {
        print('Label: ${label.descriptionFr} (${label.description}), Score: ${label.score}');
      }

      // Retourner le nom du matériau détecté en français, ou le premier label si disponible
      if (data.detectedObjectFr != null && data.detectedObjectFr!.isNotEmpty) {
        print('Matériau détecté: ${data.detectedObjectFr}');
        return data.detectedObjectFr;
      } else if (data.labels.isNotEmpty) {
        // Trier par score décroissant et retourner le premier en français
        data.labels.sort((a, b) => b.score.compareTo(a.score));
        final bestLabel = data.labels.first;
        print('Meilleur label: ${bestLabel.descriptionFr} avec un score de ${bestLabel.score}');
        return bestLabel.descriptionFr;
      }

      print('Aucun matériau détecté dans l\'image');
      return null;
    } catch (e, stackTrace) {
      print('Erreur lors du scan de matériau: $e');
      print('Stack trace: $stackTrace');
      return null;
    }
  }

  /// Sauvegarde tous les matériaux (insertions, mises à jour, suppressions)
  /// 
  /// [interventionId] : L'ID de l'intervention
  /// [materialsToSave] : Liste des matériaux à sauvegarder (avec localId null pour les nouveaux)
  /// [materialsToUpdate] : Liste des matériaux à mettre à jour (avec localId non null)
  /// [materialsToDelete] : Liste des IDs locaux des matériaux à supprimer
  /// 
  /// Retourne une liste d'erreurs (vide si tout s'est bien passé)
  Future<List<String>> saveAllMaterials({
    required String interventionId,
    required List<MaterialDto> materialsToSave,
    required List<MaterialDto> materialsToUpdate,
    required List<int> materialsToDelete,
  }) async {
    final List<String> errors = [];
    final materialService = ref.read(materialLocalServiceProvider);

    try {
      // D'abord, traiter les suppressions
      for (final localId in materialsToDelete) {
        try {
          final success = await materialService.delete(localId);
          if (!success) {
            errors.add('Erreur lors de la suppression d\'un matériau');
          }
        } catch (e) {
          errors.add('Erreur lors de la suppression: $e');
        }
      }

      // Ensuite, traiter les mises à jour
      for (final material in materialsToUpdate) {
        try {
          if (material.localId == null) {
            errors.add('Matériau sans localId pour la mise à jour: ${material.name}');
            continue;
          }

          final existingMaterial = await materialService.findById(material.localId!);
          if (existingMaterial == null) {
            errors.add('Matériau introuvable: ${material.name}');
            continue;
          }

          final updatedMaterial = existingMaterial.copyWith(
            name: material.name,
            quantity: material.quantity,
            updatedAt: DateTime.now(),
            isSync: false,
          );

          final success = await materialService.updateOnly(updatedMaterial);
          if (!success) {
            errors.add('Erreur lors de la mise à jour du matériau: ${material.name}');
          }
        } catch (e) {
          errors.add('Erreur lors de la mise à jour du matériau ${material.name}: $e');
        }
      }

      // Enfin, traiter les insertions
      for (final material in materialsToSave) {
        try {
          final materialDto = MaterialDto(
            name: material.name,
            quantity: material.quantity,
            idIntervention: interventionId,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            isSync: false,
          );

          await materialService.insertOnly(materialDto);
        } catch (e) {
          errors.add('Erreur lors de l\'insertion du matériau ${material.name}: $e');
        }
      }
    } catch (e) {
      errors.add('Erreur générale lors de la sauvegarde: $e');
    }

    return errors;
  }

  /// Sauvegarde une image dans la base locale
  /// 
  /// [interventionId] : L'ID de l'intervention associée
  /// [imagePath] : Le chemin de l'image à sauvegarder
  /// [source] : La source de l'image (caméra ou galerie)
  /// [imageService] : Le service d'images (optionnel, sera récupéré depuis le ref si non fourni)
  /// 
  /// Retourne true si la sauvegarde a réussi, false sinon
  Future<bool> saveImage({
    required String interventionId,
    required String imagePath,
    required ImageSource source,
    ImageLocalService? imageService,
  }) async {
    try {
      // Utiliser le service fourni ou le récupérer depuis le ref
      // Vérifier que le ref est toujours monté avant de l'utiliser
      final service = imageService ?? 
          (ref.mounted ? ref.read(imageLocalServiceProvider) : null);
      
      if (service == null) {
        print('Impossible de sauvegarder l\'image : service non disponible');
        return false;
      }

      // Lire le fichier image
      final imageFile = File(imagePath);
      if (!await imageFile.exists()) {
        print('Le fichier image n\'existe pas: $imagePath');
        return false;
      }

      // Lire les bytes de l'image
      final imageBytes = await imageFile.readAsBytes();
      
      // Convertir en base64
      final base64Image = base64Encode(imageBytes);
      
      // Générer un nom de fichier unique
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final extension = imagePath.split('.').last;
      final filename = 'photo_$timestamp.$extension';

      // Créer le DTO de l'image
      final imageDto = ImageDto(
        filename: filename,
        data: base64Image,
        idIntervention: interventionId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isSync: false,
      );

      await service.insertOnly(imageDto);

      return true;
    } catch (e, stackTrace) {
      print('Erreur lors de l\'insertion de l\'image: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }

  /// Supprime une image de la base locale
  /// 
  /// [localId] : L'ID local de l'image à supprimer
  /// 
  /// Retourne true si la suppression a réussi, false sinon
  Future<bool> deleteImage(int localId) async {
    try {
      // Capturer le service AVANT les opérations asynchrones
      final imageService = ref.read(imageLocalServiceProvider);
      return await imageService.delete(localId);
    } catch (e) {
      print('Erreur lors de la suppression de l\'image: $e');
      return false;
    }
  }

  /// Sauvegarde un document dans la base locale
  /// 
  /// [interventionId] : L'ID de l'intervention associée
  /// [filePath] : Le chemin du fichier PDF à sauvegarder
  /// [documentService] : Le service de documents (optionnel, sera récupéré depuis le ref si non fourni)
  /// 
  /// Retourne true si la sauvegarde a réussi, false sinon
  Future<bool> saveDocument({
    required String interventionId,
    required String filePath,
    DocumentLocalService? documentService,
  }) async {
    try {
      // Utiliser le service fourni ou le récupérer depuis le ref
      // Vérifier que le ref est toujours monté avant de l'utiliser
      final service = documentService ?? 
          (ref.mounted ? ref.read(documentLocalServiceProvider) : null);
      
      if (service == null) {
        print('Impossible de sauvegarder le document : service non disponible');
        return false;
      }

      // Lire le fichier PDF
      final file = File(filePath);
      if (!await file.exists()) {
        print('Le fichier PDF n\'existe pas: $filePath');
        return false;
      }

      // Lire les bytes du fichier
      final fileBytes = await file.readAsBytes();
      
      // Convertir en base64
      final base64Data = base64Encode(fileBytes);
      
      // Extraire le nom du fichier
      final filename = filePath.split('/').last;

      // Créer le DTO du document
      final documentDto = DocumentDto(
        filename: filename,
        data: base64Data,
        idIntervention: interventionId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isSync: false,
      );

      await service.insertOnly(documentDto);

      return true;
    } catch (e, stackTrace) {
      print('Erreur lors de l\'insertion du document: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }

  /// Supprime un document de la base locale
  /// 
  /// [localId] : L'ID local du document à supprimer
  /// 
  /// Retourne true si la suppression a réussi, false sinon
  Future<bool> deleteDocument(int localId) async {
    try {
      // Capturer le service AVANT les opérations asynchrones
      final documentService = ref.read(documentLocalServiceProvider);
      return await documentService.delete(localId);
    } catch (e) {
      print('Erreur lors de la suppression du document: $e');
      return false;
    }
  }

  /// Sauvegarde un commentaire dans la base locale
  /// 
  /// [interventionId] : L'ID de l'intervention associée
  /// [message] : Le message du commentaire
  /// [imagePath] : Le chemin de l'image en pièce jointe (optionnel)
  /// [commentService] : Le service de commentaires (optionnel, sera récupéré depuis le ref si non fourni)
  /// 
  /// Retourne true si la sauvegarde a réussi, false sinon
  Future<bool> saveComment({
    required String interventionId,
    required String message,
    String? imagePath,
    CommentLocalService? commentService,
  }) async {
    try {
      // Utiliser le service fourni ou le récupérer depuis le ref
      // Vérifier que le ref est toujours monté avant de l'utiliser
      final service = commentService ?? 
          (ref.mounted ? ref.read(commentLocalServiceProvider) : null);
      
      if (service == null) {
        print('Impossible de sauvegarder le commentaire : service non disponible');
        return false;
      }

      String? attachmentData;
      String? attachmentFilename;

      // Si une image est fournie, la convertir en base64
      if (imagePath != null && imagePath.isNotEmpty) {
        final imageFile = File(imagePath);
        if (await imageFile.exists()) {
          final imageBytes = await imageFile.readAsBytes();
          attachmentData = base64Encode(imageBytes);
          attachmentFilename = imagePath.split('/').last;
        }
      }

      // Formater la date actuelle
      final now = DateTime.now();
      final dateStr = DateFormat('dd/MM/yyyy').format(now);

      // Créer le DTO du commentaire
      final commentDto = CommentDto(
        message: message,
        attachmentData: attachmentData,
        attachmentFilename: attachmentFilename,
        idIntervention: interventionId,
        date: dateStr,
        createdAt: now,
        updatedAt: now,
        isSync: false,
      );

      await service.insertOnly(commentDto);

      return true;
    } catch (e, stackTrace) {
      print('Erreur lors de l\'insertion du commentaire: $e');
      print('Stack trace: $stackTrace');
      return false;
    }
  }

  /// Supprime un commentaire de la base locale
  /// 
  /// [localId] : L'ID local du commentaire à supprimer
  /// 
  /// Retourne true si la suppression a réussi, false sinon
  Future<bool> deleteComment(int localId) async {
    try {
      // Capturer le service AVANT les opérations asynchrones
      final commentService = ref.read(commentLocalServiceProvider);
      return await commentService.delete(localId);
    } catch (e) {
      print('Erreur lors de la suppression du commentaire: $e');
      return false;
    }
  }

  /// Valide et sauvegarde une signature
  /// 
  /// [interventionId] : L'ID de l'intervention associée
  /// [signatureBytes] : Les bytes de la signature (PNG)
  /// [signatureService] : Le service de signatures (optionnel, sera récupéré depuis le ref si non fourni)
  /// [interventionService] : Le service d'interventions (optionnel, sera récupéré depuis le ref si non fourni)
  /// [interventionRemoteService] : Le service remote (optionnel, sera récupéré depuis le ref si non fourni)
  /// 
  /// Retourne true si la validation et la sauvegarde ont réussi, false sinon
  /// Lance une exception si aucune timesheet n'est présente
  Future<bool> validateAndSaveSignature({
    required String interventionId,
    required Uint8List signatureBytes,
    SignatureLocalService? signatureService,
    InterventionLocalService? interventionService,
    InterventionRemoteService? interventionRemoteService,
  }) async {
    try {
      // Capturer les services AVANT les opérations asynchrones
      final SignatureLocalService service = signatureService ?? ref.read(signatureLocalServiceProvider);
      final timesheetService = ref.read(timesheetLocalServiceProvider);
      final InterventionLocalService interventionLocalService = interventionService ?? ref.read(interventionLocalServiceProvider);
      final InterventionRemoteService remoteService = interventionRemoteService ?? ref.read(interventionRemoteServiceProvider);
      
      // Vérifier qu'il y a au moins une timesheet
      final timesheets = await timesheetService.findByInterventionId(interventionId);
      
      if (timesheets.isEmpty) {
        throw Exception('Impossible de valider la signature : aucune feuille de temps enregistrée pour cette intervention');
      }

      // Convertir la signature en base64
      final base64Signature = base64Encode(signatureBytes);
      
      // Générer un nom de fichier unique
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final filename = 'signature_$timestamp.png';

      // Créer le DTO de la signature
      final signatureDto = SignatureDto(
        filename: filename,
        data: base64Signature,
        idIntervention: interventionId,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        isSync: false,
      );

      // Sauvegarder la signature
      await service.insertOnly(signatureDto);

      // Récupérer l'intervention depuis la base locale au lieu d'utiliser build()
      // Cela évite d'utiliser ref après qu'il ait pu être disposé
      final intervention = await interventionLocalService.findByServerId(interventionId);
      if (intervention != null) {
        await updateStatus(
          intervention: intervention,
          newStatus: 3, // Terminé
          interventionRemoteService: remoteService, // Passer le service capturé
        );
      }

      return true;
    } catch (e, stackTrace) {
      print('Erreur lors de la validation de la signature: $e');
      print('Stack trace: $stackTrace');
      rethrow; // Relancer l'exception pour que la vue puisse afficher le message
    }
  }
}

/// Classe utilitaire pour les opérations sur les timesheets
class TimesheetUtils {
  /// Convertit un TimesheetDto en WorkTimeEntry
  /// 
  /// [timesheet] : Le TimesheetDto à convertir
  /// 
  /// Retourne un WorkTimeEntry avec les données formatées
  static WorkTimeEntry timesheetToWorkTimeEntry(TimesheetDto timesheet) {
    // Formater la date
    String formattedDate;
    try {
      // Essayer de parser la date (peut être ISO ou autre format)
      final date = DateTime.parse(timesheet.date);
      formattedDate = DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      // Si le parsing échoue, utiliser la date telle quelle
      formattedDate = timesheet.date;
    }
    
    // Convertir le temps alloué (en heures) en format HH:mm:ss
    final hours = timesheet.timeAllocated.floor();
    final minutes = ((timesheet.timeAllocated - hours) * 60).floor();
    final seconds = (((timesheet.timeAllocated - hours) * 60 - minutes) * 60).floor();
    final formattedTime = '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
    
    return WorkTimeEntry(
      date: formattedDate,
      time: formattedTime,
      description: timesheet.description,
      timesheet: timesheet,
    );
  }
}


