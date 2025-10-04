class Urls {
  // static const String base = "bored-api.appbrewery.com";

  static const String base = "https://dlr.dev.arkeup.com";

  // static const String base = "https://hedgehog-able-vastly.ngrok-free.app/api";

  static _Activity activity = _Activity();

  static _url url = _url();
}

class _Activity {
  String get random => "/random";
}

class _url {
  String get login => "/auth/login";
  String get resetPassword => "/auth/reset-password";
  String get interventionList => "/interventions/list";
  String get synchro => "/interventions/sync";
  String get updateStatus => "/interventions/update-status";
  String get materialsAvailable => "/interventions/materials";
  String get ping => "/ping";
  String get interventions => "/interventions";
  String get timesheet => "/create-timesheet";

}
