import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/common/theme/widgets/theme_reactive_text_field.dart';
import 'package:field_service/src/models/dto/material/material_dto.dart';
import 'package:field_service/src/presentation/controller/intervention/intervention.controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MaterialItem {
  final int? localId; // null pour les nouveaux items
  final FormControl<String> nameControl;
  final FormControl<String> quantityControl;
  final String uniqueKey; // Clé unique pour identifier chaque item
  bool isDeleted = false;

  MaterialItem({
    this.localId,
    required this.nameControl,
    required this.quantityControl,
    String? uniqueKey,
  }) : uniqueKey = uniqueKey ?? DateTime.now().millisecondsSinceEpoch.toString();

  MaterialItem copyWith({
    int? localId,
    FormControl<String>? nameControl,
    FormControl<String>? quantityControl,
    bool? isDeleted,
    String? uniqueKey,
  }) {
    return MaterialItem(
      localId: localId ?? this.localId,
      uniqueKey: uniqueKey ?? this.uniqueKey,
      nameControl: nameControl ?? this.nameControl,
      quantityControl: quantityControl ?? this.quantityControl,
    )..isDeleted = isDeleted ?? this.isDeleted;
  }
}

class EditMaterialsBottomSheet extends ConsumerStatefulWidget {
  const EditMaterialsBottomSheet({
    required this.interventionId,
    required this.onSave,
    super.key,
  });

  final String interventionId;
  final VoidCallback onSave;

  @override
  ConsumerState<EditMaterialsBottomSheet> createState() => _EditMaterialsBottomSheetState();
}

