import 'dart:io';

import 'activity.dart';
import 'response.dart';
import 'route.dart';

class Router {
  final String path;

  Route currentRoute = Route.empty();

  List<Route> get routes => [];

  List<Router> get routers => [];

  get(String path, Activity activity) {
    routes.add(Route.get(path, activity));
  }

  post(String path, Activity activity) {
    routes.add(Route.post(path, activity));
  }

  put(String path, Activity activity) {
    routes.add(Route.put(path, activity));
  }

  delete(String path, Activity activity) {
    routes.add(Route.delete(path, activity));
  }

  listen([HttpRequest? request, List<String>? path]) {
    if (request == null) {
      throw Exception("None request was passed to router");
    }

    List<String> paths = [];

    paths.addAll(path ?? request.uri.pathSegments);

    if (routers.isNotEmpty) {
      for (var router in routers) {
        if (paths.indexWhere((segment) => "/$segment" == router.path) > -1) {
          paths.removeAt(0);
          router.listen(request, paths);
          break;
        }
      }
      Response(request, 400, {"message": "Rota não encontrada"});
    } else {
      for (var route in routes) {
        if (paths.isEmpty || route.path == "/${paths[0]}") {
          if (route.method == request.method) {
            route.activity.call(request);
            break;
          } else {
            Response(request, 400, {"message": "Método não encontrado"});
            break;
          }
        } else {
          Response(request, 400, {"message": "Rota não encontrada"});
          break;
        }
      }
    }
  }

  Router(this.path);
}
