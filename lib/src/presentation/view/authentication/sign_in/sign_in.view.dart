import 'package:field_service/src/localization/app_localizations_bootstrap.dart';
import 'package:field_service/src/common/theme/widgets/theme_pop_up/theme_pop_up.dart';
import 'package:field_service/src/common/theme/widgets/theme_pop_up/theme_pop_up_type.dart';
import 'package:field_service/src/models/dto/auth/sign_in/sign_in.dto.dart';
import 'package:field_service/src/presentation/controller/authentication/sign_in/sign_in.controller.dart';
import 'package:field_service/src/presentation/view/authentication/sign_in/sing_in_form_fields.dart';
import 'package:field_service/src/presentation/widget/email_field.dart';
import 'package:field_service/src/presentation/widget/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:field_service/src/common/theme/data/theme_data.dart';
import 'package:field_service/src/common/theme/widgets/theme_button/theme_button.dart';
import 'package:field_service/src/common/theme/widgets/theme_gap/theme_gap.dart';
import 'package:field_service/src/common/theme/widgets/theme_text/theme_text.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:go_router/go_router.dart';
import 'package:field_service/src/routing/routes.dart';

class SignInView extends ConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final isSigningIn = ref.watch(signInControllerProvider).isLoading;

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
                form: signInForm,
                builder: (context, formGroup, child) {
                  Future<void> signIn() async {
                    print('signIn');
                    if (formGroup.invalid || isSigningIn) {
                      formGroup.markAllAsTouched();
                      return;
                    }

                    final value = formGroup.value;
                    final email = value[SingInFormFields.email.name];
                    final password = value[SingInFormFields.password.name];

                    if (email is! String || password is! String) {
                      return;
                    }

                    final trimmedEmail = email.trim().toLowerCase();
                    final trimmedPassword = password.trim();

                    if (trimmedEmail.isEmpty || trimmedPassword.isEmpty) {
                      return;
                    }

                    print('pass trim');

                    
                    await ref
                        .read(signInControllerProvider.notifier)
                        .makeUserAuthenticated(
                      signInDto: SignInDto(
                        email: trimmedEmail,
                        password: trimmedPassword,
                      ),
                      onError: (message) async {
                        if (!context.mounted) {
                          return;
                        }
                        await showPopup(
                          context: context,
                          type: ThemePopUpType.error,
                          title: l10n.connection,
                          message: message,
                        );
                      },
                      onSuccess: () {
                        if (!context.mounted) {
                          return;
                        }
                      },
                    );
                  }

                  void onSubmitForm() => signIn();

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    // Header
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemeText.h6Bold(l10n.connection),
                        const ThemeGap.xs(),
                        ThemeText.bodySmallRegular(
                          l10n.yourTechnicianSpace,
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
                            final control = formGroup.control(
                              SingInFormFields.email.name,
                            );
                            return EmailField(
                              formControl:
                                  control as FormControl<String>,
                              onSubmitted: () {
                                // Focus on password field
                              },
                              textInputAction: TextInputAction.next,
                            );
                          },
                        ),
                        const ThemeGap.l(),
                        // Password field
                        ReactiveFormConsumer(
                          builder: (context, formGroup, child) {
                            final control = formGroup.control(
                              SingInFormFields.password.name,
                            );
                            return PasswordField(
                              formControl:
                                  control as FormControl<String>,
                              label: l10n.password,
                              autofillHints: const [AutofillHints.password],
                              textInputAction: TextInputAction.done,
                              onSubmitted: () {
                                if (formGroup.valid) {
                                  onSubmitForm();
                                }
                              },
                            );
                          },
                        ),
                        const ThemeGap.sm(),
                        // Forgot password link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ThemeButton.text(
                              label: l10n.forgotPassword,
                              color: theme.colors.primary50,
                              horizontalPadding: 0,
                              onPressed: () {
                                context.push(Routes.forgotPassword.location);
                              },
                            ),
                          ],
                        ),
                        
                        const ThemeGap.l(),
                        // Login button
                        ReactiveFormConsumer(
                          builder: (context, formGroup, child) {
                            return ThemeButton.primary(
                              label: l10n.signIn,
                              fullWidth: true,
                              onPressed: formGroup.valid
                                  ? onSubmitForm
                                  : null,
                              loading: isSigningIn,
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