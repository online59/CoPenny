

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class AuthController{

  Future<dynamic> signIn(AuthorizingService authService) async {
    return await authService.signIn();
  }

  Future<dynamic> register(AuthorizingService authService) async {
    return await authService.register();
  }

}
