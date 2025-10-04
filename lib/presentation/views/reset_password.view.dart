// views/login.screen.dart
import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/models/constant/regex.dart';
import 'package:arkup_edoo/models/constant/routes.dart';
import 'package:arkup_edoo/models/dto/auth/reset_password_request.dto.dart';
import 'package:arkup_edoo/models/constant/strings.dart';
import 'package:arkup_edoo/presentation/views/base.view.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/widgets/input.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:arkup_edoo/presentation/controller/reset_password.controller.dart';

class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ResetPasswordScreen> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _shouldValidate = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    setState(() {
      _shouldValidate = true;
    });
    if (_formKey.currentState?.validate() ?? false) {
      final dto = ResetPasswordRequestDTO(email: _emailController.text);
      ref
          .read(resetPasswordControllerProvider.notifier)
          .resetPassword(
            dto: dto,
            onSuccess: () async {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Un lien de réinitialisation vous a été envoyé par mail',
                    ),
                  ),
                );
                await Future.delayed(const Duration(seconds: 2));
                if (context.mounted) {
                  context.go(Routes.login);
                }
              }
            },
            onError: (error) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(error.toString()),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          );
    } else {
      print('ResetPasswordScreen: Form is invalid');
    }
  }

  String? _emailValidator(String? value) {
    if (!_shouldValidate) return null;
    if (value == null || value.isEmpty) return Strings.common.fieldRequired;
    if (!Regex.email.hasMatch(value)) return Strings.common.mailNotValid;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen.baseScaffoldView(
      ref: ref,
      context: context,
      withAppbar: false,
      withPadding: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/arkup_edoo.png",
                      width: 200,
                      height: 200,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 225,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ThemeColors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () => context.go(Routes.login),
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: ThemeColors.gray,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Réinitialiser mon mot de passe",
                                style: bodyXxl.bold(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Entrez votre adresse e-mail pour recevoir un lien de réinitialisation. Vous devez être connecté à internet pour finaliser cette opération.",
                            style: body.copyWith(color: ThemeColors.gray),
                          ),
                          const SizedBox(height: 24),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Input.textFormField(
                                  controller: _emailController,
                                  label: Strings.login.username,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: ThemeColors.violet,
                                  ),
                                  validator: _emailValidator,
                                ),
                                const SizedBox(height: 20),
                                Button.elevated(
                                  onPressed: _onSubmit,
                                  buttonTitle:
                                      "Envoyer le lien de réinitialisation",
                                  isGradient: true,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
