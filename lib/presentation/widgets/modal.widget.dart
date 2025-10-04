import 'package:arkup_edoo/common/icons/custom_icon_icons.dart';
import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/widgets/input.widget.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class Modal {
  static Widget buildConfirmTime({
    required BuildContext context,
    required String time,
    required void Function(String description) onConfirm,
    void Function()? onDelete,
  }) {
    final TextEditingController timeController = TextEditingController(
      text: time,
    );
    final TextEditingController descriptionController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: StatefulBuilder(
        builder: (context, setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const Text(
                    'Confirmer le temps',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.purple),
                    onPressed: onDelete ?? () {},
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Input.textFormField(
                controller: timeController,
                prefixIcon: const Icon(
                  Icons.timer_outlined,
                  color: Colors.purple,
                ),
                enabled: false,
              ),
              const SizedBox(height: 16),
              Input.textFormField(
                controller: descriptionController,
                withLabel: false,
                label: 'Description du temps',
                prefixIcon: const Icon(
                  CustomIcon.text_align_justify,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 24),
              Button.elevated(
                onPressed: () {
                  Navigator.of(context).pop(); // Ferme le modal
                  onConfirm(descriptionController.text);
                },
                buttonTitle: 'Ajouter le temps',
                isGradient: true,
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget buildAddTime({
  required BuildContext context,
  required void Function(TempsInterventionDTO temps) onConfirm,
  void Function()? onDelete,
}) {
  // Ces controllers sont créés UNE SEULE FOIS quand buildAddTime est appelé
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  return StatefulBuilder(
    builder: (context, setState) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                const Text(
                  'Ajouter le temps',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Date picker
            InkWell(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  dateController.text = "${picked.day}/${picked.month}/${picked.year}";
                  setState(() {});
                }
              },
              child: Input.textFormField(
                controller: dateController,
                prefixIcon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.purple,
                ),
                enabled: false,
                label: "Date",
                withLabel: false,
              ),
            ),
            const SizedBox(height: 16),

            // Duration picker
            InkWell(
              onTap: () async {
                final duration = await showDurationPicker(
                  context: context,
                  initialTime: const Duration(),
                );
                if (duration != null) {
                  timeController.text = _formatDuration(duration);
                  setState(() {});
                }
              },
              child: Input.textFormField(
                controller: timeController,
                prefixIcon: const Icon(
                  Icons.timer_outlined,
                  color: Colors.purple,
                ),
                enabled: false,
                label: "Temps passé",
                withLabel: false,
              ),
            ),
            const SizedBox(height: 16),

            // Description
            Input.textFormField(
              controller: descriptionController,
              withLabel: false,
              label: 'Description du temps',
              prefixIcon: const Icon(
                Icons.menu_outlined,
                color: Colors.purple,
              ),
            ),

            const SizedBox(height: 24),

            Button.elevated(
              onPressed: () {
                final dto = TempsInterventionDTO(
                  date: dateController.text,
                  temps: timeController.text,
                  description: descriptionController.text,
                  idIntervention: 0,
                );
                context.pop();
                onConfirm(dto);
              },
              buttonTitle: 'Ajouter le temps',
              isGradient: true,
            ),
          ],
        ),
      );
    },
  );
}

  static String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }
}
