import 'dart:convert';

import '../../../../service/flutter_secure_storage_service.dart';
import '../../../../service/shared_preferences_storage_service.dart';
import '../../modal/user.dart';

class LocalDataSource {
  final sharedPreferencesStorageService =
      SharedPreferencesStorageService.instance;

  final flutterSecureStorage = FlutterSecureStorageService.instance;

  //save user modal
  Future<void> saveUser(UserModal user) async {
    try {
      final userJson = jsonEncode(user.toMap());
      await sharedPreferencesStorageService.saveString('user', userJson);
      await setLogin(true);
      await setProfileComplete(true);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> setLogin(bool isLogin) async {
    try {
      await sharedPreferencesStorageService.saveBool('isLogin', isLogin);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> getLogin() async {
    try {
      final isLogin = await sharedPreferencesStorageService.getBool('isLogin');
      return isLogin ?? false;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> setProfileComplete(bool isProfileComplete) async {
    try {
      await sharedPreferencesStorageService.saveBool(
          'isProfileComplete', isProfileComplete);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> getProfileComplete() async {
    try {
      final isProfileComplete =
          await sharedPreferencesStorageService.getBool('isProfileComplete');
      return isProfileComplete ?? false;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
  //get user modal
  Future<UserModal?> getUser() async {
    try {
      final userJson = await sharedPreferencesStorageService.getString('user');
      if (userJson == null) {
        return null;
      }
      final userMap = jsonDecode(userJson);
      final user = UserModal.fromJson(userMap);
      return user;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //delete user modal
  Future<void> deleteUser() async {
    try {
      await sharedPreferencesStorageService.remove('user');
      await flutterSecureStorage.delete('accessToken');
      await flutterSecureStorage.delete('refreshToken');
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
