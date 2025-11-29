import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/models/dto/comment/comment_dto.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:intl/intl.dart';

class CommentsSectionWidget extends StatelessWidget {
  const CommentsSectionWidget({
    required this.isExpanded,
    required this.isReadOnly,
    required this.onToggleExpanded,
    required this.comments,
    required this.onAddComment,
    required this.onDeleteComment,
    super.key,
  });

  final bool isExpanded;
  final bool isReadOnly;
  final VoidCallback onToggleExpanded;
  final List<CommentDto> comments;
  final VoidCallback onAddComment;
  final Function(CommentDto comment) onDeleteComment;

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
                  Iconify(
                    Ph.chat_dots,
                    size: 14,
                    color: theme.colors.primary50,
                  ),
                  const ThemeGap.xs(),
                  Expanded(
                    child: ThemeText.bodySmallBold('Commentaires'),
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
          if (!isReadOnly)
            ThemeButton.alternative(
              icon: Iconify(Ph.chat, size: 16).toString(),
              label: 'Écrire un nouveau message',
              onPressed: onAddComment,
              fullWidth: true,
              radius: BorderRadius.circular(8),
              horizontalPadding: 12,
              verticalPadding: 8,
            ),
          if (!isReadOnly) const ThemeGap.sm(),
          // Afficher les commentaires existants
          ...comments.map((comment) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CommentItemWidget(
              comment: comment,
              isReadOnly: isReadOnly,
              onDelete: () => onDeleteComment(comment),
            ),
          )),
        ],
      ],
    );
  }
}

class CommentItemWidget extends StatelessWidget {
  const CommentItemWidget({
    required this.comment,
    required this.isReadOnly,
    required this.onDelete,
    super.key,
  });

  final CommentDto comment;
  final bool isReadOnly;
  final VoidCallback onDelete;

  String _formatDate(String dateStr) {
    try {
      // Essayer de parser la date au format dd/MM/yyyy
      final date = DateFormat('dd/MM/yyyy').parse(dateStr);
      return DateFormat('dd MMM yyyy HH:mm').format(date);
    } catch (e) {
      // Si le parsing échoue, utiliser la date telle quelle
      return dateStr;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Décoder l'image si présente
    Uint8List? imageBytes;
    if (comment.attachmentData != null && comment.attachmentData!.isNotEmpty) {
      try {
        imageBytes = base64Decode(comment.attachmentData!);
      } catch (e) {
        print('Erreur lors du décodage de l\'image du commentaire: $e');
      }
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: theme.colors.primary50,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: ThemeText.bodySmallBold(
              'U', // Initiale de l'utilisateur (peut être amélioré plus tard)
              color: theme.colors.baseWhite,
            ),
          ),
        ),
        const ThemeGap.sm(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ThemeText.bodySmallBold('Utilisateur'),
                        const ThemeGap.xs(),
                        ThemeText.bodyXSmallMedium(
                          _formatDate(comment.date),
                          color: theme.colors.grey50,
                        ),
                      ],
                    ),
                  ),
                  if (!isReadOnly)
                    IconButton(
                      iconSize: 16,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: Icon(
                        Icons.delete_outline,
                        size: 16,
                        color: theme.colors.grey50,
                      ),
                      onPressed: onDelete,
                    ),
                ],
              ),
              const ThemeGap.xs(),
              ThemeText.bodySmallMedium(
                comment.message,
                color: theme.colors.baseBlack,
              ),
              // Afficher l'image si présente
              if (imageBytes != null) ...[
                const ThemeGap.sm(),
                Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: theme.colors.grey50.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.memory(
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
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

