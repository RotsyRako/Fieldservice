import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/presentation/controller/server_config.controller.dart';
import 'package:arkup_edoo/presentation/views/base.view.dart';
import 'package:arkup_edoo/presentation/widgets/button.widget.dart';
import 'package:arkup_edoo/presentation/widgets/input.widget.dart';
import 'package:arkup_edoo/repository/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerConfigScreen extends BaseScreen<void> {
  const ServerConfigScreen({super.key});

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    final baseUrlController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    bool shouldValidate = false;

    return StatefulBuilder(
      builder: (context, setState) {
        // Prefill with previously saved value if any
        ref.read(secureStorageProvider).getBaseUrl().then((value) {
          if ((value != null && value.isNotEmpty) &&
              baseUrlController.text.isEmpty) {
            baseUrlController.text = value;
          }
        });

        void onValidate() {
          setState(() => shouldValidate = true);
          if (formKey.currentState?.validate() ?? false) {
            ref
                .read(serverConfigControllerProvider.notifier)
                .validateAndSave(
                  baseUrl: baseUrlController.text.trim(),
                  context: context,
                );
          }
        }

        String? urlValidator(String? value) {
          if (!shouldValidate) return null;
          final v = (value ?? '').trim();
          if (v.isEmpty) return 'Une URL valide est obligatoire.';
          final pattern = RegExp(r'^https?://');
          if (!pattern.hasMatch(v))
            return "L'URL doit commencer par http:// ou https://";
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Configuration du serveur',
                            style: bodyXxl.bold(),
                          ),
                          Text(
                            "Saisissez l'URL du serveur Odoo (ex: https://exemple.com)",
                            style: body.copyWith(color: ThemeColors.gray),
                          ),
                          const SizedBox(height: 24),
                          Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Input.textFormField(
                                  controller: baseUrlController,
                                  label: 'Base URL',
                                  prefixIcon: Icon(
                                    Icons.link,
                                    color: ThemeColors.violet,
                                  ),
                                  validator: urlValidator,
                                ),
                                const SizedBox(height: 20),
                                Button.elevated(
                                  onPressed: onValidate,
                                  buttonTitle: 'Valider',
                                  isGradient: true,
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
          ),
        );
      },
    );
  }
}
