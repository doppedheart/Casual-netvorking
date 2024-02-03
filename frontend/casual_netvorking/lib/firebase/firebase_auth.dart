import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn(
    clientId:
        "390044972602-f767u6c91b93jd15402hn51o3bdug93q.apps.googleusercontent.com");

final githubClientId = "07ab3f880642f0c2b94f";
final githubClientSecret = "fc67bb953fcc76f39be9e23078578e0bf0148c55";
final githubRedirectUrl = "http://casual_netvorking.example.com";

class TFirebaseAuth extends GetxController {
  static TFirebaseAuth get instance {
    if (Get.isRegistered<TFirebaseAuth>()) {
      return Get.find<TFirebaseAuth>();
    } else {
      return Get.put(TFirebaseAuth());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await _auth.signInWithCredential(credential);
    final User? user = authResult.user;

    return authResult;
  }

  Future<UserCredential> signInWithGitHub() async {
    // Trigger the sign-in flow
    final result = await FlutterWebAuth.authenticate(
      url:
          "https://github.com/login/oauth/authorize?client_id=49fb00306d71fc556670&scope=public_repo%20read:user%20user:email",
      callbackUrlScheme: githubRedirectUrl,
    );

    // Extract code from resulting url
    final Uri url = Uri.parse(result);
    final String? code = url.queryParameters['code'];

    // Use this code to get an access token
    final http.Response response = await http.post(
      Uri.parse('https://github.com/login/oauth/access_token'),
      headers: {'Accept': 'application/json'},
      body: {
        'client_id': githubClientId,
        'client_secret': githubClientSecret,
        'code': code
      },
    );

    final Map<String, dynamic> body = JSON.jsonDecode(response.body);

    // Sign in to Firebase with the GitHub access token
    final AuthCredential githubAuthCredential =
        GithubAuthProvider.credential(body['access_token']);
    return await _auth.signInWithCredential(githubAuthCredential);
  }
}
