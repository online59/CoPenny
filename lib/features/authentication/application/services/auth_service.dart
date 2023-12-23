
abstract class AuthorizingService {
  Future<void> signIn();
  Future<void> signOut();
  Future<void> register();
}