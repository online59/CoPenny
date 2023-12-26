import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text("Account Page"),
        ),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: () {
          FirebaseAuth.instance.signOut();
        }, child: const Text('Sign Out')),
      ],
    );
  }
}