import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/models/dto/material/material_dto.dart';
import 'package:field_service/src/services/applying/local/material/material_local.service.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';

class InterventionDetails extends ConsumerStatefulWidget {
  const InterventionDetails({
    required this.intervention,
    super.key,
  });

  final InterventionDto intervention;

  @override
  ConsumerState<InterventionDetails> createState() => _InterventionDetailsState();
}

class _InterventionDetailsState extends ConsumerState<InterventionDetails> {
  bool _descriptionExpanded = true;
  bool _materialExpanded = true;

  String get priorityColor {
    switch (widget.intervention.priority.toLowerCase()) {
      case 'haute':
        return '#C67C21';
      case 'moyenne':
        return '#9963AD';
      case 'basse':
        return '#4F5E66';
      default:
        return '#9963AD';
    }
  }

  Color _parseColor(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  Future<List<MaterialDto>> _loadMaterials() async {
    if (widget.intervention.id == null) {
      return [];
    }
    final materialService = ref.read(materialLocalServiceProvider);
    return await materialService.findByInterventionId(widget.intervention.id!);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colors.baseWhite,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Priorité et Client
            Row(
              children: [
                Expanded(
                  child: _buildDetailItem(
                    theme: theme,
                    icon: Iconify(Ph.warning_circle, size: 14),
                    label: 'Priorité',
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        color: _parseColor(priorityColor)
                            .withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ThemeText.bodySmallMedium(
                        widget.intervention.priority,
                        color: theme.colors.baseBlack,
                      ),
                    ),
                  ),
                ),
                const ThemeGap.l(),
                Expanded(
                  child: _buildDetailItem(
                    theme: theme,
                    icon: Iconify(Ph.user, size: 14),
                    label: 'Client',
                    child: GestureDetector(
                      onTap: () {
                        // Naviguer vers les détails du client
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: ThemeText.bodySmallBold(
                              widget.intervention.customer,
                              color: theme.colors.primary50,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Iconify(
                            Ph.arrow_square_out,
                            size: 12,
                            color: theme.colors.primary50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const ThemeGap.l(),
            
            // Localisation
            _buildDetailItem(
              theme: theme,
              icon: Iconify(Ph.map_pin, size: 14),
              label: 'Localisation',
              child: GestureDetector(
                onTap: () {
                  // Ouvrir la carte
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ThemeText.bodySmallBold(
                        'Site 2 Bâtiment 3C', // TODO: Récupérer depuis les données
                        color: theme.colors.primary50,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Iconify(
                      Ph.arrow_square_out,
                      size: 12,
                      color: theme.colors.primary50,
                    ),
                  ],
                ),
              ),
            ),
            const ThemeGap.l(),
            
            // Description de l'intervention
            _buildExpandableSection(
              theme: theme,
              icon: Icons.description_outlined,
              label: 'Description de l\'intervention',
              isExpanded: _descriptionExpanded,
              onToggle: () {
                setState(() {
                  _descriptionExpanded = !_descriptionExpanded;
                });
              },
              child: _descriptionExpanded
                  ? ThemeText.bodySmallMedium(
                      widget.intervention.description,
                      color: theme.colors.grey50,
                    )
                  : null,
            ),
            const ThemeGap.l(),
            
            // Matériel requis
            _buildExpandableSection(
              theme: theme,
              icon: Icons.construction_outlined,
              label: 'Matériel requis',
              isExpanded: _materialExpanded,
              onToggle: () {
                setState(() {
                  _materialExpanded = !_materialExpanded;
                });
              },
              child: _materialExpanded
                  ? FutureBuilder<List<MaterialDto>>(
                      future: _loadMaterials(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.only(left: 18),
                            child: CircularProgressIndicator(),
                          );
                        }
                        
                        if (snapshot.hasError) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: ThemeText.bodySmallMedium(
                              'Erreur lors du chargement des matériaux',
                              color: theme.colors.grey50,
                            ),
                          );
                        }
                        
                        final materials = snapshot.data ?? [];
                        
                        if (materials.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: ThemeText.bodySmallMedium(
                              'Aucun matériel requis',
                              color: theme.colors.grey50,
                            ),
                          );
                        }
                        
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: materials
                              .map(
                                (material) => Padding(
                                  padding: const EdgeInsets.only(left: 18),
                                  child: ThemeText.bodySmallMedium(
                                    '• ${material.name}${material.quantity > 1 ? ' (x${material.quantity})' : ''}',
                                    color: theme.colors.grey50,
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      },
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required ThemeData theme,
    required Widget icon,
    required String label,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            IconTheme(
              data: IconThemeData(
                color: theme.colors.primary50,
                size: 14,
              ),
              child: icon,
            ),
            const ThemeGap.xs(),
            Expanded(
              child: ThemeText.bodySmallBold(label),
            ),
          ],
        ),
        const ThemeGap.xs(),
        child,
      ],
    );
  }

  Widget _buildExpandableSection({
    required ThemeData theme,
    required IconData icon,
    required String label,
    required bool isExpanded,
    required VoidCallback onToggle,
    required Widget? child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 14, color: theme.colors.primary50),
            const ThemeGap.xs(),
            Expanded(
              child: ThemeText.bodySmallBold(label),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                isExpanded ? Icons.expand_more : Icons.expand_less,
                size: 16,
                color: theme.colors.primary50,
              ),
              onPressed: onToggle,
            ),
          ],
        ),
        if (child != null) ...[
          const ThemeGap.xs(),
          child,
        ],
      ],
    );
  }
}

