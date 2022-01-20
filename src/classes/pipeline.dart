import 'dart:io';

import '../interfaces/callable.dart';

class Pipeline {
  List<Callable> callbacks = [];

  addMiddleware(Callable cb) {
    callbacks.add(cb);
  }

  listen(HttpRequest request) async {
    for (var cb in callbacks) {
      await cb.execute(request);
    }
  }
}
