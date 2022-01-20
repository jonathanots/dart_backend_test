import 'dart:io';

import '../../classes/activity.dart';
import '../../classes/response.dart';

class AuthActivity implements Activity {
  @override
  call(HttpRequest request) {
    print("Calling Auth Activity");
    Response(request, 200, {"message": "Deu bom"});
  }
}
