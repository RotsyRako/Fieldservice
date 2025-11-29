import 'package:field_service/src/routing/app_route.dart';
import 'package:field_service/src/routing/route_names.dart';

class Routes {
  static AppRoute get initial => const AppRoute('/', '/', 'initial');

  static AppRoute get signIn => AppRoute(
    '/${RouteNames.signIn}',
    '${initial.location}${RouteNames.signIn}',
    RouteNames.signIn,
  );

  static AppRoute get forgotPassword => AppRoute(
    '/${RouteNames.signIn}/${RouteNames.forgotPassword}',
    '${initial.location}${RouteNames.signIn}/${RouteNames.forgotPassword}',
    RouteNames.forgotPassword,
  );

  static AppRoute get home => AppRoute(
    '/${RouteNames.home}',
    '${initial.location}${RouteNames.home}',
    RouteNames.home,
  );

  static AppRoute intervention(String id) => AppRoute(
    '/${RouteNames.home}/${RouteNames.intervention}/$id',
    '${initial.location}${RouteNames.home}/${RouteNames.intervention}/$id',
    RouteNames.intervention,
  );

  static AppRoute signature(String interventionId) => AppRoute(
    '/${RouteNames.home}/${RouteNames.intervention}/$interventionId/${RouteNames.signature}',
    '${initial.location}${RouteNames.home}/${RouteNames.intervention}/$interventionId/${RouteNames.signature}',
    RouteNames.signature,
  );
}
