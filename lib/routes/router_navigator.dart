import 'package:flutter/material.dart';

import '../features/authentication/presentation/screens/login_page.dart';
import '../shared/presentation/screens/home_page.dart';

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<HomePage>(builder: (context) => HomePage());

      case '/home':
        return MaterialPageRoute<HomePage>(builder: (context) => HomePage());

      case '/login':
        return MaterialPageRoute<LoginPage>(builder: (context) => const LoginPage());

      default:
        return MaterialPageRoute<HomePage>(builder: (context) => HomePage());
    }
  }
}