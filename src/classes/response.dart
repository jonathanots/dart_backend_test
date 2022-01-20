import 'dart:convert';
import 'dart:io';

class Response {
  final HttpRequest request;
  final int statusCode;
  final dynamic data;

  Response(this.request, this.statusCode, this.data) {
    _do();
  }

  _do() {
    request.response.statusCode = statusCode;
    request.response.write(jsonEncode(data));
    request.response.close();
  }
}
