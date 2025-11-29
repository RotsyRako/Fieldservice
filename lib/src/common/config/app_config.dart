import 'package:envied/envied.dart';

part 'app_config.g.dart';

/// Configuration de l'application chargée depuis les variables d'environnement
/// 
/// Les valeurs sont chargées depuis le fichier .env à la compilation
@Envied(path: '.env')
abstract class AppConfig {
  @EnviedField(varName: 'BASE_URL', defaultValue: 'http://192.168.50.99:3000/api')
  static const String baseUrl = _AppConfig.baseUrl;
}

