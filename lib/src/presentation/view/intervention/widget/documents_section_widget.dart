import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/models/dto/document/document_dto.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';

class DocumentsSectionWidget extends StatelessWidget {
  const DocumentsSectionWidget({
    required this.isExpanded,
    required this.isReadOnly,
    required this.onToggleExpanded,
    required this.documents,
    required this.onAddDocument,
    required this.onDeleteDocument,
    super.key,
  });

  final bool isExpanded;
  final bool isReadOnly;
  final VoidCallback onToggleExpanded;
  final List<DocumentDto> documents;
  final VoidCallback onAddDocument;
  final Function(DocumentDto document) onDeleteDocument;

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
                    Ph.files,
                    size: 14,
                    color: theme.colors.primary50,
                  ),
                  const ThemeGap.xs(),
                  Expanded(
                    child: ThemeText.bodySmallBold('Documents'),
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
          // Afficher les documents existants
          ...documents.map((document) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: DocumentItemWidget(
              name: document.filename,
              icon: _getIconForFile(document.filename),
              isReadOnly: isReadOnly,
              onDelete: () => onDeleteDocument(document),
            ),
          )),
          if (!isReadOnly) ...[
            const ThemeGap.sm(),
            ThemeButton.alternative(
              icon: Iconify(Ph.file_plus, size: 16).toString(),
              label: 'Ajouter un document',
              onPressed: onAddDocument,
              fullWidth: true,
              radius: BorderRadius.circular(8),
              horizontalPadding: 12,
              verticalPadding: 8,
            ),
          ],
        ],
      ],
    );
  }

  /// Retourne l'icône appropriée selon l'extension du fichier
  String _getIconForFile(String filename) {
    final extension = filename.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Ph.file_pdf;
      case 'mp4':
      case 'avi':
      case 'mov':
      case 'mkv':
        return Ph.file_video;
      case 'jpg':
      case 'jpeg':
      case 'png':
      case 'gif':
        return Ph.file_image;
      case 'doc':
      case 'docx':
        return Ph.file_doc;
      case 'xls':
      case 'xlsx':
        return Ph.file_xls;
      default:
        return Ph.file;
    }
  }
}

class DocumentItemWidget extends StatelessWidget {
  const DocumentItemWidget({
    required this.name,
    required this.icon,
    required this.isReadOnly,
    required this.onDelete,
    super.key,
  });

  final String name;
  final String icon;
  final bool isReadOnly;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colors.grey50.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Iconify(icon, size: 20, color: theme.colors.primary50),
          const ThemeGap.sm(),
          Expanded(
            child: ThemeText.bodySmallBold(
              name,
              color: theme.colors.primary50,
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
    );
  }
}

