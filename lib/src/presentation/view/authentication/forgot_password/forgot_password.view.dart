import 'package:field_service/src/localization/app_localizations_bootstrap.dart';
import 'package:field_service/src/presentation/controller/authentication/forgot_password/forgot_password.controller.dart';
import 'package:field_service/src/presentation/view/authentication/forgot_password/forgot_password_form_fields.dart';
import 'package:field_service/src/presentation/widget/email_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:go_router/go_router.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPasswordView extends ConsumerWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final form = forgotPasswordForm();

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.9,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: theme.colors.baseWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              child: ReactiveFormBuilder(
                form: () => form,
                builder: (context, formGroup, child) {
                  Future<void> sendResetLink() async {
                    print('sendResetLink');
                    if (form.invalid) {
                      return;
                    }

                    final value = form.value;
                    final email = value[ForgotPasswordFormFields.email.name];

                    if (email is! String) {
                      return;
                    }

                    final trimmedEmail = email.trim().toLowerCase();

                    if (trimmedEmail.isEmpty) {
                      return;
                    }

                    await ref.read(forgotPasswordControllerProvider.notifier).sendResetLink(
                      email: trimmedEmail,
                      onError: () {
                        print('Error sending reset link');
                        // TODO: Gérer l'erreur
                      },
                      onSuccess: () {
                        print('Reset link sent');
                        // TODO: Afficher un message de succès ou naviguer
                      },
                    );
                  }

                  void onSubmitForm() => sendResetLink();

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                context.pop();
                              },
                            ),
                            const ThemeGap.sm(),
                            ThemeText.h6Bold(l10n.resetPassword),
                            const ThemeGap.xs(),
                            ThemeText.bodySmallRegular(
                              l10n.resetPasswordDescription,
                              color: theme.colors.grey50,
                            ),
                          ],
                        ),
                        const ThemeGap.xl(),
                        // Form fields
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Email field
                            ReactiveFormConsumer(
                              builder: (context, formGroup, child) {
                                return EmailField(
                                  formControl: form.control(
                                    ForgotPasswordFormFields.email.name,
                                  ) as FormControl<String>,
                                  onSubmitted: () {
                                    if (formGroup.valid) {
                                      onSubmitForm();
                                    }
                                  },
                                  textInputAction: TextInputAction.done,
                                );
                              },
                            ),
                            const ThemeGap.l(),
                            // Send button
                            ReactiveFormConsumer(
                              builder: (context, formGroup, child) {
                                return ThemeButton.primary(
                                  label: l10n.sendResetLink,
                                  fullWidth: true,
                                  onPressed: formGroup.valid
                                      ? onSubmitForm
                                      : null,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
