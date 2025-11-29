import 'package:flutter/material.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:field_service/src/common/theme/widgets/theme_reactive_text_field.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:image_picker/image_picker.dart';

enum AddCommentFormFields {
  message,
}

FormGroup addCommentForm() {
  return FormGroup({
    AddCommentFormFields.message.name: FormControl<String>(
      value: null,
      validators: [Validators.required],
    ),
  });
}

class AddCommentBottomSheet extends StatefulWidget {
  const AddCommentBottomSheet({
    required this.onSave,
    super.key,
  });

  final Function(String message, String? imagePath) onSave;

  @override
  State<AddCommentBottomSheet> createState() => _AddCommentBottomSheetState();
}

class _AddCommentBottomSheetState extends State<AddCommentBottomSheet> {
  late final FormGroup _form;
  String? _selectedImagePath;

  @override
  void initState() {
    super.initState();
    _form = addCommentForm();
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (image != null && mounted) {
      setState(() {
        _selectedImagePath = image.path;
      });
    }
  }

  Future<void> _showImageSourceBottomSheet() async {
    if (!mounted) return;

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

    if (source != null) {
      await _pickImage(source);
    }
  }

  void _removeImage() {
    setState(() {
      _selectedImagePath = null;
    });
  }

  void _handleSave(FormGroup formGroup) {
    if (formGroup.invalid) {
      formGroup.markAllAsTouched();
      return;
    }

    final messageControl = formGroup.control(AddCommentFormFields.message.name) as FormControl<String>;
    final message = messageControl.value?.trim() ?? '';
    
    if (message.isEmpty) {
      formGroup.markAllAsTouched();
      return;
    }

    widget.onSave(message, _selectedImagePath);
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _form.dispose();
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
                  ThemeText.h5Bold('Ajouter un commentaire'),
                ],
              ),
              const ThemeGap.l(),
              // Champ Message
              ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  final control = formGroup.control(
                    AddCommentFormFields.message.name,
                  );
                  return ThemeReactiveTextField<String>(
                    formControl: control as FormControl<String>,
                    label: ThemeText.bodySmallBold(
                      'Message',
                      color: theme.colors.baseBlack,
                    ),
                    leadingIcon: Ph.text_align_justify,
                    hint: 'Votre commentaire...',
                    textInputAction: TextInputAction.newline,
                    maxLines: 5,
                    withBorder: true,
                  );
                },
              ),
              const ThemeGap.m(),
              // Section photo
              if (_selectedImagePath == null)
                ThemeButton.alternative(
                  icon: Iconify(Ph.image, size: 16).toString(),
                  label: 'Ajouter une photo',
                  onPressed: _showImageSourceBottomSheet,
                  fullWidth: true,
                  radius: BorderRadius.circular(8),
                  horizontalPadding: 12,
                  verticalPadding: 8,
                )
              else
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.colors.grey50.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Iconify(Ph.image, size: 20, color: theme.colors.primary50),
                      const ThemeGap.sm(),
                      Expanded(
                        child: ThemeText.bodySmallBold(
                          _selectedImagePath!.split('/').last,
                          color: theme.colors.primary50,
                        ),
                      ),
                      IconButton(
                        iconSize: 16,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Icon(
                          Icons.delete_outline,
                          size: 16,
                          color: theme.colors.grey50,
                        ),
                        onPressed: _removeImage,
                      ),
                    ],
                  ),
                ),
              const ThemeGap.l(),
              // Bouton Enregistrer
              ReactiveFormConsumer(
                builder: (context, formGroup, child) {
                  return ThemeButton.primary(
                    label: 'Enregistrer',
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

