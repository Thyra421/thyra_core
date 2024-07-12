import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thyra_core/http/http_client_base.dart';

abstract class HttpRequest<T> {
  @protected
  FutureOr<Uri> get uri;

  @protected
  Map<String, dynamic>? get headers;

  @protected
  T builder(String data);

  Future<T> send(HttpClientBase client);
}
