import 'package:arkup_edoo/common/utils/app.utils.dart';
import 'package:arkup_edoo/models/dto/intervention/commentaire.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/document.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/material.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/photo.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:arkup_edoo/models/dto/screen/suivi_travail_screen.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/comment_pj_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/comment_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/document_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/material_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/photo_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/signature_synchro.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/synchronisation_request.dto.dart';
import 'package:arkup_edoo/models/dto/synchronisation/timesheet_synchro.dto.dart';
import 'package:arkup_edoo/presentation/controller/home.controller.dart';
import 'package:arkup_edoo/service/applying/local/intervention/comment_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/document_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/intervention_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/material_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/photo_local.sa.dart';
import 'package:arkup_edoo/service/applying/local/intervention/temps_intervention_local.sa.dart';
import 'package:arkup_edoo/service/applying/remote/synchronisation_remote.sa.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:arkup_edoo/presentation/controller/base.controller.dart';
import 'package:go_router/go_router.dart';

// provider.dart
final suiviTravailControllerProvider = StateNotifierProvider.autoDispose.family<
  SuiviTravailController,
  AsyncValue<SuiviScreenDTO>,
  int
>((ref, interventionId) {
  final c = SuiviTravailController(ref);
  // 👉 évite l’assert “Providers are not allowed to modify other providers during leur initialization”
  Future.microtask(() => c.init(interventionId));
  return c;
});

class SuiviTravailController extends BaseController<SuiviScreenDTO> {
  SuiviTravailController(Ref ref) : super(ref, const AsyncValue.loading());

  List<TempsInterventionDTO> listTempsInterventions = [];
  List<PhotoDTO> listPhotos = [];
  List<DocumentDTO> listDocument = [];
  List<CommentaireDTO> listComment = [];
  List<MaterialDTO> listMaterial = [];

  Future<void> init(int interventionId) async {
    await executeAsyncRequest(request: () => getSuiviScreenDTO(interventionId));
  }

  Future<SuiviScreenDTO> getSuiviScreenDTO(int interventionId) async {
    final tempsInterventionSA = ref.read(tempsinterventionLocalSAProvider);
    listTempsInterventions = await tempsInterventionSA.findByInterventionId(
      interventionId,
    );

    final photoSA = ref.read(photoLocalSAProvider);
    listPhotos = await photoSA.findByInterventionId(interventionId);

    final documentSA = ref.read(documentLocalSAProvider);
    listDocument = await documentSA.findByInterventionId(interventionId);

    final commentSA = ref.read(commentLocalSAProvider);
    listComment = await commentSA.findByInterventionId(interventionId);

    final materialSA = ref.read(materialLocalSAProvider);
    listMaterial = await materialSA.findByInterventionId(interventionId);

    return SuiviScreenDTO(
      tempsIntervention: listTempsInterventions,
      photos: listPhotos,
      documents: listDocument,
      comments: listComment,
      materials: listMaterial,
    );
  }

  Future<void> saveTimer(
    TempsInterventionDTO dto,
    InterventionDTO intervention,
  ) async {
    final localSA = ref.read(tempsinterventionLocalSAProvider);

    final isConnected = await ref.read(connectionStatusProvider.future);

    setLoading(show: true);
    try {
      await localSA.insertOrUpdate(
        data: isConnected ? dto.copyWith(isSync: true) : dto,
        completion: (ok) async {
          if (!ok) {
            showSnackbar(
              "Erreur lors de l'enregistrement du temps",
              isError: true,
            );
            return;
          }

          showSnackbar("Temps d'intervention enregistré dans la base locale");

          if (isConnected) {
            final result = await synchro();

            if (result) {
              updateIntervention(intervention, true);
              showSnackbar("Intervention synchronisé");
            } else {
              showSnackbar("Échec de la synchronisation", isError: true);
            }
          } else {
            updateIntervention(intervention, false);
          }
        },
      );
    } catch (e) {
      showSnackbar("Temps d'intervention non ajouté", isError: true);
      print("❌ saveTimer exception: $e");
    } finally {
      // setLoading(show: false);
    }
  }

  Future<void> deleteTimer(TempsInterventionDTO dto, InterventionDTO intervention) async {
    final sa = ref.read(tempsinterventionLocalSAProvider);
    try {
      await sa
          .delete(dto.localId!)
          .then((res) async {

            if(res) {
              final isConnected = await ref.read(
                connectionStatusProvider.future,
              );

              if (isConnected) {
                final result = await synchro();

                if (result) {
                  updateIntervention(intervention, true);
                  showSnackbar("Intervention synchronisé");
                } else {
                  showSnackbar("Échec de la synchronisation", isError: true);
                }
              } else {
                updateIntervention(intervention, false);
              }
            }
            showSnackbar("Temps d'intervention supprime");
          })
          .catchError((error) {
            showSnackbar(
              "Erreur lors de la suppression du temps",
              isError: true,
            );
            print("❌ deleteTimer error: $error");
          });
    } catch (e) {
      showSnackbar("Temps d'intervention non supprime", isError: true);
      print("❌ saveTimer exception: $e");
    }
  }

