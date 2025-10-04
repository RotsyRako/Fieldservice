import 'dart:io';

import 'package:arkup_edoo/models/constant/intervention_status_enum.dart';
import 'package:arkup_edoo/presentation/controller/home.controller.dart';
import 'package:arkup_edoo/service/applying/local/intervention/material_local.sa.dart';

import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/models/dto/intervention/commentaire.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/document.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/photo.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:arkup_edoo/models/dto/screen/suivi_travail_screen.dto.dart';
import 'package:arkup_edoo/presentation/controller/suivi_travail.controller.dart';
import 'package:arkup_edoo/presentation/views/base.view.dart';
import 'package:arkup_edoo/presentation/widgets/expandableCard.widget.dart';
import 'package:arkup_edoo/service/technical/connection.st.dart';

import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:arkup_edoo/common/icons/custom_icon_icons.dart';

import '../../models/dto/intervention/material_available.dto.dart';
import '../../service/applying/local/intervention/material_available_local.sa.dart';

class SuiviTravailScreen extends BaseScreen<SuiviScreenDTO> {
  const SuiviTravailScreen({super.key, required this.intervention});

  final InterventionDTO intervention;

  @override
  AsyncValue<SuiviScreenDTO> buildState(WidgetRef ref) {
    return ref.watch(suiviTravailControllerProvider(intervention.localId!));
  }

  

  @override
  Widget buildSuccess(
    BuildContext context,
    WidgetRef ref,
    SuiviScreenDTO data,
  ) {

    final controller = ref.read(suiviTravailControllerProvider(intervention.localId!).notifier);
    final homecontroller = ref.read(homeControllerProvider.notifier);

     ref.listen<AsyncValue<bool>>(connectionStatusProvider, (previous, next) async {
      final isConnected = next.maybeWhen(
        data: (value) => value,
        orElse: () => false,
      );

      if (isConnected) {
        print("Connected =========== ");

        controller.setLoading(show: true, message: "Synchronisation");
        await controller.synchro();
        await controller.updateIntervention(intervention, true);
        await homecontroller.fetchInterventions();
        controller.setLoading(show: false, message: "");
        
      }else{
        print("no internet =========== ");
      }
    });

    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          _TimerCard(intervention: intervention),
          _MaterialCard(intervention: intervention),
          const SizedBox(height: 10),
          _PhotoCard(intervention: intervention),
          const SizedBox(height: 10),
          _FileCard(intervention: intervention),
          const SizedBox(height: 10),
          _CommentCard(intervention: intervention),
        ],
      ),
    );
  }
}

class _TimerCard extends ConsumerWidget {
  const _TimerCard({required this.intervention});

  final InterventionDTO intervention;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(suiviTravailControllerProvider(intervention.localId!).notifier);
    final tempsInterventions = ref.watch(suiviTravailControllerProvider(intervention.localId!)
        .select((data) => data.value?.tempsIntervention ?? []));

    return ExpandableCard.buildCardHistoriqueTime(
        context: context,
        status: intervention.status,
        interventionId: intervention.localId.toString(),
        ref: ref,
        title: "Temps d'intervention",
        items: tempsInterventions,
        onConfirm: (description, duration) async {
           final formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
          final nouveauTemps = TempsInterventionDTO(
              date: formattedDate,
              temps: duration,
              description: description,
              idIntervention: intervention.localId!,
            );
            await controller.saveTimer(nouveauTemps, intervention);
            ref.invalidate(suiviTravailControllerProvider(intervention.localId!));
        },
        onAdd: (dto) async {
          final nouveauTemps = TempsInterventionDTO(
            date: dto.date,
            temps: dto.temps,
            description: dto.description,
            idIntervention: intervention.localId!,
          );
          await controller.saveTimer(nouveauTemps, intervention);
          ref.invalidate(suiviTravailControllerProvider(intervention.localId!));
        },
        onEdit: (dto) async {
          await controller.saveTimer(dto, intervention);
          ref.invalidate(suiviTravailControllerProvider(intervention.localId!));
        },
        onDelete: (timer) async {
          await controller.deleteTimer(timer, intervention);
          ref.invalidate(suiviTravailControllerProvider(intervention.localId!));
        });
  }
}

class _MaterialCard extends ConsumerStatefulWidget {
  const _MaterialCard({required this.intervention});

  final InterventionDTO intervention;

  @override
  ConsumerState<_MaterialCard> createState() => _MaterialCardState();
}

class _MaterialCardState extends ConsumerState<_MaterialCard> {
  bool isEditing = false;
  late List<String> materials;
  final TextEditingController materielController = TextEditingController();

  List<MaterialAvailableDTO> materialAvailables = [];

  @override
  void initState() {
    super.initState();
    _loadMaterials();
  }

