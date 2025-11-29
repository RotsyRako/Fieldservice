import 'package:field_service/src/common/config/app_config.dart';

class Urls {
  static String get base => AppConfig.baseUrl;

  // ignore: library_private_types_in_public_api
  static UrlsData urls = UrlsData();
}

class UrlsData {
  String get login => "/auth/login";
  String get resetPassword => "/auth/reset-password";
  String get interventions => "/interventions";
  String get interventionsByUser => "/interventions/users";
  String get interventionsSearch => "/interventions/search";
  String get interventionsCount => "/interventions/count";
  String get synchro => "/interventions/sync";
  String updateStatus(String idIntervention) => "/interventions/$idIntervention";
  String get materialsAvailable => "/interventions/materials";
  String get ping => "/ping";
  String get timesheet => "/create-timesheet";
  String get recognizeImageUpload => "/recognize-image-upload";

  String interventionById(String id) => "/interventions/$id";
  
  String commentsByIntervention(String idIntervention) => "/comments/interventions/$idIntervention";
  String documentsByIntervention(String idIntervention) => "/documents/interventions/$idIntervention";
  String imagesByIntervention(String idIntervention) => "/images/interventions/$idIntervention";
  String materialsByIntervention(String idIntervention) => "/materiels/interventions/$idIntervention";
  String signaturesByIntervention(String idIntervention) => "/signatures/interventions/$idIntervention";
  String timesheetsByIntervention(String idIntervention) => "/timesheets/interventions/$idIntervention";
}
