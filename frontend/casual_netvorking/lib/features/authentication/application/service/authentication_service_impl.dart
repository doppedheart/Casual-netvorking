import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../states/user_state.dart';
import '../../data/repository/authentication_repository_impl.dart';
import '../../domain/entities/user.dart';
import '../../domain/service/authentication_service.dart';

class AuthenticationServiceimpl extends GetxController
    implements AuthenticationService {
  final _authenticationRepository = AuthenticationRepositoryImpl.instance;

  static AuthenticationServiceimpl get instance {
    if (Get.isRegistered<AuthenticationServiceimpl>()) {
      return Get.find<AuthenticationServiceimpl>();
    } else {
      return Get.put(AuthenticationServiceimpl());
    }
  }

  final _userState = UserState.instance;

    Future<void> init() async {
    try {
      final userData = await _authenticationRepository.getUser();
      if (userData['user'] != null) {
        _userState.setUser(userData['user'],userData['accessToken'],
        
        userData['refreshToken']);
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    final User? newUser;
    try {
      newUser = await _authenticationRepository.signUpWithEmailAndPassword(
          email, password);
      if (newUser != null) {
        debugPrint('new User signed in with email and password');
        // await _authenticationRepository.saveUser(newUser);
        // _userState.setUser(newUser);
      }
    } catch (e) {
      print(e);
      rethrow;
    }
    return newUser;
  }

  @override
  Future<User?> signUpWithGoogle() async {
    try {
      final newUserData = await _authenticationRepository.signUpWithGoogle();
      if (newUserData['user'] != null) {
        debugPrint('new User signed in with google');
        await _authenticationRepository.saveUser(
          newUserData['user'],newUserData['accessToken'],newUserData['refreshToken']
        );
        _userState.setUser(newUserData['user'],newUserData['accessToken'],
        newUserData['refreshToken']);
      }
      return newUserData['user'];
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<bool> isLogedIn() {
    // TODO: implement isLogedIn
    throw UnimplementedError();
  }

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) {
    // TODO: implement logInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() async {
    try {
      await _authenticationRepository.logOut();
      _userState.removeUser();
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
}
