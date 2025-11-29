import 'dart:convert';
import 'dart:io';

import 'package:field_service/src/common/config/app_config.dart';
import 'package:field_service/src/common/exceptions/remote_exception.dart';
import 'package:field_service/src/services/technical/app_shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http_parser/http_parser.dart';

part 'base_remote.repository.g.dart';

/// Classe de base pour tous les repositories distants
/// 
/// Fournit les méthodes HTTP de base (GET, POST, PUT) avec gestion automatique
/// des headers, du token d'authentification et des exceptions réseau.
class BaseRemoteRepository {
  final AppSharedPreferences appSharedPreferences;

  BaseRemoteRepository({
    required this.appSharedPreferences,
  });

  /// Résout l'URL de base à utiliser
  /// 
  /// Priorité: overrideBaseUrl > baseUrl du fichier .env
  Future<String> _resolveBaseUrl({String? overrideBaseUrl}) async {
    if (overrideBaseUrl != null && overrideBaseUrl.isNotEmpty) {
      return overrideBaseUrl;
    }
    return AppConfig.baseUrl;
  }

  /// Construit les headers HTTP pour une requête
  /// 
  /// [isFile] : Si true, utilise application/x-www-form-urlencoded
  /// [tokenRequired] : Si false, n'inclut pas le token d'authentification
  Future<Map<String, String>> getHeader({
    bool isFile = false,
    bool tokenRequired = true,
  }) async {
    final headers = <String, String>{
      'Content-Type': isFile
          ? 'application/x-www-form-urlencoded; charset=utf-8'
          : 'application/json; charset=utf-8',
    };

    if (tokenRequired) {
      final token = appSharedPreferences.authToken;

      if (kDebugMode) {
        print('Token ======> $token');
      }
      
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
    }

    return headers;
  }

  /// Headers pour les requêtes FormData
  Map<String, String> get headersFormData => {
        'Content-Type': 'application/x-www-form-urlencoded; charset=utf-8',
      };

  /// Headers pour les requêtes JSON
  Map<String, String> get applicationJson => {
        'Content-Type': 'application/json; charset=utf-8',
      };

  /// Construit une chaîne de paramètres de requête depuis une Map
  /// 
  /// Exemple: {'param1': 'value1', 'param2': 'value2'} => '?param1=value1&param2=value2'
  String paramsString(Map<String, String>? params) {
    if (params == null || params.isEmpty) {
      return '';
    }
    var result = '?';
    params.forEach((key, value) {
      result += '$key=$value&';
    });
    // Retirer le dernier '&'
    return result.substring(0, result.length - 1);
  }

