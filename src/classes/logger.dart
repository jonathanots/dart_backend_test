import 'dart:io';
import 'dart:developer' as dev;

import '../interfaces/callable.dart';

class Logger implements Callable {
  static Future<void> log([HttpRequest? request]) async {
    if (request != null) {
      dev.log(
          "HTTP/${request.protocolVersion} ${request.method} ${request.uri.path}");

      var file = await File("logs/access.log").create(recursive: true);

      await file.writeAsString(
          "HTTP/${request.protocolVersion} ${request.method} ${request.uri.path}\n",
          mode: FileMode.writeOnlyAppend);
    }
  }

  @override
  Future<void> execute([HttpRequest? request]) async {
    Logger.log(request);
  }
}
