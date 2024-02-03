import 'package:google_sign_in/google_sign_in.dart';

class GoogleOAuthApi {
  //creating a new instance of google sign in
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // clientId: "390044972602-f767u6c91b93jd15402hn51o3bdug93q.apps.googleusercontent.com",
    // scopes: [
    //   'profile',
    //   'email',

    // ],
  );

  //function to sign in with google
  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      //triggering the google sign in flow
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      //if the google sign in flow was cancelled
      if (googleSignInAccount == null) {
        return null;
      }

      //if the google sign in flow was successful
      return googleSignInAccount;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //function to sign out
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //function to check if the user is already signed in
  Future<bool> isSignedIn() async {
    try {
      return await _googleSignIn.isSignedIn();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //function to get the current user
  Future<GoogleSignInAccount?> getCurrentUser() async {
    try {
      return await _googleSignIn.signInSilently();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
