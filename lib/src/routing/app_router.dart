import 'package:field_service/src/models/dto/intervention/intervention_dto.dart';
import 'package:field_service/src/presentation/view/authentication/forgot_password/forgot_password.view.dart';
import 'package:field_service/src/presentation/view/authentication/sign_in/sign_in.view.dart';
import 'package:field_service/src/presentation/view/home/home.view.dart';
import 'package:field_service/src/presentation/view/intervention/intervention.view.dart';
import 'package:field_service/src/presentation/view/signature/signature.view.dart';
import 'package:field_service/src/routing/go_router_refresh_stream.dart';
import 'package:field_service/src/routing/route_names.dart';
import 'package:field_service/src/routing/routes.dart';
import 'package:field_service/src/services/technical/app_shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// Provider pour exposer la clé du navigator root
@riverpod
GlobalKey<NavigatorState> navigatorKey(Ref ref) {
  return _rootNavigatorKey;
}


@riverpod
GoRouter appRouter(Ref ref) {
  // Surveiller appSharedPreferencesProvider pour reconstruire le router quand il change
  final appSharedPrefsAsync = ref.watch(appSharedPreferencesProvider);
  
  // Obtenir le stream d'authentification depuis AppSharedPreferences
  // appSharedPrefsAsync est un AsyncValue<AppSharedPreferences>, donc on doit extraire
  // l'instance AppSharedPreferences avec .when() ou .requireValue avant d'appeler .authStateChanges()
  final authStateStream = appSharedPrefsAsync.when(
    data: (prefs) => prefs.authStateChanges(),
    loading: () => Stream<String?>.value(null),
    error: (_, __) => Stream<String?>.value(null),
  );
  
  // Utiliser GoRouterRefreshStream pour déclencher un refresh du router
  // quand l'état d'authentification change
  final refreshStream = GoRouterRefreshStream<String?>(authStateStream);

  return GoRouter(
    initialLocation: Routes.initial.location,
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: refreshStream,
    redirect: (context, state) async {
      // Lire depuis le provider (qui garde la même instance mais lit depuis SharedPreferences)
      // AppSharedPreferences.isAuthenticated lit directement depuis SharedPreferences
      // donc même si le provider garde la même instance, la valeur sera à jour
      final appSharedPrefs = await ref.read(appSharedPreferencesProvider.future);
     
      final isAuthenticated = appSharedPrefs.isAuthenticated;
      final isInterventionTableCreated = appSharedPrefs.isInterventionTableCreated;
      final currentLocation = state.uri.toString();
      
      // Si l'utilisateur est sur la page de connexion et qu'il est authentifié ET que la table est créée, rediriger vers home
      if (isAuthenticated && isInterventionTableCreated && currentLocation == Routes.signIn.location) {
        return Routes.home.location;
      }
      
      // Si l'utilisateur n'est pas authentifié OU la table n'est pas créée, et qu'il n'est pas sur la page de connexion, rediriger vers signIn
      if ((!isAuthenticated || !isInterventionTableCreated) && currentLocation != Routes.signIn.location && currentLocation != Routes.forgotPassword.location) {
        return Routes.signIn.location;
      }
      
      return null;
    },
    routes: [
      GoRoute(
        path: Routes.initial.path,
        name: Routes.initial.name,
        redirect: (_, _) => Routes.home.location,
      ),
      GoRoute(
        path: Routes.signIn.path,
        name: Routes.signIn.name,
        builder: (_, _) => const SignInView(),
        routes: [
          GoRoute(
            path: RouteNames.forgotPassword,
            name: Routes.forgotPassword.name,
            builder: (_, _) => const ForgotPasswordView(),
          ),
        ],
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (_, _) => const HomeView(),
        routes: [
          GoRoute(
            path: '${RouteNames.intervention}/:id',
            name: RouteNames.intervention,
            builder: (context, state) {
              final intervention = state.extra as InterventionDto;
              return InterventionView(
                intervention: intervention,
              );
            },
            routes: [
              GoRoute(
                path: RouteNames.signature,
                name: RouteNames.signature,
                builder: (context, state) {
                  final intervention = state.extra as InterventionDto;
                  return SignatureView(
                    intervention: intervention,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
