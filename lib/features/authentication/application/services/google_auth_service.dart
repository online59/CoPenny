
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_provider.dart';

class GoogleAuthService implements AuthorizingService {

  static GoogleAuthService? _instance;

  GoogleAuthService._internal();

  //implement singleton
  factory GoogleAuthService() {
    _instance ??= GoogleAuthService._internal();
    return _instance!;
  }

  @override
  Future register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future signIn() async{
    // begin interactive sign in process
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await user!.authentication;

    // create new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // sign in!
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}