import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:piggy/src/features/authentication/screens/login/login_screen.dart';
import 'package:piggy/src/features/core/screen/bottom_nav/core_container_screen.dart';
import 'package:piggy/src/features/wallet/controller/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

class ScreenDirecting extends StatelessWidget {
  const ScreenDirecting({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user logged in
        if (snapshot.hasData) {
          return ChangeNotifierProvider(
            create: (BuildContext context) => WalletProvider(),
            child: const CoreContainerScreen(),
          );
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
