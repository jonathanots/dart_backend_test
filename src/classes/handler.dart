import 'dart:async';
import 'dart:io';

import 'response.dart';

typedef Handler = FutureOr<Response> Function(HttpRequest);
