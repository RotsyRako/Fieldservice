import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/common/theme/widgets/theme_reactive_text_field.dart';
import 'package:field_service/src/models/dto/timesheet/timesheet_dto.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

enum AddTimeFormFields {
  date,
  timeSpent,
  description,
}

FormGroup addTimeForm({
  required String date,
  required String timeSpent,
}) {
  return FormGroup({
    AddTimeFormFields.date.name: FormControl<String>(
      value: date,
      validators: [Validators.required],
    ),
    AddTimeFormFields.timeSpent.name: FormControl<String>(
      value: timeSpent,
      validators: [Validators.required],
    ),
    AddTimeFormFields.description.name: FormControl<String>(
      value: null,
    ),
  });
}

class AddTimeBottomSheet extends StatefulWidget {
  const AddTimeBottomSheet({
    required this.duration,
    required this.onSave,
    this.allowManualEdit = false,
    this.timesheetToEdit,
    super.key,
  });

  final Duration duration;
  final Function(String date, String timeSpent, String? description) onSave;
  final bool allowManualEdit;
  final TimesheetDto? timesheetToEdit;

  @override
  State<AddTimeBottomSheet> createState() => _AddTimeBottomSheetState();
}

class _AddTimeBottomSheetState extends State<AddTimeBottomSheet> {
  late final FormGroup _form;