  /// Effectue une requête HTTP GET
  /// 
  /// [url] : Le chemin de l'endpoint (ex: '/interventions/list')
  /// [params] : Paramètres de requête optionnels
  /// [tokenRequired] : Si false, n'inclut pas le token dans les headers
  /// [isFile] : Si true, utilise les headers pour fichiers
  /// [overrideBaseUrl] : URL de base personnalisée pour cette requête
  Future<dynamic> get(
    String url, {
    Map<String, String>? params,
    bool tokenRequired = true,
    bool isFile = false,
    String? overrideBaseUrl,
  }) async {
    try {
      final base = await _resolveBaseUrl(overrideBaseUrl: overrideBaseUrl);
      final finalUrl = '$base/api$url${paramsString(params)}';
      
      if (kDebugMode) {
        print('GET Request: $finalUrl');
      }

      final response = await http.get(
        Uri.parse(finalUrl),
        headers: await getHeader(isFile: isFile, tokenRequired: tokenRequired),
      );

      return _returnResponse(response);
    } on SocketException {
      if (kDebugMode) {
        print('SocketException ========== ');
      }
      throw RemoteException(remoteMessage: 'Pas de connexion internet');
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Exception ========== $e');
      }
      throw RemoteException(remoteMessage: e.toString());
    }
  }

  /// Effectue une requête HTTP POST
  /// 
  /// [url] : Le chemin de l'endpoint (ex: '/auth/login')
  /// [body] : Le corps de la requête (sera encodé en JSON)
  /// [tokenRequired] : Si false, n'inclut pas le token dans les headers
  /// [isFile] : Si true, utilise les headers pour fichiers
  /// [overrideBaseUrl] : URL de base personnalisée pour cette requête
  Future<dynamic> post(
    String url, {
    dynamic body,
    bool tokenRequired = true,
    bool isFile = false,
    String? overrideBaseUrl,
  }) async {
    try {
      final json = jsonEncode(body);
      final base = await _resolveBaseUrl(overrideBaseUrl: overrideBaseUrl);
      final finalUrl = '$base/api$url';

      if (kDebugMode) {
        print('POST Request: $finalUrl');
        print('POST Body: $json');
      }

      final response = await http.post(
        Uri.parse(finalUrl),
        headers: await getHeader(isFile: isFile, tokenRequired: tokenRequired),
        body: json,
      );

      return _returnResponse(response);
    } on SocketException {
      if (kDebugMode) {
        print('SocketException ========== ');
      }
      throw RemoteException(remoteMessage: 'Pas de connexion internet');
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Exception ========== $e');
      }
      throw RemoteException(remoteMessage: e.toString());
    }
  }

  /// Effectue une requête HTTP PUT
  /// 
  /// [url] : Le chemin de l'endpoint (ex: '/interventions/update-status')
  /// [body] : Le corps de la requête (sera encodé en JSON)
  /// [tokenRequired] : Si false, n'inclut pas le token dans les headers
  /// [isFile] : Si true, utilise les headers pour fichiers
  /// [overrideBaseUrl] : URL de base personnalisée pour cette requête
  Future<dynamic> put(
    String url, {
    dynamic body,
    bool tokenRequired = true,
    bool isFile = false,
    String? overrideBaseUrl,
  }) async {
    try {
      final json = jsonEncode(body);
      final base = await _resolveBaseUrl(overrideBaseUrl: overrideBaseUrl);
      final finalUrl = '$base/api$url';

      if (kDebugMode) {
        print('PUT Request: $finalUrl');
        print('PUT Body: $json');
      }

      final response = await http.put(
        Uri.parse(finalUrl),
        headers: await getHeader(isFile: isFile, tokenRequired: tokenRequired),
        body: json,
      );

      return _returnResponse(response);
    } on SocketException {
      if (kDebugMode) {
        print('SocketException ========== ');
      }
      throw RemoteException(remoteMessage: 'Pas de connexion internet');
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Exception ========== $e');
      }
      throw RemoteException(remoteMessage: e.toString());
    }
  }

  /// Effectue une requête HTTP DELETE
  /// 
  /// [url] : Le chemin de l'endpoint
  /// [tokenRequired] : Si false, n'inclut pas le token dans les headers
  /// [overrideBaseUrl] : URL de base personnalisée pour cette requête
  Future<dynamic> delete(
    String url, {
    bool tokenRequired = true,
    String? overrideBaseUrl,
  }) async {
    try {
      final base = await _resolveBaseUrl(overrideBaseUrl: overrideBaseUrl);
      final finalUrl = '$base/api$url';

      if (kDebugMode) {
        print('DELETE Request: $finalUrl');
      }

      final response = await http.delete(
        Uri.parse(finalUrl),
        headers: await getHeader(tokenRequired: tokenRequired),
      );

      return _returnResponse(response);
    } on SocketException {
      if (kDebugMode) {
        print('SocketException ========== ');
      }
      throw RemoteException(remoteMessage: 'Pas de connexion internet');
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Exception ========== $e');
      }
      throw RemoteException(remoteMessage: e.toString());
    }
  }

  /// Effectue une requête HTTP POST avec multipart/form-data pour l'upload de fichiers
  /// 
  /// [url] : Le chemin de l'endpoint (ex: '/recognize-image-upload')
  /// [filePath] : Le chemin du fichier à uploader
  /// [fileFieldName] : Le nom du champ pour le fichier (par défaut 'file')
  /// [tokenRequired] : Si false, n'inclut pas le token dans les headers
  /// [overrideBaseUrl] : URL de base personnalisée pour cette requête
  Future<dynamic> postMultipart(
    String url, {
    required String filePath,
    String fileFieldName = 'file',
    bool tokenRequired = true,
    String? overrideBaseUrl,
  }) async {
    try {
      final base = await _resolveBaseUrl(overrideBaseUrl: overrideBaseUrl);
      final finalUrl = '$base/api$url';

      if (kDebugMode) {
        print('POST Multipart Request: $finalUrl');
        print('File path: $filePath');
      }

      // Créer la requête multipart
      final request = http.MultipartRequest('POST', Uri.parse(finalUrl));

      // Ajouter le fichier
      final file = File(filePath);
      if (!await file.exists()) {
        throw RemoteException(remoteMessage: 'Le fichier n\'existe pas');
      }

      // Détecter le type MIME à partir de l'extension du fichier
      final fileName = filePath.split('/').last.toLowerCase();
      MediaType contentType;
      if (fileName.endsWith('.png')) {
        contentType = MediaType('image', 'png');
      } else if (fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')) {
        contentType = MediaType('image', 'jpeg');
      } else if (fileName.endsWith('.gif')) {
        contentType = MediaType('image', 'gif');
      } else if (fileName.endsWith('.webp')) {
        contentType = MediaType('image', 'webp');
      } else {
        // Par défaut, utiliser jpeg
        contentType = MediaType('image', 'jpeg');
      }

      final fileStream = file.openRead();
      final fileLength = await file.length();
      final multipartFile = http.MultipartFile(
        fileFieldName,
        fileStream,
        fileLength,
        filename: filePath.split('/').last,
        contentType: contentType,
      );

      request.files.add(multipartFile);

      // Ajouter les headers (sans Content-Type, il sera défini automatiquement)
      final headers = <String, String>{};
      if (tokenRequired) {
        final token = appSharedPreferences.authToken;
        if (kDebugMode) {
          print('Token ======> $token');
        }
        if (token != null && token.isNotEmpty) {
          headers['Authorization'] = 'Bearer $token';
        }
      }
      request.headers.addAll(headers);

      // Envoyer la requête
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _returnResponse(response);
    } on SocketException {
      if (kDebugMode) {
        print('SocketException ========== ');
      }
      throw RemoteException(remoteMessage: 'Pas de connexion internet');
    } on Exception catch (e) {
      if (kDebugMode) {
        print('Exception ========== $e');
      }
      throw RemoteException(remoteMessage: e.toString());
    }
  }

  /// Traite la réponse HTTP et retourne les données JSON décodées
  /// 
  /// Lance une [RemoteException] si le statut est 500 ou si la réponse est invalide
  dynamic _returnResponse(http.Response response) {
    if (kDebugMode) {
      print('API RESPONSE Status: ${response.statusCode}');
      print('API RESPONSE Body: ${response.body}');
    }

    // Gérer les réponses vides
    if (response.body.isEmpty) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return null;
      }
      throw RemoteException(
        remoteMessage: 'Réponse vide du serveur',
        code: response.statusCode,
      );
    }

    try {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));

      // Vérifier les erreurs serveur
      if (response.statusCode >= 500 || responseJson == null) {
        throw RemoteException(
          remoteMessage: response.body.toString(),
          code: response.statusCode,
        );
      }

      // Gérer les erreurs client (4xx)
      if (response.statusCode >= 400 && response.statusCode < 500) {
        throw RemoteException(
          remoteMessage: responseJson['message'] ?? response.body.toString(),
          code: response.statusCode,
        );
      }

      return responseJson;
    } on FormatException {
      throw RemoteException(
        remoteMessage: 'Réponse invalide du serveur',
        code: response.statusCode,
      );
    }
  }
}

/// Provider pour BaseRemoteRepository
@Riverpod(keepAlive: true)
BaseRemoteRepository baseRemoteRepository(Ref ref) {
  final appSharedPreferences = ref.watch(appSharedPreferencesProvider).requireValue;
  return BaseRemoteRepository(
    appSharedPreferences: appSharedPreferences,
  );
}

