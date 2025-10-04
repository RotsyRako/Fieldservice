import 'dart:io';

import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/models/constant/intervention_status_enum.dart';
import 'package:arkup_edoo/models/constant/priority_enum.dart';
import 'package:arkup_edoo/models/constant/routes.dart';
import 'package:arkup_edoo/models/constant/timer_status.enum.dart';
import 'package:arkup_edoo/models/dto/intervention/commentaire.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:arkup_edoo/presentation/controller/timer.controller.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/widgets/input.widget.dart';
import 'package:arkup_edoo/presentation/widgets/modal/add_time_modal.widget.dart';
import 'package:arkup_edoo/presentation/widgets/running_timer.widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:arkup_edoo/models/constant/strings.dart';
import 'package:intl/intl.dart';
import '../../models/dto/intervention/material.dto.dart';
import '../../models/dto/intervention/material_available.dto.dart';
import 'badge_status_and_distance.widget.dart';
import 'dataRangeDisplay.widget.dart';
import 'package:arkup_edoo/common/icons/custom_icon_icons.dart';

class ExpandableCard {
  static Widget buildCard({
    required BuildContext context,
    required String title,
    required List<InterventionDTO> items,
    bool initiallyExpanded = true,
  }) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          childrenPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,
          title: Row(
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 6),
              Text(
                "(${items.length})",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          children:
              items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                return _buildItemCard(
                  context: context,
                  listInterventions: items,
                  intervention: item,
                  currentIndex: index,
                );
              }).toList(),
        ),
      ),
    );
  }

  static Widget _buildItemCard({
    required BuildContext context,
    required List<InterventionDTO> listInterventions,
    required InterventionDTO intervention,
    required int currentIndex,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          context.pushNamed(
            Routes.details,
            extra: {
              "listIntervention": listInterventions,
              "currentIndex": currentIndex,
            },
          );
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: ThemeColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge & Distance
              BadgeStatusAndDistance(
                status: intervention.status,
                latitude: intervention.lat,
                longitude: intervention.long,
              ),
              const SizedBox(height: 8),
              Text(
                intervention.title,
                style: bodyL.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 4),
              DateRangeDisplay(
                startDate: intervention.dateStart ?? "",
                endDate: intervention.dateEnd ?? "",
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: ThemeColors.violet.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: ThemeColors.violet),
                        SizedBox(width: 5),
                        Text(intervention.priority.toPriority().displayName),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    intervention.customer,
                    style: const TextStyle(color: ThemeColors.gray),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildCardHistoriqueTime({
    required BuildContext context,
    required int status,
    required String interventionId,
    required WidgetRef ref,
    required String title,
    required List<TempsInterventionDTO> items,
    required Function(String, String) onConfirm,
    required Function(TempsInterventionDTO dto) onAdd,
    required Function(TempsInterventionDTO dto) onEdit,
    required Function(TempsInterventionDTO dto) onDelete,
    bool initiallyExpanded = true,
  }) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: ExpansionTile(
            initiallyExpanded: initiallyExpanded,
            tilePadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
            title: Row(
              children: [
                Icon(Icons.access_time_outlined, color: ThemeColors.violet),
                SizedBox(width: 5),
                Text("Temps d'intervention", style: body.bold()),
              ],
            ),
            children: [
              _buildItemCardHistoriqueTimer(
                context: context,
                status: status,
                interventionId: interventionId,
                items: items,
                ref: ref,
                onConfirm: onConfirm,
                onAdd: onAdd,
                onEdit: onEdit,
                onDelete: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildItemCardHistoriqueTimer({
    required BuildContext context,
    required WidgetRef ref,
    required int status,
    required String interventionId,
    required List<TempsInterventionDTO> items,
    required Function(String, String) onConfirm,
    required Function(TempsInterventionDTO dto) onAdd,
    required Function(TempsInterventionDTO dto) onEdit,
    required Function(TempsInterventionDTO dto) onDelete,
  }) {
    final timerState = ref.watch(timerNotifierProvider);

    return Column(
      children: [
        if (items.length > 0) ...[
          ...items.map(
            (item) => Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ThemeColors.gray.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge & Distance
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date", style: body.bold()),
                          Text(
                            item.date,
                            style: bodyL.bold().copyWith(
                              color: ThemeColors.gray,
                            ),
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Temps", style: body.bold()),
                          Text(
                            item.temps.toString(),
                            style: bodyL.bold().copyWith(
                              color: ThemeColors.gray,
                            ),
                          ),
                        ],
                      ),

                      if (status != InterventionStatus.completed.id) ...[
                        Row(
                          children: [
                            InkWell(
                              onTap: () => onDelete(item),
                              child: Icon(
                                Icons.delete_outline,
                                color: ThemeColors.gray,
                              ),
                            ),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  builder:
                                      (context) => Padding(
                                        padding: EdgeInsets.only(
                                          bottom:
                                              MediaQuery.of(
                                                context,
                                              ).viewInsets.bottom,
                                        ),
                                        child: AddTimeModal(
                                          initialData:
                                              item, // Passe l'item à éditer
                                          onConfirm: (editedDto) {
                                            onEdit(
                                              editedDto,
                                            ); // Appelle la fonction d'édition
                                          },
                                          onDelete: () {
                                            Navigator.of(context).pop();
                                            onDelete(item);
                                          },
                                        ),
                                      ),
                                );
                              },
                              child: Icon(
                                Icons.edit,
                                color: ThemeColors.violet,
                              ),
                            ),
                          ],
                        ),
                      ] else ...[
                        SizedBox(width: 30),
                      ],
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Description", style: body.bold()),
                  Text(
                    item.description,
                    style: body.bold().copyWith(color: ThemeColors.gray),
                  ),
                ],
              ),
            ),
          ),
        ],

        SizedBox(height: 10),

        if (status != InterventionStatus.completed.id) ...[
          if (timerState.status != TimerStatus.initial &&
              timerState.interventionId == interventionId)
            RunningTimerWidget(onConfirm: onConfirm)
          else
            Button.elevated(
              onPressed: () {
                ref.read(timerNotifierProvider.notifier).startTimer(interventionId);
              },
              buttonTitle: "Démarrer l'intervention",
              height: 50,
              textStyle: const TextStyle(fontSize: 18, color: Colors.white),
              color: ThemeColors.violet,
              icon: const Icon(
                Icons.timer_outlined,
                color: Colors.white,
                size: 18,
              ),
            ),

          const SizedBox(height: 5),
          Button.elevated(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder:
                    (context) => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: AddTimeModal(onConfirm: onAdd),
                    ),
              );
            },
            buttonTitle: "Ajouter un temps passé",
            height: 50,
            textStyle: const TextStyle(fontSize: 18, color: Colors.white),
            color: ThemeColors.darkGray,
            icon: const Icon(Icons.add, color: Colors.white, size: 18),
          ),
        ],
      ],
    );
  }

  static Widget buildCardString({
    required BuildContext context,
    required Widget title,
    required int status,
    required List<String> items,
    required List<MaterialAvailableDTO> materialAvailable,
    required TextEditingController controller,
    required void Function(List<String>) onChanged,
    required bool isEditing,
    required void Function(List<String>) startEdit,
    required void Function(List<String>) cancelEdit,
    required void Function(List<MaterialDTO>) saveEdit,
    bool initiallyExpanded = true,
  }) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: title,
          children: [
            _buildItemCardString(
              items: items,
              onChanged: onChanged,
              controller: controller,
              isEditing: isEditing,
              startEdit: startEdit,
              cancelEdit: cancelEdit,
              saveEdit: saveEdit,
              status: status,
              materialAvailable: materialAvailable
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildItemCardString({
    required List<String> items,
    required int status,
    required void Function(List<String>) onChanged,
    required TextEditingController controller,
    required bool isEditing,
    required void Function(List<String>) startEdit,
    required void Function(List<String>) cancelEdit,
    required void Function(List<MaterialDTO>) saveEdit,
    required List<MaterialAvailableDTO> materialAvailable,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        controller = TextEditingController(text: items.join('\n'));

        return isEditing
            ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    ...items.map(
                          (item) => Row(
                        children: [
                          Text(
                            "• ",
                            style: bodyL.bold().copyWith(
                              color: ThemeColors.darkGray,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              item,
                              style: body.copyWith(color: ThemeColors.darkGray),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        showMaterialSelection(
                          context,
                          items,
                          materialAvailable,
                              (selected) {
                            final selectedMaterials = selected.entries
                                .where((e) => e.value > 0)
                                .map((e) => MaterialDTO(
                              id: e.key.id,
                              name: e.key.name,
                              quantity: e.value.toDouble(),
                            ))
                                .toList();
                            onChanged(selectedMaterials.map((e) => "${e.name} x${e.quantity}").toList());
                            saveEdit(selectedMaterials);
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CustomIcon.pencil,
                            color: ThemeColors.violet,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Modifier la liste",
                            style: body.bold().copyWith(
                              color: ThemeColors.violet,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...items.map(
                  (item) => Row(
                    children: [
                      Text(
                        "• ",
                        style: bodyL.bold().copyWith(
                          color: ThemeColors.darkGray,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item,
                          style: body.copyWith(color: ThemeColors.darkGray),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                if (status != InterventionStatus.completed.id) ...[
                  InkWell(
                    onTap: () {
                      startEdit(items);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          CustomIcon.pencil,
                          color: ThemeColors.violet,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Modifier la liste",
                          style: body.bold().copyWith(
                            color: ThemeColors.violet,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            );
      },
    );
  }

  static Future<void> showMaterialSelection(
      BuildContext context,
      List<String> items,
      List<MaterialAvailableDTO> materialAvailable,
      void Function(Map<MaterialAvailableDTO, int>) onConfirm,
      ) async {

    final Map<MaterialAvailableDTO, int> initialSelected = {};
    for (var item in items) {
      final split = item.split(' x');
      if (split.length == 2) {
        final name = split[0];
        final quantity = int.tryParse(split[1]) ?? 0;

        final material = materialAvailable.firstWhere(
              (m) => m.name == name,
          orElse: () => MaterialAvailableDTO(id: 0, name: name, quantity: 0),
        );
        initialSelected[material] = quantity;
      }
    }

    final Map<MaterialAvailableDTO, int> selectedMaterials = {...initialSelected};

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 500,
                  minHeight: 300,
                  maxWidth: 350,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Le(s) matériel(s) utilisé(s)",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),

                      // Liste scrollable
                      Expanded(
                        child: ListView.builder(
                          itemCount: materialAvailable.length,
                          itemBuilder: (context, index) {
                            final material = materialAvailable[index];
                            final quantity = selectedMaterials[material] ?? 0;

                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(
                                color: quantity > 0
                                    ? Colors.grey.shade200
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      material.name,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.remove),
                                        onPressed: () {
                                          if (quantity > 0) {
                                            setState(() {
                                              selectedMaterials[material] = quantity - 1;
                                            });
                                          }
                                        },
                                      ),
                                      Text(
                                        "$quantity",
                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {
                                          setState(() {
                                            selectedMaterials[material] = quantity + 1;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Boutons Annuler / Confirmer
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Annuler"),
                          ),
                          ElevatedButton(
                            onPressed: selectedMaterials.entries.any((e) => e.value > 0)
                                ? () {
                              Navigator.pop(context);
                              onConfirm(selectedMaterials);
                            }
                                : null,
                            child: const Text("Confirmer"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }



  static Widget buildCardPic({
    required BuildContext context,
    required Widget title,
    required int status,
    required List<String> items,
    required void Function() onAddImage,
    required void Function(String path) onDeleteImage,
    bool initiallyExpanded = true,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: title,
          children: [
            _buildItemCardPic(
              imagePaths: items,
              status: status,
              onAddImage: onAddImage,
              onDeleteImage: onDeleteImage,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildItemCardPic({
    required List<String> imagePaths,
    required int status,
    required VoidCallback onAddImage,
    required void Function(String path) onDeleteImage,
  }) {
    List<String> imagesWithAdd = List<String>.from(imagePaths);

    if (status != InterventionStatus.completed.id) {
      imagesWithAdd.add('__add__');
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: imagesWithAdd.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final path = imagesWithAdd[index];

        if (path == '__add__') {
          return GestureDetector(
            onTap: onAddImage,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.grey.shade100,
              ),
              child: const Center(
                child: Icon(
                  Icons.add_a_photo,
                  size: 30,
                  color: ThemeColors.violet,
                ),
              ),
            ),
          );
        }

        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            if (status != InterventionStatus.completed.id) ...[
              Positioned(
                top: 4,
                right: 4,
                child: GestureDetector(
                  onTap: () => onDeleteImage(path),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.delete,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }

  static Widget buildCardFile({
    required BuildContext context,
    required Widget title,
    required int status,
    required List<String> items,
    required void Function() onAddFile,
    required void Function(String path) onDeleteFile,
    bool initiallyExpanded = true,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ExpansionTile(
          initiallyExpanded: initiallyExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16),
          childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: title,
          children: [
            _buildItemCardFile(
              filePaths: items,
              status: status,
              onAddFile: onAddFile,
              onDeleteFile: onDeleteFile,
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildItemCardFile({
    required List<String> filePaths,
    required int status,
    required VoidCallback onAddFile,
    required void Function(String path) onDeleteFile,
  }) {
    final filesWithAdd = List<String>.from(filePaths);

    if (status != InterventionStatus.completed.id) {
      filesWithAdd.add('__add__');
    }
    return Column(
      children:
          filesWithAdd.map((path) {
            if (path == '__add__') {
              return Button.elevated(
                onPressed: onAddFile,
                buttonTitle: "Ajouter un document",
                color: ThemeColors.darkGray,
                icon: Icon(Icons.post_add_outlined, color: ThemeColors.white),
              );
            }

            final fileName = path.split('/').last;

            return Container(
              margin: const EdgeInsets.only(bottom: 6),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: ThemeColors.violet.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.picture_as_pdf, color: ThemeColors.violet),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      fileName,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (status != InterventionStatus.completed.id) ...[
                    IconButton(
                      onPressed: () => onDeleteFile(path),
                      icon: const Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ],
              ),
            );
          }).toList(),
    );
  }

  static Widget buildCardComment({
    required BuildContext context,
    required Widget title,
    required int status,
    required List<CommentaireDTO> items,
    required void Function(String comment, String? imagePath) onAddComment,
    required void Function(MapEntry<String, String?> entry) onDeleteComment,
    bool initiallyExpanded = true,
  }) {
    final formKey = GlobalKey<FormState>();
    final commentController = TextEditingController();
    String? imagePath;
    bool showForm = false;
    bool shouldValidate = false;

    String? commentValidator(String? value) {
      if (!shouldValidate) return null;
      if (value == null || value.isEmpty) return Strings.common.fieldRequired;
      return null;
    }

    return StatefulBuilder(
      builder: (context, setState) {
        return Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              initiallyExpanded: initiallyExpanded,
              tilePadding: const EdgeInsets.symmetric(horizontal: 16),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 16),
              title: title,
              children: [
                if (showForm)
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // TextFormField(
                        //   controller: commentController,
                        //   decoration: const InputDecoration(labelText: 'Commentaire'),
                        //   validator: (value) => (value == null || value.isEmpty) ? 'Champ requis' : null,
                        // ),
                        Input.textAreaField(
                          label: "Ecrire un message",
                          controller: commentController,
                          validator: commentValidator,
                          suffixIcon: IconButton(
                            icon: Icon(Icons.attach_file_outlined),
                            onPressed: () async {
                              final result = await FilePicker.platform
                                  .pickFiles(type: FileType.image);
                              if (result != null && result.files.isNotEmpty) {
                                setState(
                                  () => imagePath = result.files.first.path,
                                );
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (imagePath != null)
                          Row(
                            children: [
                              const Icon(
                                Icons.image,
                                color: ThemeColors.violet,
                              ),
                              const SizedBox(width: 8),
                              Expanded(child: Text(imagePath!.split('/').last)),
                              IconButton(
                                onPressed: () {
                                  setState(() => imagePath = null);
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),

                        const SizedBox(height: 8),

                        Button.elevated(
                          onPressed: () {
                            setState(() => shouldValidate = true);
                            if (formKey.currentState!.validate()) {
                              onAddComment(commentController.text, imagePath);
                              setState(() {
                                commentController.clear();
                                imagePath = null;
                                showForm = false;
                              });
                            }
                          },
                          buttonTitle: 'Ajouter',
                          height: 45,
                          color: ThemeColors.violet,
                        ),
                        SizedBox(height: 10),
                        Button.elevated(
                          onPressed: () {
                            setState(() {
                              commentController.clear();
                              imagePath = null;
                              showForm = false;
                            });
                          },
                          buttonTitle: 'Annuler',
                          height: 45,
                          color: ThemeColors.violet,
                        ),

                        const Divider(),
                      ],
                    ),
                  ),
                if (status != InterventionStatus.completed.id) ...[
                  Button.elevated(
                    onPressed: () {
                      setState(() {
                        showForm = true;
                      });
                    },
                    buttonTitle: 'Écrire un nouveau message',
                    icon: const Icon(CustomIcon.chat, color: ThemeColors.white),
                    color: ThemeColors.darkGray,
                  ),
                ],
                SizedBox(height: 10),
                _buildItemCardComment(
                  items: items,
                  onDeleteComment: onDeleteComment,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildItemCardComment({
    required List<CommentaireDTO> items,
    required void Function(MapEntry<String, String?> entry) onDeleteComment,
  }) {
    return Column(
      children:
          items.map((entry) {
            final comment = entry.comment;
            final imagePath = entry.pj;
            final fileName = imagePath?.split('/').last;
            final name = entry.user ?? "User";
            final dateTime  = entry.date;

            // Format : 17 Juin 2025 14:27
            final formattedDate = DateFormat("dd MMMM yyyy HH:mm", "fr_FR").format(dateTime);

            return Container(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: ThemeColors.violet,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          name[0],
                          style: bodyL.bold().copyWith(
                            color: ThemeColors.white,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          name,
                          style: body.bold(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        formattedDate,
                        style: body.copyWith(color: ThemeColors.gray),
                      ),
                    ],
                  ),
                  Text(comment, style: body),
                  SizedBox(height: 15),
                  if (imagePath != null) ...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fichier", style: body.bold()),
                        SizedBox(height: 5),
                        Container(
                          decoration: BoxDecoration(
                            color: ThemeColors.violet.withAlpha(50),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.crop_original,
                                color: ThemeColors.violet,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                fileName!,
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            );
          }).toList(),
    );
  }
}
