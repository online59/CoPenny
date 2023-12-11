
import 'package:firebase_auth/firebase_auth.dart';

import 'auth_provider.dart';

class AnonymousAuthService implements AuthorizingService {

  static AnonymousAuthService? _instance;

  AnonymousAuthService._internal();

  //implement singleton
  factory AnonymousAuthService() {
    _instance ??= AnonymousAuthService._internal();
    return _instance!;
  }

  @override
  Future register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future signIn() async {
    return await FirebaseAuth.instance.signInAnonymously();
  }

  @override
  Future signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}