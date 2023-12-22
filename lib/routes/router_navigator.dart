import 'package:flutter/material.dart';
import 'package:piggy/features/wallet/presentation/screens/my_wallet_page.dart';

import '../features/authentication/presentation/screens/login_page.dart';
import '../shared/presentation/screens/home_page.dart';

class RouterNavigator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute<HomePage>(builder: (_) => HomePage());
      case '/home':
        return MaterialPageRoute<HomePage>(builder: (_) => HomePage());
      case '/login':
        return MaterialPageRoute<LoginPage>(builder: (_) => const LoginPage());
      case '/wallet':
        return MaterialPageRoute<MyWalletPage>(builder: (_) => const MyWalletPage());

      default:
        return MaterialPageRoute<HomePage>(builder: (_) => HomePage());
    }
  }
}
