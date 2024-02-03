
import 'package:get/get.dart';

import '../api_response/api_response.dart';
import '../http/dio_client.dart';

class TokenApi extends GetxController {
  static TokenApi get instance {
    if (Get.isRegistered<TokenApi>()) {
      return Get.find<TokenApi>();
    } else {
      return Get.put(TokenApi());
    }
  }

  final dioClient = TDioClient.instance;

  //Get new access token i exchange of refresh token
  Future<String?> getNewAccessToken(String refreshToken) async {
    try {
      final response = await dioClient.post(
        '/token/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      if (response!=null&&response?.statusCode == 200) {
        final apiResponse = ApiResponse.fromJson(response.data);
        final accessToken = apiResponse.data['accessToken'];
        return accessToken;
      } else {
        throw Exception('Failed to load data: ${response?.statusCode}');
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