class _EditMaterialsBottomSheetState extends ConsumerState<EditMaterialsBottomSheet> {
  List<MaterialItem> _materialItems = [];
  bool _isLoading = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _loadMaterials();
  }

  Future<void> _loadMaterials() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final controller = ref.read(
        interventionControllerProvider(widget.interventionId).notifier,
      );
      final materials = await controller.loadMaterials(widget.interventionId);

      setState(() {
        _materialItems = materials.map((material) {
          return MaterialItem(
            localId: material.localId,
            uniqueKey: 'material_${material.localId ?? DateTime.now().millisecondsSinceEpoch}',
            nameControl: FormControl<String>(
              value: material.name,
              validators: [Validators.required],
            ),
            quantityControl: FormControl<String>(
              value: material.quantity.toString(),
              validators: [Validators.required],
            ),
          );
        }).toList();
        
        // Si la liste est vide, ajouter une ligne vide par défaut
        if (_materialItems.isEmpty) {
          _materialItems.add(
            MaterialItem(
              uniqueKey: 'new_${DateTime.now().millisecondsSinceEpoch}',
              nameControl: FormControl<String>(
                validators: [Validators.required],
              ),
              quantityControl: FormControl<String>(
                value: '1',
                validators: [Validators.required],
              ),
            ),
          );
        }
        
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors du chargement: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _addMaterial() {
    setState(() {
      _materialItems.add(
        MaterialItem(
          uniqueKey: 'new_${DateTime.now().millisecondsSinceEpoch}',
          nameControl: FormControl<String>(
            validators: [Validators.required],
          ),
          quantityControl: FormControl<String>(
            value: '1',
            validators: [Validators.required],
          ),
        ),
      );
    });
  }

  void _removeMaterial(int index) {
    setState(() {
      if (_materialItems[index].localId != null) {
        // Marquer comme supprimé si c'est un item existant
        _materialItems[index].isDeleted = true;
      } else {
        // Supprimer complètement si c'est un nouvel item
        _materialItems[index].nameControl.dispose();
        _materialItems[index].quantityControl.dispose();
        _materialItems.removeAt(index);
      }
    });
  }

  Future<void> _saveAndClose() async {
    // Valider tous les champs
    bool hasErrors = false;
    for (var item in _materialItems) {
      if (!item.isDeleted) {
        if (item.nameControl.invalid) {
          item.nameControl.markAsTouched();
          hasErrors = true;
        }
        if (item.quantityControl.invalid) {
          item.quantityControl.markAsTouched();
          hasErrors = true;
        }
      }
    }

    if (hasErrors) {
      return;
    }

    setState(() {
      _isSaving = true;
    });

    try {
      final controller = ref.read(
        interventionControllerProvider(widget.interventionId).notifier,
      );

      // Préparer les listes pour la sauvegarde
      final List<MaterialDto> materialsToSave = [];
      final List<MaterialDto> materialsToUpdate = [];
      final List<int> materialsToDelete = [];

      for (var item in _materialItems) {
        if (item.isDeleted && item.localId != null) {
          materialsToDelete.add(item.localId!);
        } else if (!item.isDeleted) {
          final nameValue = item.nameControl.value;
          final quantityValue = item.quantityControl.value;
          
          final name = nameValue?.trim() ?? '';
          final quantityStr = quantityValue?.trim() ?? '1';
          
          // Ignorer les lignes vides (sans nom)
          if (name.isEmpty) {
            continue;
          }
          
          final quantity = int.tryParse(quantityStr) ?? 1;

          final materialDto = MaterialDto(
            localId: item.localId,
            name: name,
            quantity: quantity,
            idIntervention: widget.interventionId,
          );

          if (item.localId != null) {
            materialsToUpdate.add(materialDto);
          } else {
            materialsToSave.add(materialDto);
          }
        }
      }

      // Sauvegarder tous les changements via le contrôleur
      final errors = await controller.saveAllMaterials(
        interventionId: widget.interventionId,
        materialsToSave: materialsToSave,
        materialsToUpdate: materialsToUpdate,
        materialsToDelete: materialsToDelete,
      );

      // Afficher les résultats
      if (mounted) {
        widget.onSave();
        Navigator.of(context).pop();
        
        if (errors.isNotEmpty) {
          // Certaines opérations ont échoué
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Certains matériaux n\'ont pas pu être enregistrés:\n${errors.join('\n')}'),
              duration: const Duration(seconds: 5),
            ),
          );
        } else {
          // Toutes les opérations ont réussi
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Matériaux enregistrés avec succès'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      setState(() {
        _isSaving = false;
      });
      print('Erreur lors de l\'enregistrement: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors de l\'enregistrement: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _scanMaterial() async {
    // Afficher un dialogue pour choisir entre caméra et galerie
    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colors.baseWhite,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colors.grey50,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ThemeText.h5Bold('Sélectionner une source'),
            const ThemeGap.m(),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: ThemeText.bodyMediumSemiBold('Caméra'),
              onTap: () => Navigator.of(context).pop(ImageSource.camera),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: ThemeText.bodyMediumSemiBold('Galerie'),
              onTap: () => Navigator.of(context).pop(ImageSource.gallery),
            ),
            const ThemeGap.s(),
          ],
        ),
      ),
    );

    if (source == null) {
      return;
    }

    try {
      final controller = ref.read(
        interventionControllerProvider(widget.interventionId).notifier,
      );
      
      print('Appel de scanMaterialFromImage avec source: $source');
      final materialName = await controller.scanMaterialFromImage(source);
      print('Résultat du scan: $materialName');
      
      if (materialName != null && mounted) {
        print('Ajout du matériau $materialName à la liste');
        print('Nombre d\'items avant insertion: ${_materialItems.length}');
        
        // Créer une clé unique pour ce nouvel item
        final uniqueKey = 'scan_${DateTime.now().millisecondsSinceEpoch}';
        
        // Créer le nouveau MaterialItem avec la valeur du scan
        final newMaterialItem = MaterialItem(
          uniqueKey: uniqueKey,
          nameControl: FormControl<String>(
            value: materialName,
            validators: [Validators.required],
          ),
          quantityControl: FormControl<String>(
            value: '1',
            validators: [Validators.required],
          ),
        );
        
        print('Nouveau MaterialItem créé avec uniqueKey: $uniqueKey');
        print('Nouveau MaterialItem créé avec nameControl.value: ${newMaterialItem.nameControl.value}');
        
        // Ajouter le matériau scanné en bas de la liste
        setState(() {
          _materialItems.add(newMaterialItem);
        });
        
        print('Nombre d\'items après insertion: ${_materialItems.length}');
        if (_materialItems.isNotEmpty) {
          final lastIndex = _materialItems.length - 1;
          print('Dernier item après insertion - uniqueKey: ${_materialItems[lastIndex].uniqueKey}');
          print('Dernier item après insertion - nameControl.value: ${_materialItems[lastIndex].nameControl.value}');
        }
        
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Matériau reconnu: $materialName'),
              duration: const Duration(seconds: 2),
            ),
          );
        }
      } else if (mounted) {
        print('Aucun matériau reconnu ou materialName est null');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Aucun matériau reconnu dans l\'image. Veuillez réessayer avec une autre image.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erreur lors du scan: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    for (var item in _materialItems) {
      if (!item.isDeleted || item.localId == null) {
        item.nameControl.dispose();
        item.quantityControl.dispose();
      }
    }
    super.dispose();
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // En-tête
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _isSaving ? null : () => Navigator.of(context).pop(),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const ThemeGap.s(),
              const Expanded(
                child: ThemeText.h5Bold('Modifier les matériaux'),
              ),
            ],
          ),
          const ThemeGap.l(),
          
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(32.0),
                child: CircularProgressIndicator(),
              ),
            )
          else ...[
            // Labels d'en-tête
            Row(
              children: [
                Expanded(
                  child: ThemeText.bodySmallBold(
                    'Nom du matériel',
                    color: theme.colors.grey50,
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 100,
                  child: ThemeText.bodySmallBold(
                    'Quantité',
                    color: theme.colors.grey50,
                  ),
                ),
                const SizedBox(width: 8),
                const SizedBox(width: 48), // Espace pour le bouton supprimer
              ],
            ),
            const ThemeGap.sm(),
            // Liste des matériaux
            Flexible(
              child: SingleChildScrollView(
                key: ValueKey('materials_list_${_materialItems.length}'),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate(_materialItems.length, (index) {
                      final item = _materialItems[index];
                      if (item.isDeleted) {
                        return const SizedBox.shrink();
                      }
                      
                      return Padding(
                        key: ValueKey(item.uniqueKey),
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ThemeReactiveTextField<String>(
                                formControl: item.nameControl,
                                hint: 'Nom du matériel',
                                keyboardType: TextInputType.text,
                                fillColor: theme.colors.surface,
                              ),
                            ),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 100,
                              child: ThemeReactiveTextField<String>(
                                formControl: item.quantityControl,
                                hint: 'Qté',
                                keyboardType: TextInputType.number,
                                fillColor: theme.colors.surface,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.delete_outline),
                              color: theme.colors.primary200,
                              onPressed: _isSaving
                                  ? null
                                  : () => _removeMaterial(index),
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            const ThemeGap.m(),
            
            // Boutons Ajouter et Scanner
            Row(
              children: [
                Expanded(
                  child: ThemeButton.secondary(
                    label: 'Ajouter un matériel',
                    onPressed: _isSaving ? null : _addMaterial,
                    fullWidth: true,
                    forceSingleLine: true,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ThemeButton.secondary(
                    label: 'Scanner un matériel',
                    onPressed: _isSaving ? null : _scanMaterial,
                    fullWidth: true,
                    forceSingleLine: true,
                  ),
                ),
              ],
            ),

            const ThemeGap.s(),
            
            // Bouton Sauvegarder et fermer
            ThemeButton.primary(
              label: _isSaving ? 'Sauvegarde...' : 'Sauvegarder et fermer',
              onPressed: _isSaving ? null : _saveAndClose,
              fullWidth: true,
            ),
          ],
        ],
      ),
    );
  }
}

