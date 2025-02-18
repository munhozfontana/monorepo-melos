import 'package:flutter/material.dart';
import 'package:login/page.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginWidget());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold());
    }
  }
}
