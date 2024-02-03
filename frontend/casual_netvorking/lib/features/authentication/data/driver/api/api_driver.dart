import 'package:dio/dio.dart';
// import 'package:eat_healthy/utils/api_response/api_response.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:http/http.dart' as http;

import '../../../../../utils/api_response/api_response.dart';
import '../../../../../utils/http/dio_client.dart';
import '../../../domain/entities/user.dart';

class ApiDriver {
  
  final dioClient = TDioClient.instance;


  Future<User?> loginWithEmailPassword(String email, String password) async {
    final Response? response;

    try {
      Map<String, dynamic> data = {
        'name': 'New User',
        'email': email,
        'password': password,
      };
      response = await dioClient.post(
        '/signup',
        data: data,
      );

      if (response?.statusCode == 200) {
        return User.fromJson(response?.data);
      } else {
        throw Exception('Failed to load data: ${response?.statusCode}');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ApiResponse?> loginWithGoogle(GoogleSignInAccount googleUserAccount) async {
    final Response? response;

    debugPrint("Google Account Id :${googleUserAccount.id}");

    //preparing the request
    Map<String, dynamic> data = {
      'name': googleUserAccount.displayName,
      'email': googleUserAccount.email,
      'password': '',
      'dp': googleUserAccount.photoUrl ?? '',
      'googleId': googleUserAccount.id,
      'appleId': '',
    };

    try {
      //Calling the api
      response = await dioClient.post(
        '/auth/google',
        data: data,
      );

      // parsing the response
      if (response != null && response.statusCode == 201) {
        ApiResponse apiResponse = ApiResponse.fromJson(response.data);

        debugPrint('Api Response: ${apiResponse.toString()}');

        return apiResponse;
      } else {
        debugPrint('Failed to load data: ${response?.statusCode}');
        throw Exception('Failed to load data $response');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
