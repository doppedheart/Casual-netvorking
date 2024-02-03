import '../../domain/entities/user.dart';

abstract class AuhtenticationRepository {
  Future<User?> logInWithEmailAndPassword(String email, String password);
  Future<void> signUpWithEmailAndPassword(String email, String password);
  Future<void> signUpWithGoogle();
  Future<void> signUpWithApple();
  Future<void> logOut();

  // local storage
  Future<void> saveUser(User user, String accessToken, String refreshToken);
  Future<Map<String, dynamic>> getUser();
}
