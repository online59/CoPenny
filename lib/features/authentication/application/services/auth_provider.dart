
abstract class AuthorizingService {
  Future<dynamic> signIn();
  Future<dynamic> signOut();
  Future<dynamic> register();
}