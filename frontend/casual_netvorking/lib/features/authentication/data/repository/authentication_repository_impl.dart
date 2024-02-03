
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../states/user_state.dart';
import '../../../../utils/api_response/api_response.dart';
import '../../../../utils/exceptions/internet_exception.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../application/repository/authentication_repository.dart';
import '../../domain/entities/user.dart';
import '../database/local_data_source.dart';
import '../driver/Oauth/google_oauth_api.dart';
import '../driver/api/api_driver.dart';

class AuthenticationRepositoryImpl extends GetxController
    implements AuhtenticationRepository {
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

  @override
  Future<User?> logInWithEmailAndPassword(String email, String password) {
    // TODO: implement logInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>> signUpWithGoogle() async {
    //check if the user is connected to the internet
    try {
      await checkInternetConnection();

      //get the google user account
      final googleUserAccount = await googleAuthService.signInWithGoogle();

      //if the google user account is null, return null
      if (googleUserAccount == null) {
        return {'user': null, 'accessToken': null, 'refreshToken': null};
      }

      //get the user from the api
      final ApiResponse? apiResponse =
          await apiDriver.loginWithGoogle(googleUserAccount);

      if (apiResponse == null) {
        return {'user': null, 'accessToken': null, 'refreshToken': null};
      }

      // retrive user ,token and save it to local storage
      final User user = User.fromJson(apiResponse.data['user']);

      await localDataSource.saveUser(user);
      debugPrint('user saved to local storage successfully ${user.name}');
      await localDataSource.saveToken(apiResponse.data['token']['accessToken'],
          apiResponse.data['token']['refreshToken']);

      return {
        'user': user,
        'accessToken': apiResponse.data['token']['accessToken'],
        'refreshToken': apiResponse.data['token']['refreshToken']
      };
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> checkInternetConnection() async {
    if (!await networkManager.isConnected()) {
      throw InternetException("No Internet Connection");
    }
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    await checkInternetConnection();

    final User? newUser;

    try {
      newUser = await apiDriver.loginWithEmailPassword(email, password);
    } catch (e) {
      print(e);
      rethrow;
    }

    return newUser;
  }

  @override
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

  @override
  Future<void> signUpWithApple() {
    // TODO: implement signUpWithApple
    throw UnimplementedError();
  }

  // local storage methods for user
  @override
  Future<Map<String, dynamic>> getUser() async {
    final User? user;
    final String? accessToken;
    final String? refreshToken;
    try {
      user = await localDataSource.getUser();

      if (user != null) {
        accessToken = await localDataSource.getAccessToken();
        refreshToken = await localDataSource.getRefreshToken();
      } else {
        accessToken = null;
        refreshToken = null;
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return {
      'user': user,
      'accessToken': accessToken,
      'refreshToken': refreshToken
    };
  }

  @override
  Future<void> saveUser(
      User user, String accessToken, String refreshToken) async {
    try {
      await localDataSource.saveUser(user);
      await localDataSource.saveToken(accessToken, refreshToken);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> updateAccessToken(String accessToken)async{
      try{  
          await localDataSource.updateAccessToken(accessToken);
      }catch(e){
        print(e);
        rethrow;
      }
  }
}
