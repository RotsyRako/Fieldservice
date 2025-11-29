import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/models/dto/image/image_dto.dart';

class PhotosSectionWidget extends StatelessWidget {
  const PhotosSectionWidget({
    required this.isExpanded,
    required this.isReadOnly,
    required this.onToggleExpanded,
    required this.images,
    required this.onAddPhoto,
    required this.onDeletePhoto,
    super.key,
  });

  final bool isExpanded;
  final bool isReadOnly;
  final VoidCallback onToggleExpanded;
  final List<ImageDto> images;
  final VoidCallback onAddPhoto;
  final Function(ImageDto image) onDeletePhoto;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Icon(
                    Icons.image,
                    size: 14,
                    color: theme.colors.primary50,
                  ),
                  const ThemeGap.xs(),
                  Expanded(
                    child: ThemeText.bodySmallBold('Photos'),
                  ),
                ],
              ),
            ),
            IconButton(
              iconSize: 16,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
                size: 16,
                color: theme.colors.primary50,
              ),
              onPressed: onToggleExpanded,
            ),
          ],
        ),
        if (isExpanded) ...[
          const ThemeGap.sm(),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              // Carte pour ajouter une photo (masquée si en lecture seule)
              if (!isReadOnly)
                _AddPhotoCard(
                  onTap: onAddPhoto,
                ),
              // Afficher les photos existantes
              ...images.map((image) => _PhotoCard(
                image: image,
                isReadOnly: isReadOnly,
                onDelete: () => onDeletePhoto(image),
              )),
            ],
          ),
        ],
      ],
    );
  }
}

class _AddPhotoCard extends StatelessWidget {
  const _AddPhotoCard({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: theme.colors.grey50.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: theme.colors.grey50.withValues(alpha: 0.2),
            width: 1,
          ),
        ),
        child: Icon(
          Icons.add_photo_alternate_outlined,
          size: 32,
          color: theme.colors.grey50,
        ),
      ),
    );
  }
}

class _PhotoCard extends StatelessWidget {
  const _PhotoCard({
    required this.image,
    required this.isReadOnly,
    required this.onDelete,
  });

  final ImageDto image;
  final bool isReadOnly;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Décoder l'image base64
    Uint8List? imageBytes;
    try {
      imageBytes = base64Decode(image.data);
    } catch (e) {
      print('Erreur lors du décodage de l\'image: $e');
    }

    return Stack(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: theme.colors.grey50.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: imageBytes != null
                ? Image.memory(
                    imageBytes,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: theme.colors.grey50.withValues(alpha: 0.1),
                        child: Icon(
                          Icons.broken_image,
                          size: 32,
                          color: theme.colors.grey50,
                        ),
                      );
                    },
                  )
                : Container(
                    color: theme.colors.grey50.withValues(alpha: 0.1),
                    child: Icon(
                      Icons.image_not_supported,
                      size: 32,
                      color: theme.colors.grey50,
                    ),
                  ),
          ),
        ),
        // Bouton poubelle (masqué si en lecture seule)
        if (!isReadOnly)
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: theme.colors.error,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.delete,
                  size: 12,
                  color: theme.colors.baseWhite,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