  Future<void> savePhoto(PhotoDTO dto, InterventionDTO intervention) async {
    final localSA = ref.read(photoLocalSAProvider);
    final isConnected = await ref.read(connectionStatusProvider.future);
    setLoading(show: true); // Affiche le loader

    try {
      await localSA.insertOrUpdate(
        data: isConnected ? dto.copyWith(isSync: true) : dto,
        completion: (ok) async {
          if (!ok) {
            showSnackbar(
              "Erreur lors de l'enregistrement de la photo",
              isError: true,
            );
            return;
          }

          if (isConnected) {
            final result = await synchro();

            if (result) {
              updateIntervention(intervention, true);
              showSnackbar("Intervention synchronisé");
            } else {
              showSnackbar("Échec de la synchronisation", isError: true);
            }
          } else {
            updateIntervention(intervention, false);
          }
        },
      );
    } catch (e) {
      showSnackbar("Photo non ajoutée", isError: true);
      print("❌ savePhoto exception: $e");
    } finally {
      setLoading(show: false); // Masque le loader
    }
  }

  Future<void> saveDocument(
    DocumentDTO dto,
    InterventionDTO intervention,
  ) async {
    final localSA = ref.read(documentLocalSAProvider);
    final isConnected = await ref.read(connectionStatusProvider.future);

    setLoading(show: true); // Affiche le loader

    try {
      await localSA.insertOrUpdate(
        data: isConnected ? dto.copyWith(isSync: true) : dto,
        completion: (ok) async {
          if (!ok) {
            showSnackbar(
              "Erreur lors de l'enregistrement du document",
              isError: true,
            );
            return;
          }

          final isConnected = await ref.read(connectionStatusProvider.future);

          if (isConnected) {
            final result = await synchro();

            if (result) {
              updateIntervention(intervention, true);
              showSnackbar("Intervention synchronisé");
            } else {
              showSnackbar("Échec de la synchronisation", isError: true);
            }
          } else {
            updateIntervention(intervention, false);
          }
        },
      );

      showSnackbar("Document enregistré avec succès");
    } catch (e) {
      showSnackbar("Document non ajouté", isError: true);
      print("❌ saveDocument exception: $e");
    } finally {
      setLoading(show: false); // Masque le loader
    }
  }

  Future<void> saveComment(
    CommentaireDTO dto,
    InterventionDTO intervention,
  ) async {
    final localSA = ref.read(commentLocalSAProvider);

    final isConnected = await ref.read(connectionStatusProvider.future);

    try {
      await localSA
          .insertOrUpdate(
            data: isConnected ? dto.copyWith(isSync: true) : dto,
            completion: (ok) async {
              if (!ok) {
                showSnackbar(
                  "Erreur lors de l'enregistrement du commentaire",
                  isError: true,
                );
                return;
              }

              final isConnected = await ref.read(
                connectionStatusProvider.future,
              );

              if (isConnected) {
                final result = await synchro();

                if (result) {
                  updateIntervention(intervention, true);
                  showSnackbar("Intervention synchronisé");
                } else {
                  showSnackbar("Échec de la synchronisation", isError: true);
                }
              } else {
                updateIntervention(intervention, false);
              }
            },
          )
          .then((_) {
            showSnackbar("Commentaire enregistré");
          })
          .catchError((error) {
            showSnackbar(
              "Erreur lors de l'enregistrement du commentaire",
              isError: true,
            );
            print("❌ saveComment error: $error");
          });
    } catch (e) {
      showSnackbar("Commentaire non ajouté", isError: true);
      print("❌ saveComment exception: $e");
    }
  }

  Future<void> saveMaterial(
    List<MaterialDTO> items,
    List<MaterialDTO> firstList,
    InterventionDTO intervention,
  ) async {
    final localSA = ref.read(materialLocalSAProvider);

    final isConnected = await ref.read(connectionStatusProvider.future);

    setLoading(show: true);

    try {
      // ✅ 1. Supprimer les anciens éléments supprimés par l'utilisateur
      for (final old in firstList) {
        if (!items.contains(old.name)) {
          await localSA.delete(old.localId!);
        }
      }

      for (final newItem in items) {
        final exists = firstList.any((m) => m.name == newItem);
        if (!exists) {
          final dto = MaterialDTO(
            id: newItem.id,
            name: newItem.name,
            quantity: newItem.quantity,
            idIntervention: intervention.id,
          );

          await localSA.insertOrUpdate(data: dto);
        }
      }

      if (isConnected) {
        final result = await synchro();

        if (result) {
          updateIntervention(intervention, true);
          showSnackbar("Intervention synchronisé");
        } else {
          showSnackbar("Échec de la synchronisation", isError: true);
        }
      } else {
        updateIntervention(intervention, false);
      }
    } catch (e) {
      showSnackbar(
        "Erreur lors de la mise à jour des matériaux",
        isError: true,
      );
      print("❌ saveMaterial error: $e");
    } finally {
      setLoading(show: false);
    }
  }

