import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageHelper {
  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  static Future<void> write(String key, String value) async =>
      _storage.write(key: key, value: value);

  /// Return la valeur lue dans le secure storage ou null si la clé n'existe pas.
  static Future<String?> read(String key) async => _storage.read(key: key);

  static Future<void> clear(String key) async => _storage.delete(key: key);
}
