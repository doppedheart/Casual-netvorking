import 'package:casual_netvorking/features/authentication/data/database/local_data_source.dart';
import 'package:casual_netvorking/states/user_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../../utils/api_response/api_response.dart';
import '../../../../../utils/http/dio_client.dart';

class ApiDriver {
  final dioClient = TDioClient.instance;

  final localStorage = LocalDataSource();

  Future<Map<String, dynamic>> loginWithGoogle(
      GoogleSignInAccount googleUserAccount) async {
    Map<String, dynamic>? apiResult = {
      "success": false,
      "message": "Something went wrong",
      "data": null
    };

    debugPrint("Google Account Id :${googleUserAccount.id}");

    final formData = FormData.fromMap({
      'name': googleUserAccount.displayName,
      'email': googleUserAccount.email,
      'images': googleUserAccount.photoUrl,
    });

    try {
      //Calling the api
      final response = await dioClient.post(
        '/user/signup',
        data: formData,
      );

      // parsing the response
      if (response != null && response.statusCode == 200) {
        ApiResponse apiResponse = ApiResponse.fromJson(response.data);

        debugPrint('Api Response: ${apiResponse.toString()}');

        //save user to local storage if the response is successful
        if (apiResponse.success) {
          //save user to local storage
          await localStorage.saveUser(apiResponse.data['user']);
          UserState.instance.setUser(apiResponse.data['user']);
          UserState.instance.setLogin(true);
        }

        final returnedResponse = apiResponse.toJson();

        debugPrint('Returned Response: $returnedResponse');

        apiResult = returnedResponse;
      } else {
        debugPrint('Failed to load data: ${response?.statusCode}');
        throw Exception('Failed to load data $response');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }

    return apiResult;
  }
}
