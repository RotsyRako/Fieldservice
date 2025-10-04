import 'package:arkup_edoo/repository/remote/base_remote.repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DisconnectModal extends StatelessWidget {
  final WidgetRef ref;
  final BuildContext context;

  const DisconnectModal({
    super.key,
    required this.ref,
    required this.context,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.only(top: 16, left: 24, right: 24, bottom: 16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [        
          const Text(
            'Confirmation',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Êtes-vous sûr de vouloir vous déconnecter ?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                      
                    ),
                  ),
                  child: const Text('Annuler'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop(true);
                    final storage = ref.read(secureStorageProvider);
                    await storage.deleteTokens();
                    
                    if (context.mounted) {
                      context.go('/login');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Se déconnecter',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Future<bool?> show({
    required WidgetRef ref,
    required BuildContext context,
  }) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => DisconnectModal(ref: ref, context: context),
    );
  }
}