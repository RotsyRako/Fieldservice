import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const String _keyAccessToken = 'access_token';
  static const String _keyRefreshToken = 'refresh_token';

  static const String _keyBaseUrl = 'base_url';

  static const String _keyIsFirstLaunch = 'is_first_launch';

  final FlutterSecureStorage _storage;

  SecureStorage({FlutterSecureStorage? storage})
    : _storage = storage ?? const FlutterSecureStorage();

  // Token management
  Future<void> saveAccessToken(String token) async {
    await _storage.write(
      key: _keyAccessToken,
      value: token,
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<String?> getAccessToken() async {
    return await _storage.read(
      key: _keyAccessToken,
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(),
    );
  }

  Future<void> saveRefreshToken(String token) async {
    await _storage.write(
      key: _keyRefreshToken,
      value: token,
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<String?> getRefreshToken() async {
    return await _storage.read(
      key: _keyRefreshToken,
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(),
    );
  }

  Future<void> deleteTokens() async {
    await _storage.delete(
      key: _keyAccessToken,
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(),
    );
    await _storage.delete(
      key: _keyRefreshToken,
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(),
    );
  }

  // Base URL management
  Future<void> saveBaseUrl(String url) async {
    await _storage.write(
      key: _keyBaseUrl,
      value: url,
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  Future<String?> getBaseUrl() async {
    return await _storage.read(
      key: _keyBaseUrl,
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
      iOptions: IOSOptions(),
    );
  }

  Future<void> deleteBaseUrl() async {
    await _storage.delete(key: _keyBaseUrl);
  }

  Future<void> setFirstLaunchCompleted() async {
    await _storage.write(key: _keyIsFirstLaunch, value: 'false');
  }

  Future<bool> isFirstLaunch() async {
    final value = await _storage.read(key: _keyIsFirstLaunch);
    return value != 'false';
  }

  // Clear all data
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await getAccessToken();
    return token != null && token.isNotEmpty;
  }
}

final secureStorageProvider = Provider<SecureStorage>((ref) {
  return SecureStorage();
});
