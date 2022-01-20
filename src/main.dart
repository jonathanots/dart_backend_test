import 'dart:io';

import 'app_module.dart';
import 'classes/handler.dart';
import 'classes/logger.dart';
import '../env.dart';
import 'classes/pipeline.dart';
import 'classes/response.dart';

void main(List<String> arguments) async {
  final server = await HttpServer.bind(Env.address, Env.port);
  print('Server is listen on ${server.address.host}:${server.port}');

  var pipeline = Pipeline()..addMiddleware(Logger());

  server.listen((request) async {
    // final router = AppRouter('/');

    // router.listen(request);

    pipeline.listen(request);
  });
}
