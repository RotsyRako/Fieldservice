class Strings {
  static final _Common common = _Common();

  static final _Login login = _Login();

  static final _Details details = _Details();
}

class _Common {
  String get fieldRequired => "Ce champ est obligatoire";
  String get allfieldRequired => "Veuillez remplir tous les champ";
  String get pleasReply => "Veuillez répondre au question";
  String get passwordRequired => "Ce champ est obligatoire";
  String get mailNotValid => "Email non valide";
  String get phoneNotValid => "Numéro téléphone non valide";
  String get success => "Réussie";
  String get error => "Erreur";
  String get info => "Information";
  String get inProgress => "En cours";
  String get hour => "Heurre";
  String get date => "Date";
  String get email => "Mail";
  String get sms => "Sms";
  String get call => "Appel";
  String get other => "Autre";
  String get cash => "Au comptant";
  String get dueDate => "Echéance";
  String get species => "Espèce";
  String get check => "Chèque";
  String get payment => "Virement";
  String get specify => "Préciser";
  String get yes => "Oui";
  String get no => "Non";
  String get wait => "Chargement";
  String get dealer => "Revendeur";
  String get number => "Nombre";
  String get format => "Format";
  String get noConnection => "Veuillez activer votre connexion Internet.";
}

class _Details {
  String get priority => "Priorité";
  String get client => "Client";
  String get location => "Localisation";
  String get interventionDescription => "Description de l'intervention";
  String get requiredMaterial => "Matériel requis";
}

class _Login {
  String get submit => "Se connecter";
  String get username => "Email";
  String get password => "Mot de passe";
  String get forgotPasswod => "Mot de passe oublié ?";
  String get errorMessage => "Email ou mots de passe incorrecte";
  String get logout => "Déconnexion";
  String get logoutMessage => "Déconnexion avec succès";
}
