import 'classes/router.dart';
import 'modules/auth/auth_module.dart';

class AppRouter extends Router {
  AppRouter(String path) : super(path);

  @override
  // TODO: implement routers
  List<Router> get routers => [AuthRouter("/auth")];
}