  Future<void> deletePhoto(PhotoDTO dto, InterventionDTO intervention) async {
    final sa = ref.read(photoLocalSAProvider);
    try {
      await sa
          .delete(dto.localId!)
          .then((res) async {

            if(res) {
              final isConnected = await ref.read(
                connectionStatusProvider.future,
              );

              if (isConnected) {
                final result = await synchro();

                if (result) {
                  updateIntervention(intervention, true);
                  showSnackbar("Intervention synchronisé");
                } else {
                  showSnackbar("Échec de la synchronisation", isError: true);
                }
              } else {
                updateIntervention(intervention, false);
              }
            }

            showSnackbar("Photo supprimée");
          })
          .catchError((error) {
            showSnackbar(
              "Erreur lors de la suppression de la photo",
              isError: true,
            );
            print("❌ deletePhoto error: $error");
          });
    } catch (e) {
      showSnackbar("Photo non supprimée", isError: true);
      print("❌ deletePhoto exception: $e");
    }
  }

  Future<void> deleteDocument(DocumentDTO dto, InterventionDTO intervention) async {
    final sa = ref.read(documentLocalSAProvider);
    try {
      await sa
          .delete(dto.localId!)
          .then((res) async {
            showSnackbar("Document supprimé");

            if(res) {
              final isConnected = await ref.read(
                connectionStatusProvider.future,
              );

              if (isConnected) {
                final result = await synchro();

                if (result) {
                  updateIntervention(intervention, true);
                  showSnackbar("Intervention synchronisé");
                } else {
                  showSnackbar("Échec de la synchronisation", isError: true);
                }
              } else {
                updateIntervention(intervention, false);
              }
            }
          })
          .catchError((error) {
            showSnackbar(
              "Erreur lors de la suppression du document",
              isError: true,
            );
            print("❌ deleteDocument error: $error");
          });
    } catch (e) {
      showSnackbar("Document non supprimé", isError: true);
      print("❌ deleteDocument exception: $e");
    }
  }

  Future<void> deleteComment(CommentaireDTO dto, InterventionDTO intervention) async {
    final sa = ref.read(commentLocalSAProvider);
    try {
      await sa
          .delete(dto.localId!)
          .then((res) async  {
            showSnackbar("Commentaire supprimé");

            if(res) {
              final isConnected = await ref.read(
                connectionStatusProvider.future,
              );

              if (isConnected) {
                final result = await synchro();

                if (result) {
                  updateIntervention(intervention, true);
                  showSnackbar("Intervention synchronisé");
                } else {
                  showSnackbar("Échec de la synchronisation", isError: true);
                }
              } else {
                updateIntervention(intervention, false);
              }
            }
          })
          .catchError((error) {
            showSnackbar(
              "Erreur lors de la suppression du commentaire",
              isError: true,
            );
            print("❌ deleteComment error: $error");
          });
    } catch (e) {
      showSnackbar("Commentaire non supprimé", isError: true);
      print("❌ deleteComment exception: $e");
    }
  }

  Future<void> deleteMaterial(MaterialDTO dto, InterventionDTO intervention) async {
    final sa = ref.read(materialLocalSAProvider);
    try {
      await sa
          .delete(dto.localId!)
          .then((res) async {
            showSnackbar("Matériau supprimé");

            if(res) {
              final isConnected = await ref.read(
                connectionStatusProvider.future,
              );

              if (isConnected) {
                final result = await synchro();

                if (result) {
                  updateIntervention(intervention, true);
                  showSnackbar("Intervention synchronisé");
                } else {
                  showSnackbar("Échec de la synchronisation", isError: true);
                }
              } else {
                updateIntervention(intervention, false);
              }
            }
          })
          .catchError((error) {
            showSnackbar(
              "Erreur lors de la suppression du matériau",
              isError: true,
            );
            print("❌ deleteMaterial error: $error");
          });
    } catch (e) {
      showSnackbar("Matériau non supprimé", isError: true);
      print("❌ deleteMaterial exception: $e");
    }
  }

  updateIntervention(InterventionDTO intervention, bool status) async {
    final homeController = ref.read(homeControllerProvider.notifier);
    final updatedIntervention = intervention.copyWith(isSync: status);
    homeController.updateInterventionInList(updatedIntervention);
  }
}
