import 'dart:io';

import '../interfaces/callable.dart';
import 'app_module.dart';

class Pipeline {
  final AppHandler app;

  List<Callable> callbacks = [];

  Pipeline(this.app);

  call(HttpRequest request) async {
    for (var cb in callbacks) {
      await cb.execute(request);
    }
  }

  addMiddleware(Callable cb) {
    callbacks.add(cb);
  }
}