  Future<void> _loadMaterials() async {
    final materialAvailableLocalService = ref.read(materialAvailableLocalSAProvider);
    materialAvailables = await materialAvailableLocalService.findAll();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(suiviTravailControllerProvider(widget.intervention.localId!).notifier);
    final initialMaterials = ref.watch(suiviTravailControllerProvider(widget.intervention.id!).select((data) => data.value?.materials ?? []));
    materials = List.from(initialMaterials.map((item) => "${item.name} x${item.quantity.toInt()}"));

    return ExpandableCard.buildCardString(
      context: context,
      status: widget.intervention.status,
      title: Row(
        children: [
          Icon(CustomIcon.traffic_cone, color: ThemeColors.violet),
          const SizedBox(width: 5),
          Text("Matériels utilisés", style: body.bold()),
        ],
      ),
      items: materials,
      materialAvailable: materialAvailables,
      onChanged: (value) {
        setState(() {
          materials = value;
        });
      },
      controller: materielController,
      isEditing: isEditing,
      startEdit: (items) => setState(() => isEditing = true),
      cancelEdit: (items) => setState(() => isEditing = false),
      saveEdit: (items) async {
        setState(() => isEditing = false);
        await controller.saveMaterial(items, initialMaterials, widget.intervention);
        ref.invalidate(suiviTravailControllerProvider(widget.intervention.localId!));
        ref.invalidate(materialsForInterventionProvider(widget.intervention.localId!));
      },
    );
  }
}

class _PhotoCard extends ConsumerWidget {
  const _PhotoCard({required this.intervention});

  final InterventionDTO intervention;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(suiviTravailControllerProvider(intervention.localId!).notifier);
    final photos = ref.watch(suiviTravailControllerProvider(intervention.localId!).select((data) => data.value?.photos ?? []));
    final imagePaths = photos.map((item) => item.location).toList();
    final picker = ImagePicker();

    return ExpandableCard.buildCardPic(
      context: context,
      status: intervention.status,
      title: Row(
        children: [
          const Icon(CustomIcon.images_square, color: ThemeColors.violet),
          const SizedBox(width: 5),
          Text("Photos", style: body.bold()),
        ],
      ),
      items: imagePaths,
      onAddImage: () async {
        try {
          final XFile? image = await picker.pickImage(source: ImageSource.camera, imageQuality: 25);
          if (image != null) {
            final photo = PhotoDTO(name: image.name, location: image.path, idIntervention: intervention.localId!);
            await controller.savePhoto(photo, intervention);
            ref.invalidate(suiviTravailControllerProvider(intervention.localId!));
          }
        } catch (e) {
          controller.showSnackbar("Image non ajoutée");
        }
      },
      onDeleteImage: (path) {
        final photo = photos.firstWhereOrNull((p) => p.location == path);
        if (photo != null) {
          controller.deletePhoto(photo, intervention).then((_) {
            ref.invalidate(suiviTravailControllerProvider(intervention.localId!));
          });
        }
      },
    );
  }
}

class _FileCard extends ConsumerWidget {
  const _FileCard({required this.intervention});

  final InterventionDTO intervention;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(suiviTravailControllerProvider(intervention.localId!).notifier);
    final documents = ref.watch(suiviTravailControllerProvider(intervention.localId!).select((data) => data.value?.documents ?? []));
    final filePaths = documents.map((item) => item.location).toList();

    return ExpandableCard.buildCardFile(
      context: context,
      status: intervention.status,
      title: Row(
        children: [
          const Icon(CustomIcon.files, color: ThemeColors.violet),
          const SizedBox(width: 5),
          Text("Documents", style: body.bold()),
        ],
      ),
      items: filePaths,
      onAddFile: () async {
        try {
          final result = await FilePicker.platform.pickFiles();
          if (result != null) {
            File file = File(result.files.single.path!);
            final document = DocumentDTO(name: result.files.single.name, location: file.path, idIntervention: intervention.localId!);
            await controller.saveDocument(document, intervention);
            ref.invalidate(suiviTravailControllerProvider(intervention.localId!));
          }
        } catch (e) {
          controller.showSnackbar("Fichier non ajouté");
        }
      },
      onDeleteFile: (path) {
        final document = documents.firstWhereOrNull((d) => d.location == path);
        if (document != null) {
          controller.deleteDocument(document, intervention).then((_) {
            ref.invalidate(suiviTravailControllerProvider(intervention.localId!));
          });
        }
      },
    );
  }
}

class _CommentCard extends ConsumerWidget {
  const _CommentCard({required this.intervention});

  final InterventionDTO intervention;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(suiviTravailControllerProvider(intervention.localId!).notifier);
    final comments = ref.watch(suiviTravailControllerProvider(intervention.localId!).select((data) => data.value?.comments ?? []));

    return ExpandableCard.buildCardComment(
      context: context,
      status: intervention.status,
      title: Row(
        children: [
          const Icon(CustomIcon.chat_dots, color: ThemeColors.violet),
          const SizedBox(width: 5),
          Text("Commentaire", style: body.bold()),
        ],
      ),
      items: comments,
      onAddComment: (comment, imagePath) async {
        CommentaireDTO newComment = CommentaireDTO(
          user: "user",
          comment: comment,
          date: DateTime.now(),
          idIntervention: intervention.localId!,
          pj: imagePath,
        );
        await controller.saveComment(newComment, intervention);
        ref.invalidate(suiviTravailControllerProvider(intervention.localId!));
      },
      onDeleteComment: (entry) {
        // Not implemented in original code
      },
    );
  }
}
