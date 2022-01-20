import 'activity.dart';

class Route {
  final String path;
  final String? name;
  final Activity activity;
  final String method;
  Map<String, dynamic> params;

  Route(this.path, this.activity, this.method,
      {this.name, this.params = const {}});

  static Map<String, dynamic> getParams(String path) {
    var params = path
        .split("/")
        .where((element) => element[0] == ":")
        .map((e) => e.substring(1))
        .toList();

    return {};
  }

  factory Route.empty() {
    return Route("/", Activity.empty(), "GET", name: "empty");
  }

  factory Route.get(String path, Activity activity, {String? name}) {
    return Route(path, activity, "GET", name: name, params: getParams(path));
  }

  factory Route.post(String path, Activity activity, {String? name}) {
    return Route(path, activity, "POST", name: name, params: getParams(path));
  }

  factory Route.put(String path, Activity activity, {String? name}) {
    return Route(path, activity, "PUT", name: name, params: getParams(path));
  }

  factory Route.delete(String path, Activity activity, {String? name}) {
    return Route(path, activity, "DEL", name: name, params: getParams(path));
  }
}
