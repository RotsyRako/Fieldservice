import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/models/constant/regex.dart';
import 'package:arkup_edoo/models/constant/strings.dart';
import 'package:arkup_edoo/models/constant/routes.dart';
import 'package:arkup_edoo/models/dto/auth/login_request.dto.dart';
import 'package:arkup_edoo/presentation/controller/login.controller.dart';
import 'package:arkup_edoo/presentation/views/base.view.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/widgets/input.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends BaseScreen {
  const LoginScreen({super.key});

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool isPasswordHidden = true;
    bool shouldValidate = false;

    return StatefulBuilder(
      builder: (context, setState) {
        void onLogin() {
          setState(() => shouldValidate = true);
          if (formKey.currentState?.validate() ?? false) {
            final dto = LoginRequestDTO(
              email: emailController.text,
              password: passwordController.text,
            );
            ref.read(loginControllerProvider.notifier).login(dto, context);
          }
        }

        String? emailValidator(String? value) {
          if (!shouldValidate) return null; // Ne valide pas tant qu'on n'a pas essayé de soumettre
          if (value == null || value.isEmpty) return Strings.common.fieldRequired;
          if (!Regex.email.hasMatch(value)) return Strings.common.mailNotValid;
          return null;
        }

        String? passwordValidator(String? value) {
          if (!shouldValidate) return null;
          if (value == null || value.isEmpty) return Strings.common.passwordRequired;
          return null;
        }

        return BaseScreen.baseScaffoldView(
          ref: ref,
          context: context,
          withAppbar: false,
          withPadding: false,
          body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/images/arkup_edoo.png", width: 200, height: 200),
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
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Connexion", style: bodyXxl.bold()),
                            Text("Votre espace technicien", style: body.copyWith(color: ThemeColors.gray)),
                            const SizedBox(height: 24),
                            Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Input.textFormField(
                                    controller: emailController,
                                    label: Strings.login.username,
                                    prefixIcon: Icon(Icons.email_outlined, color: ThemeColors.violet),
                                    validator: emailValidator,
                                  ),
                                  const SizedBox(height: 20),
                                  Input.textFormField(
                                    controller: passwordController,
                                    label: Strings.login.password,
                                    isPassword: true,
                                    isPasswordHidden: isPasswordHidden,
                                    prefixIcon: Icon(Icons.lock_outline, color: ThemeColors.violet),
                                    onVisibilityChange: (_) {
                                      setState(() => isPasswordHidden = !isPasswordHidden);
                                    },
                                    validator: passwordValidator,
                                  ),
                                  const SizedBox(height: 10),
                                  Material(
                                    color: Colors.transparent, // Important pour voir l'effet ripple
                                    child: InkWell(
                                      onTap: () {
                                        context.push(Routes.resetPassword);
                                      },
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          Strings.login.forgotPasswod,
                                          style: body.bold().copyWith(color: ThemeColors.violet),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Button.elevated(
                                    onPressed: onLogin,
                                    buttonTitle: Strings.login.submit,
                                    isGradient: true,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    context.push(Routes.serverConfig);
                                  },
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Configurer le serveur',
                                      style: body.bold().copyWith(color: ThemeColors.violet),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
          )
        );
      },
    );
  }
}
