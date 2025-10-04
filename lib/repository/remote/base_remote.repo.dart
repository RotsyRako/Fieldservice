import 'dart:convert';
import 'dart:io';

import 'package:arkup_edoo/common/utils/string.extension.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:arkup_edoo/common/exceptions/remote.exception.dart';
import 'package:arkup_edoo/common/utils/app.log.dart';
import 'package:arkup_edoo/models/constant/urls.dart';
import 'package:arkup_edoo/repository/secure_storage.dart';

class BaseRemoteRepo {
  final SecureStorage secureStorage;
  final AppLog logger;
  final String baseUrl;

  BaseRemoteRepo({
    required this.secureStorage,
    required this.logger,
    this.baseUrl = Urls.base,
  });

  Future<String> _resolveBaseUrl({String? overrideBaseUrl}) async {
    if (overrideBaseUrl != null && overrideBaseUrl.isNotEmpty) {
      return overrideBaseUrl;
    }
    final stored = await secureStorage.getBaseUrl();
    return (stored != null && stored.isNotEmpty) ? stored : baseUrl;
  }

  Future<Map<String, String>> getHeader({
    bool isFile = false,
    bool tokenRequired = true,
  }) async {
    final headers = {
      "Content-Type":
          isFile
              ? "application/x-www-form-urlencoded; charset=utf-8"
              : "application/json; charset=utf-8",
    };

    if (tokenRequired) {
      final token = await secureStorage.getAccessToken();

      print("token ======> $token");
      headers["Authorization"] = "Bearer $token";
    }

    return headers;
  }

  Map<String, String> get headersFormData => {
    "Content-Type": "application/x-www-form-urlencoded; charset=utf-8",
  };

  Map<String, String> get applicationJson => {
    "Content-Type": "application/json; charset=utf-8",
  };

  String paramsString(Map<String, String>? params) {
    if ((params == null) || (params.isEmpty)) {
      return "";
    }
    var result = "?";
    params.forEach((key, value) {
      result += "$key=$value&";
    });
    return result.substring(0, result.lastIndex());
  }

  Future<dynamic> get(
    String url, {
    Map<String, String>? params,
    bool tokenRequired = true,
    bool isFile = false,
    String? overrideBaseUrl,
  }) async {
    try {
      final base = await _resolveBaseUrl(overrideBaseUrl: overrideBaseUrl);
      var finalUrl = "$base/api$url${paramsString(params ?? null)}";
      final response = await http.get(
        Uri.parse(finalUrl),
        headers: await getHeader(isFile: isFile, tokenRequired: tokenRequired),
      );

      return _returnResponse(response);
    } on SocketException {
      print("SocketException ========== ");
      throw RemoteException(remoteMessage: 'Pas de connexion internet');
    } on Exception catch (e) {
      print("Exception ========== $e");
      throw RemoteException(remoteMessage: e.toString());
    }
  }

  Future<dynamic> post(
    String url, {
    dynamic body,
    bool tokenRequired = true,
    bool isFile = false,
    String? overrideBaseUrl,
  }) async {
    try {
      var json = jsonEncode(body);
      final base = await _resolveBaseUrl(overrideBaseUrl: overrideBaseUrl);
      final response = await http.post(
        Uri.parse(base + "/api" + url),
        headers: await getHeader(isFile: isFile, tokenRequired: tokenRequired),
        body: json,
      );
      return _returnResponse(response);
    } on SocketException {
      print("SocketException ========== ");
      throw RemoteException(remoteMessage: 'Pas de connexion internet');
    } on Exception catch (e) {
      print("Exception ========== $e");
      throw RemoteException(remoteMessage: e.toString());
    }
  }

  Future<dynamic> put(
      String url, {
        dynamic body,
        bool tokenRequired = true,
        bool isFile = false,
        String? overrideBaseUrl,
      }) async {
    try {
      var json = jsonEncode(body);
      final base = await _resolveBaseUrl(overrideBaseUrl: overrideBaseUrl);
      final response = await http.put(
        Uri.parse(base + "/api" + url),
        headers: await getHeader(isFile: isFile, tokenRequired: tokenRequired),
        body: json,
      );
      return _returnResponse(response);
    } on SocketException {
      print("SocketException ========== ");
      throw RemoteException(remoteMessage: 'Pas de connexion internet');
    } on Exception catch (e) {
      print("Exception ========== $e");
      throw RemoteException(remoteMessage: e.toString());
    }
  }

  dynamic _returnResponse(http.Response response) {
    logger.print(tag: "API RESPONSE", data: response.body.toString());
    final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
    if (response.statusCode == 500 || responseJson == null) {
      throw RemoteException(
        remoteMessage: response.body.toString(),
        code: response.statusCode,
      );
    }

    return responseJson;
  }
}

// Providers
final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});

final appLogProvider = Provider<AppLog>((ref) {
  return AppLog.instance;
});

final baseRemoteRepoProvider = Provider<BaseRemoteRepo>((ref) {
  return BaseRemoteRepo(
    secureStorage: ref.read(secureStorageProvider),
    logger: ref.read(appLogProvider),
  );
});
