import 'dart:async';

import 'package:flutter/material.dart';
import 'package:thyra_core/http/http_client_base.dart';
import 'package:thyra_core/http/requests/http_request.dart';

abstract class PostRequest<T> extends HttpRequest<T> {
  @override
  Future<T> send(HttpClientBase client) async =>
      client.post(await uri, builder, body: body, headers: headers);

  @protected
  Map<String, dynamic> get body;
}
