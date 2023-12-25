import 'package:firebase_auth/firebase_auth.dart';

import 'auth_service.dart';

class FirebaseAuthService implements AuthorizingService {
  final String? email;
  final String? password;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final bool isAnonymous;

  FirebaseAuthService({this.email, this.password, required this.isAnonymous});

  @override
  Future register() async {
    return await firebaseAuth.createUserWithEmailAndPassword(email: email!, password: password!);
  }

  @override
  Future signIn() async {

    if (isAnonymous) {
      return await firebaseAuth.signInAnonymously();
    } else {
      return await firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
    }

  }

  @override
  Future signOut() {
    return firebaseAuth.signOut();
  }
}
