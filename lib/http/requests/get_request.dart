import 'dart:async';

import 'package:thyra_core/http/http_client_base.dart';
import 'package:thyra_core/http/requests/http_request.dart';

abstract class GetRequest<T> extends HttpRequest<T> {
  @override
  Future<T> send(HttpClientBase client) async => client.get(await uri, builder);
}
