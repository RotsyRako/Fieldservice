import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:image_picker/image_picker.dart';

class AddPhotoBottomSheet extends StatelessWidget {
  const AddPhotoBottomSheet({
    required this.onSelectSource,
    super.key,
  });

  final Function(ImageSource source) onSelectSource;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colors.baseWhite,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Indicateur de drag
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: theme.colors.grey50,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          ThemeText.h5Bold('Sélectionner une source'),
          const ThemeGap.m(),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: ThemeText.bodyMediumSemiBold('Caméra'),
            onTap: () {
              Navigator.of(context).pop();
              onSelectSource(ImageSource.camera);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: ThemeText.bodyMediumSemiBold('Galerie'),
            onTap: () {
              Navigator.of(context).pop();
              onSelectSource(ImageSource.gallery);
            },
          ),
          const ThemeGap.s(),
        ],
      ),
    );
  }
}

