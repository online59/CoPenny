

import 'dart:async';


import '../services/auth_service.dart';

class AuthController{

  Future<dynamic> signIn(AuthorizingService authService) async {
    return await authService.signIn();
  }

  Future<dynamic> register(AuthorizingService authService) async {
    return await authService.register();
  }

}
