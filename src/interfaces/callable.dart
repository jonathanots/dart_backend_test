import 'dart:io';

abstract class Callable {
  Future<void> execute([HttpRequest? request]);
}
