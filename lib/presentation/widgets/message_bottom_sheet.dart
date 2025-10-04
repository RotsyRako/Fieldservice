import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:flutter/material.dart';
import 'package:arkup_edoo/common/theme/theme.utils.dart';

class MessageBottomSheet extends StatefulWidget {
  const MessageBottomSheet({super.key});

  @override
  State<MessageBottomSheet> createState() => _MessageBottomSheetState();
}

class _MessageBottomSheetState extends State<MessageBottomSheet> {
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Stack(
              children: [
                TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Écrire un message...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 12, right: 48.0),
                  ),
                  maxLines: 5,
                  minLines: 5,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.attach_file,
                      color: ThemeColors.violet,
                    ),
                    onPressed: () {
                      // Handle attachment
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Button.elevated(
            onPressed: () {
              // Handle send
              Navigator.pop(context);
            },
            buttonTitle: 'Ajouter',
            color: ThemeColors.violet,
            height: 50,
            icon: const Icon(Icons.send, color: Colors.white, size: 18),
          ),
          const SizedBox(height: 8),
          Button.elevated(
            onPressed: () {
              Navigator.pop(context);
            },
            buttonTitle: 'Annuler',
            color: ThemeColors.neutral60,
            height: 50,
            textStyle: TextStyle(
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
