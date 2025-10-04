import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/widgets/input.widget.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

class AddTimeModal extends StatefulWidget {
  final void Function(TempsInterventionDTO temps) onConfirm;
  final void Function()? onDelete;
  final TempsInterventionDTO? initialData; // Nouveau paramètre pour les données existantes

  const AddTimeModal({
    super.key,
    required this.onConfirm,
    this.onDelete,
    this.initialData, // Optionnel - pour l'édition
  });

  @override
  State<AddTimeModal> createState() => _AddTimeModalState();
}

class _AddTimeModalState extends State<AddTimeModal> {
  late final TextEditingController timeController;
  late final TextEditingController dateController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    timeController = TextEditingController(text: widget.initialData?.temps ?? '');
    dateController = TextEditingController(text: widget.initialData?.date ?? '');
    descriptionController = TextEditingController(text: widget.initialData?.description ?? '');
  }

  @override
  void dispose() {
    timeController.dispose();
    dateController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              Text(
                widget.initialData == null ? 'Ajouter le temps' : 'Modifier le temps',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              if (widget.initialData != null && widget.onDelete != null) ...[
                Spacer(),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: widget.onDelete,
                ),
              ],
            ],
          ),
          const SizedBox(height: 24),

          // Date picker
          InkWell(
            onTap: () async {
              final now = DateTime.now();
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _parseDate(widget.initialData?.date) ?? now,
                firstDate: DateTime(2000),
                lastDate: now, // Ici on utilise la date actuelle comme dernière date possible
              );
              if (picked != null) {
                dateController.text = "${picked.day}/${picked.month}/${picked.year}";
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
                initialTime: _parseDuration(widget.initialData?.temps) ?? Duration(),
              );
              if (duration != null) {
                timeController.text = _formatDuration(duration);
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
                idIntervention: widget.initialData?.idIntervention ?? 0,
                localId: widget.initialData?.localId, // Conserve l'ID pour l'édition
              );
              Navigator.of(context).pop();
              widget.onConfirm(dto);
            },
            buttonTitle: widget.initialData == null ? 'Ajouter le temps' : 'Modifier',
            isGradient: true,
          ),
        ],
      ),
    );
  }

  DateTime? _parseDate(String? dateStr) {
    if (dateStr == null) return null;
    final parts = dateStr.split('/');
    if (parts.length != 3) return null;
    return DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
  }

  Duration? _parseDuration(String? durationStr) {
    if (durationStr == null) return null;
    final parts = durationStr.split(':');
    if (parts.length != 3) return null;
    return Duration(
      hours: int.parse(parts[0]),
      minutes: int.parse(parts[1]),
      seconds: int.parse(parts[2]),
    );
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);

    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }
}