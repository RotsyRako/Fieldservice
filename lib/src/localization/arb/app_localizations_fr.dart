// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Field Service';

  @override
  String get email => 'Email';

  @override
  String get password => 'Mot de passe';

  @override
  String get connection => 'Connexion';

  @override
  String get yourTechnicianSpace => 'Votre espace technicien';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get signIn => 'Se connecter';

  @override
  String get resetPassword => 'Réinitialiser mon mot de passe';

  @override
  String get resetPasswordDescription =>
      'Entrez votre adresse e-mail pour recevoir un lien de réinitialisation. Vous devez être connecté à Internet pour finaliser cette opération.';

  @override
  String get sendResetLink => 'Envoyer le lien de réinitialisation';

  @override
  String get myInterventions => 'Mes interventions';

  @override
  String get searchIntervention => 'Rechercher une intervention...';

  @override
  String get ongoing => 'En cours';

  @override
  String get planned => 'Planifiées';

  @override
  String get completed => 'Terminées';

  @override
  String get online => 'En ligne';

  @override
  String get signOut => 'Se déconnecter';

  @override
  String get noData => 'Aucune intervention';
}
