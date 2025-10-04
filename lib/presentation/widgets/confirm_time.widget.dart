import 'package:arkup_edoo/models/dto/intervention/temps_intervention.dto.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/widgets/input.widget.dart';
import 'package:flutter/material.dart';

class ConfirmTimeWidget extends StatefulWidget {
  final String time;
  final void Function(String, String) onConfirm;

  const ConfirmTimeWidget({
    super.key,
    required this.time,
    required this.onConfirm,
  });

  @override
  State<ConfirmTimeWidget> createState() => _ConfirmTimeWidgetState();
}

class _ConfirmTimeWidgetState extends State<ConfirmTimeWidget> {
  late TextEditingController _timeController;
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _timeController = TextEditingController(text: widget.time);
  }

  @override
  void dispose() {
    _timeController.dispose();
    _descriptionController.dispose();
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
                onPressed: () {
                  Navigator.of(context).pop(); // Ferme aussi le modal
                },
              ),
            ],
          ),
          const SizedBox(height: 24),
          Input.textFormField(
            controller: _timeController,
            prefixIcon: const Icon(Icons.timer_outlined, color: Colors.purple),
            enabled: false,
          ),
          const SizedBox(height: 16),
          Input.textFormField(
            controller: _descriptionController,
            withLabel: false,
            label: 'Description du temps',
            prefixIcon: const Icon(
              Icons.description_outlined,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 24),
          Button.elevated(
            onPressed: () {
              final dto = TempsInterventionDTO(
                date: DateTime.now().toString(),
                temps: _timeController.text,
                description: _descriptionController.text,
                idIntervention: 0
              );
              Navigator.of(context).pop(); // Ferme la modal
              widget.onConfirm(_descriptionController.text, _timeController.text); // Appel du callback
            },
            buttonTitle: 'Ajouter le temps',
            isGradient: true,
          ),
        ],
      ),
    );
  }
}
