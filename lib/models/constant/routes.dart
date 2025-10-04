import 'package:arkup_edoo/models/dto/intervention/intervention.dto.dart';
import 'package:arkup_edoo/presentation/views/details.view.dart';
import 'package:arkup_edoo/presentation/views/home.view.dart';
import 'package:arkup_edoo/presentation/views/login.view.dart';
import 'package:arkup_edoo/presentation/views/server_config.view.dart';
import 'package:arkup_edoo/presentation/views/reset_password.view.dart';
import 'package:go_router/go_router.dart';
import 'package:arkup_edoo/presentation/views/activity.view.dart';
import 'package:arkup_edoo/presentation/views/splash.view.dart';

import '../../presentation/views/signature.view.dart';

class Routes {
  static const String splash = '/';
  static const String login = '/login';
  static const String serverConfig = '/server_config';
  static const String home = '/home';
  static const String activity = '/activity';
  static const String resetPassword = '/reset_password';
  static const String signature = '/signature';
  static const String details = '/details';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(path: splash, name: splash, builder: (context, state) => const SplashScreen()),
      GoRoute(path: serverConfig, name: serverConfig, builder: (context, state) => const ServerConfigScreen()),
      GoRoute(path: login, name: login, builder: (context, state) => const LoginScreen()),
      GoRoute(path: home, name: home, builder: (context, state) => const HomeScreen()),
      // GoRoute(
      //   path: activity,
      //   name: activity,
      //   builder: (context, state) => const ActivityScreen(),
      // ),
      GoRoute(
        path: resetPassword,
        name: resetPassword,
        builder: (context, state) => const ResetPasswordScreen(),
      ),
      GoRoute(
        path: signature,
        name: signature,
        builder: (context, state) { 
          final intervention = state.extra as InterventionDTO;
          return SignatureScreen(intervention: intervention,);
        },
      ),
      GoRoute(
        path: details,
        name: details,
        builder: (context, state) {
          Map<String, dynamic> args =
          state.extra as Map<String, dynamic>;
          return DetailsScreen(
            listIntervention: args["listIntervention"] as List<InterventionDTO>,
            currentIndex: args["currentIndex"] as int,
          );
        },
      ),
    ],
  );
}
