import 'package:arkup_edoo/common/theme/theme.utils.dart';
import 'package:arkup_edoo/presentation/controller/splash.controller.dart';
import 'package:arkup_edoo/presentation/views/base.view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends BaseScreen<void> {
  const SplashScreen({super.key});

  @override
  Widget buildBody(BuildContext context, WidgetRef ref) {
    ref.read(splashControllerProvider.notifier).init(context);
    return BaseScreen.baseScaffoldView(
      ref: ref,
      context: context,
      withAppbar: false,
      withPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: ThemeColors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Image.asset(
                  "assets/images/e.png",
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF9963AD), Color(0xFF3F2947)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ).createShader(bounds),
              child: const Text(
                "Chargement ...",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
