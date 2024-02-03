import 'dart:convert';


import '../../../../service/flutter_secure_storage_service.dart';
import '../../../../service/shared_preferences_storage_service.dart';
import '../../domain/entities/user.dart';

class LocalDataSource {
  final sharedPreferencesStorageService =
      SharedPreferencesStorageService.instance;

  final flutterSecureStorage = FlutterSecureStorageService.instance;

  //save user modal
  Future<void> saveUser(User user) async {
    try {
      final userJson = jsonEncode(user.toJson());
      await sharedPreferencesStorageService.saveString('user', userJson);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //get user modal
  Future<User?> getUser() async {
    try {
      final userJson = await sharedPreferencesStorageService.getString('user');
      if (userJson == null) {
        return null;
      }
      final userMap = jsonDecode(userJson);
      final user = User.fromJson(userMap);
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

  // save token
  Future<void> saveToken(String accessToken, String refreshToken) async {
    try {
      await flutterSecureStorage.write('accessToken', accessToken);
      await flutterSecureStorage.write('refreshToken', refreshToken);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // get access token
  Future<String?> getAccessToken() async {
    try {
      final accessToken = await flutterSecureStorage.read('accessToken');
      return accessToken;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // get refresh token
  Future<String?> getRefreshToken() async {
    try {
      final refreshToken = await flutterSecureStorage.read('refreshToken');
      return refreshToken;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // delete token
  Future<void> deleteToken() async {
    try {
      await flutterSecureStorage.delete('accessToken');
      await flutterSecureStorage.delete('refreshToken');
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  //update token
  Future<void> updateAccessToken(String accessToken) async {
    try {
      await flutterSecureStorage.write('accessToken', accessToken);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
