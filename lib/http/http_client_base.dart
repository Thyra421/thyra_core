import 'dart:io';

import 'package:thyra_core/http/requests/http_request.dart';
import 'package:thyra_core/http/types/http_response.dart';

abstract class HttpClientBase {
  const HttpClientBase();

  Future<T> send<T>(HttpRequest<T> request) async => request.send(this);

  Future<T> get<T>(
    Uri uri,
    T Function(String data) onSuccess, {
    Map<String, dynamic>? headers,
  });

  Future<T> post<T>(
    Uri uri,
    T Function(String data) onSuccess, {
    Future<void> Function(HttpResponseContent)? intercept,
    Map<String, dynamic>? body,
    File? file,
    Map<String, dynamic>? headers,
  });

  Future<T> patch<T>(
    Uri uri,
    T Function(String data) onSuccess, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  });

  Future<T> delete<T>(
    Uri uri,
    T Function(String data) onSuccess, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
  });

  Future<void> download({
    required Uri uri,
    required String savePath,
    void Function(int, int)? onReceiveProgress,
  });
}
