import 'package:casual_netvorking/firebase/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../states/user_state.dart';
import '../../../../utils/exceptions/internet_exception.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../modal/user.dart';
import '../database/local_data_source.dart';
import '../driver/Oauth/google_oauth_api.dart';
import '../driver/api/api_driver.dart';

class AuthenticationRepositoryImpl extends GetxController {
  //singleton
  static AuthenticationRepositoryImpl get instance {
    if (Get.isRegistered<AuthenticationRepositoryImpl>()) {
      return Get.find<AuthenticationRepositoryImpl>();
    } else {
      return Get.put(AuthenticationRepositoryImpl());
    }
  }

  final apiDriver = ApiDriver();
  final googleAuthService = GoogleOAuthApi();
  final localDataSource = LocalDataSource();
  final networkManager = NetworkManager.instance;

  Future<Map<String, dynamic>?> signUpWithGoogle() async {
    Map<String, dynamic> response = {
      "success": false,
      "message": "Something went wrong",
      "data": null
    };
    //check if the user is connected to the internet
    try {
      await checkInternetConnection();
      // get the google user account
      final googleUserAccount = await googleAuthService.signInWithGoogle();

      // if the google user account is null, return null
      if (googleUserAccount != null) {
        debugPrint('google user account is $googleUserAccount');
        response = await apiDriver.loginWithGoogle(googleUserAccount);
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }

    return response;
  }

  Future<void> checkInternetConnection() async {
    if (!await networkManager.isConnected()) {
      throw InternetException("No Internet Connection");
    }
  }

  Future<void> logOut() async {
    try {
      await checkInternetConnection();
      await localDataSource.deleteUser();
      Get.find<UserState>().removeUser();
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // local storage methods for user
  @override
  Future<Map<String, dynamic>> getUser() async {
    final UserModal? user;
    try {
      user = await localDataSource.getUser();
    } catch (e) {
      print(e);
      rethrow;
    }
    return {
      'user': user,
    };
  }

  @override
  Future<void> saveUser(
      UserModal user, String accessToken, String refreshToken) async {
    try {
      await localDataSource.saveUser(user);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<auth.User?> signUpWithGitHub() async {
    try {
      final userCrendetial = await TFirebaseAuth.instance.signInWithGitHub();
      final user = userCrendetial.user;

      return user;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
