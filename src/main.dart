import 'dart:io';

import 'app_module.dart';
import 'classes/app_module.dart';
import 'classes/logger.dart';
import '../env.dart';
import 'classes/pipeline.dart';

void main(List<String> arguments) async {
  final server = await HttpServer.bind(Env.address, Env.port);
  print('Server is listen on ${server.address.host}:${server.port}');

  var main = Pipeline(AppHandler(AppRouter()))..addMiddleware(Logger());

  server.listen(main);
}