  String _formatDuration(Duration duration) {
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  void initState() {
    super.initState();
    
    String date;
    String timeSpent;
    
    // Si on est en mode édition, pré-remplir avec les données du timesheet
    if (widget.timesheetToEdit != null) {
      final timesheet = widget.timesheetToEdit!;
      
      // Formater la date
      try {
        final dateTime = DateTime.parse(timesheet.date);
        date = _formatDate(dateTime);
      } catch (e) {
        // Si le parsing échoue, utiliser la date telle quelle
        date = timesheet.date;
      }
      
      // Convertir le temps alloué (en heures) en format HH:mm:ss
      final hours = timesheet.timeAllocated.floor();
      final minutes = ((timesheet.timeAllocated - hours) * 60).floor();
      final seconds = (((timesheet.timeAllocated - hours) * 60 - minutes) * 60).floor();
      timeSpent = '${hours.toString().padLeft(2, '0')}:'
          '${minutes.toString().padLeft(2, '0')}:'
          '${seconds.toString().padLeft(2, '0')}';
    } else {
      // Mode création : utiliser la date actuelle et la durée fournie
      final today = DateTime.now();
      date = _formatDate(today);
      timeSpent = _formatDuration(widget.duration);
    }
    
    _form = addTimeForm(date: date, timeSpent: timeSpent);
    
    // Si on est en mode édition, pré-remplir aussi la description
    if (widget.timesheetToEdit != null) {
      _form.control(AddTimeFormFields.description.name).value = 
          widget.timesheetToEdit!.description;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    // Parser la date actuelle du formulaire
    final currentDateStr = _form.control(AddTimeFormFields.date.name).value as String?;
    DateTime initialDate = DateTime.now();
    
    if (currentDateStr != null) {
      try {
        // Essayer de parser la date au format dd/MM/yyyy
        initialDate = DateFormat('dd/MM/yyyy').parse(currentDateStr);
      } catch (e) {
        // Si le parsing échoue, utiliser la date actuelle
        initialDate = DateTime.now();
      }
    }
    
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      locale: const Locale('fr', 'FR'),
    );
    
    if (picked != null) {
      final formattedDate = _formatDate(picked);
      _form.control(AddTimeFormFields.date.name).value = formattedDate;
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    // Parser le temps actuel du formulaire
    final currentTimeStr = _form.control(AddTimeFormFields.timeSpent.name).value as String?;
    TimeOfDay initialTime = TimeOfDay.now();
    
    if (currentTimeStr != null) {
      try {
        // Parser le format HH:mm:ss
        final parts = currentTimeStr.split(':');
        if (parts.length >= 2) {
          final hour = int.parse(parts[0]);
          final minute = int.parse(parts[1]);
          initialTime = TimeOfDay(hour: hour, minute: minute);
        }
      } catch (e) {
        // Si le parsing échoue, utiliser l'heure actuelle
        initialTime = TimeOfDay.now();
      }
    }
    
    final picked = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    
    if (picked != null) {
      // Convertir en format HH:mm:ss
      final formattedTime = '${picked.hour.toString().padLeft(2, '0')}:'
          '${picked.minute.toString().padLeft(2, '0')}:00';
      _form.control(AddTimeFormFields.timeSpent.name).value = formattedTime;
    }
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  void _handleSave(FormGroup formGroup) {
    if (formGroup.invalid) {
      formGroup.markAllAsTouched();
      return;
    }

    // Récupérer les valeurs directement depuis les FormControl
    // pour éviter les problèmes avec les champs désactivés
    final dateControl = formGroup.control(AddTimeFormFields.date.name) as FormControl<String>;
    final timeSpentControl = formGroup.control(AddTimeFormFields.timeSpent.name) as FormControl<String>;
    final descriptionControl = formGroup.control(AddTimeFormFields.description.name) as FormControl<String>;
    
    final date = dateControl.value ?? '';
    final timeSpent = timeSpentControl.value ?? '';
    final description = descriptionControl.value;
    
    // Vérifier que les champs requis ne sont pas vides
    if (date.isEmpty || timeSpent.isEmpty) {
      formGroup.markAllAsTouched();
      return;
    }
    
    final trimmedDescription = description?.trim();
    final finalDescription = trimmedDescription?.isEmpty == true
        ? null
        : trimmedDescription;
    
    widget.onSave(date, timeSpent, finalDescription);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
      decoration: BoxDecoration(
        color: theme.colors.baseWhite,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: ReactiveForm(
        formGroup: _form,
        child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // En-tête avec bouton retour et titre
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.of(context).pop(),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                    const ThemeGap.s(),
                    ThemeText.h5Bold(
                      widget.timesheetToEdit != null 
                          ? 'Modifier un temps' 
                          : 'Ajouter un temps'
                    ),
                  ],
                ),
                const ThemeGap.l(),
                // Champ Date
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    final control = formGroup.control(
                      AddTimeFormFields.date.name,
                    );
                    return ThemeReactiveTextField<String>(
                      formControl: control as FormControl<String>,
                      label: ThemeText.bodySmallBold(
                        'Date',
                        color: theme.colors.baseBlack,
                      ),
                      leadingIcon: Ph.calendar,
                      readOnly: !widget.allowManualEdit,
                      enabled: widget.allowManualEdit,
                      withBorder: true,
                      onTap: widget.allowManualEdit
                          ? (_) => _selectDate(context)
                          : null,
                    );
                  },
                ),
                const ThemeGap.m(),
                // Champ Temps passé
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    final control = formGroup.control(
                      AddTimeFormFields.timeSpent.name,
                    );
                    return ThemeReactiveTextField<String>(
                      formControl: control as FormControl<String>,
                      label: ThemeText.bodySmallBold(
                        'Temps passé',
                        color: theme.colors.baseBlack,
                      ),
                      leadingIcon: Ph.timer,
                      readOnly: !widget.allowManualEdit,
                      enabled: widget.allowManualEdit,
                      withBorder: true,
                      onTap: widget.allowManualEdit
                          ? (_) => _selectTime(context)
                          : null,
                    );
                  },
                ),
                const ThemeGap.m(),
                // Champ Description (modifiable)
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    final control = formGroup.control(
                      AddTimeFormFields.description.name,
                    );
                    return ThemeReactiveTextField<String>(
                      formControl: control as FormControl<String>,
                      label: ThemeText.bodySmallBold(
                        'Description',
                        color: theme.colors.baseBlack,
                      ),
                      leadingIcon: Ph.text_align_justify,
                      hint: 'Description du temps',
                      textInputAction: TextInputAction.done,
                      withBorder: true,
                    );
                  },
                ),
                const ThemeGap.l(),
                // Bouton Ajouter le temps
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) {
                    return ThemeButton.primary(
                      label: widget.timesheetToEdit != null 
                          ? 'Modifier le temps' 
                          : 'Ajouter le temps',
                      onPressed: formGroup.valid
                          ? () => _handleSave(formGroup)
                          : null,
                      fullWidth: true,
                      radius: BorderRadius.circular(8),
                      horizontalPadding: 12,
                      verticalPadding: 12,
                    );
                  },
                ),
              ],
            ),
          ),
      ),
    );
  }
}

