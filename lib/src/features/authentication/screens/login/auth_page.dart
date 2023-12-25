import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:piggy/src/features/authentication/screens/login/login_screen.dart';
import 'package:piggy/src/features/core/screen/bottom_nav/bottom_navigation_container.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user logged in
        if (snapshot.hasData) {
          return HomePage();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
