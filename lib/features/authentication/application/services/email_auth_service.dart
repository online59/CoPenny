import 'package:firebase_auth/firebase_auth.dart';

import 'auth_provider.dart';

class EmailAuthService implements AuthorizingService {
  final String _email;
  final String _password;

  static EmailAuthService? _instance;

  EmailAuthService._internal(this._email, this._password);

  //implement singleton
  factory EmailAuthService(String email, String password) {
    _instance ??= EmailAuthService._internal(email, password);
    return _instance!;
  }

  @override
  Future register() async {
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
  }

  @override
  Future signIn() async {
    return await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _email,
      password: _password,
    );
  }

  @override
  Future signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
