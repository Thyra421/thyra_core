class HttpResponseContent {
  HttpResponseContent({
    required this.headers,
    required this.body,
    required this.statusCode,
  });

  final Map<String, dynamic> headers;
  final String body;
  final int statusCode;

  bool get hasError => statusCode >= 400;
}
