import 'dart:io';

abstract class Activity {
  call(HttpRequest request);

  factory Activity.empty() => _Activity();
}

class _Activity implements Activity {
  _Activity();

  @override
  call(HttpRequest request) {
    print("Calling Activity");
  }
}
