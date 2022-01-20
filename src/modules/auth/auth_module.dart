import '../../classes/route.dart';
import '../../classes/router.dart';
import 'auth_activity.dart';

class AuthRouter extends Router {
  AuthRouter(String path) : super(path);

  @override
  List<Route> get routes => [
        Route.get("/", AuthActivity()),
      ];
}
