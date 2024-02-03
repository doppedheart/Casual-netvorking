import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../application/service/authentication_service_impl.dart';
import '../entities/user.dart';

class AuthenticationUsecase {
  final authenticationService = Get.put(AuthenticationServiceimpl());

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    final User? newUser;
    try {
      newUser = await authenticationService.signUpWithEmailAndPassword(
          email, password);
    } catch (e) {
      print(e);
      rethrow;
    }
    return newUser;
  }

  Future<User?> signUpWithGoogle() async {
    final User? newUser;
    try {
      newUser = await authenticationService.signUpWithGoogle();

      if (newUser != null) {
        debugPrint('new User signed in with google');
      }
    } catch (e) {
      print(e);
      rethrow;
    }

    return newUser;
  }

  Future<bool> isLogedIn() async {
    final bool isLogedIn;
    try {
      isLogedIn = await authenticationService.isLogedIn();
    } catch (e) {
      print(e);
      rethrow;
    }
    return isLogedIn;
  }

  Future<void> logOut() async {
    try {
      await authenticationService.logOut();
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
