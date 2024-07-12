import 'dart:io';

import 'package:thyra_core/http/http_client_base.dart';
import 'package:thyra_core/http/requests/http_request.dart';

/// Abstrait l'implementation du client HTTP utilisé par l'application. Contient une référence au client HTTP à utiliser pour chaque requête. Le `client` doit être défini dans le main pour pouvoir faire des requêtes http(s).
class Http {
  static HttpClientBase? client;

  static Future<T> send<T>(HttpRequest<T> request) {
    assert(client != null, 'Http client must be assigned.');
    return request.send(client!);
  }

  static Future<T> delete<T>(
    Uri uri,
    T Function(String data) onSuccess, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) {
    assert(client != null, 'Http client must be assigned.');
    return client!.delete(uri, onSuccess, body: body, headers: headers);
  }

  static Future<T> get<T>(
    Uri uri,
    T Function(String data) onSuccess, {
    Map<String, String>? headers,
  }) {
    assert(client != null, 'Http client must be assigned.');
    return client!.get(uri, onSuccess, headers: headers);
  }

  static Future<T> patch<T>(
    Uri uri,
    T Function(String data) onSuccess, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) {
    assert(client != null, 'Http client must be assigned.');
    return client!.patch(uri, onSuccess, body: body, headers: headers);
  }

  static Future<T> post<T>(
    Uri uri,
    T Function(String data) onSuccess, {
    Map<String, dynamic>? body,
    File? file,
    Map<String, String>? headers,
  }) {
    assert(client != null, 'Http client must be assigned.');
    return client!
        .post(uri, onSuccess, body: body, headers: headers, file: file);
  }

  static Future<void> download({
    required Uri uri,
    required String savePath,
    void Function(int received, int total)? onReceiveProgress,
  }) {
    assert(client != null, 'Http client must be assigned.');
    return client!.download(
      uri: uri,
      savePath: savePath,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
