abstract class AuthenticationService{
  Future<bool> isLogedIn();
  Future<void> logInWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signUpWithGoogle();
  Future<void> signUpWithApple();
  Future<void> logOut();
}