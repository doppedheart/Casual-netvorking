import 'package:dio/dio.dart' as dio;

import 'package:get/get.dart';


import '../../config/dio/dio_conifg.dart';
import '../api/token_api.dart';
import '../exceptions/dio_exception.dart';

class TDioClient extends GetxController {
  static TDioClient get instance {
    if (Get.isRegistered<TDioClient>()) {
      return Get.find<TDioClient>();
    } else {
      return Get.put(TDioClient());
    }
  }

  // Replace with your API base URL
  final dioClient = DioClient();

  final isTokenAdd = false.obs;
  final isTokenErrorInterceptorAdded = false.obs;

  void addAcessTokenToHeader(String token) {
    dioClient.addTokenInHeader(token);
    isTokenAdd.value = true;
  }

  void addInterceptToautomaticallyUpdateAccessToken() {
    dioClient.addInterceptors(dio.InterceptorsWrapper(onError:
        (dio.DioException e, dio.ErrorInterceptorHandler handler) async {
      if (e.response?.statusCode == 401) {
        // get new access token
        final tokenApi = TokenApi.instance;
        final userState = UserState.instance;
        final refreshToken = userState.refreshToken!;
        final newAccessToken = await tokenApi.getNewAccessToken(
          refreshToken,
        );


      if(newAccessToken==null||newAccessToken.isEmpty){
          //remove user from local storage
        userState.removeUser();
        //remove user from app
        userState.removeUser();
        //redirect to login page
        Get.offAllNamed('/login');
      }
      //update new accessToken in local Storage 
      userState.updateAccessToken(newAccessToken!);
        addAcessTokenToHeader(newAccessToken);

        // retry failed request
        handler.resolve(await dioClient.dio.request(
          e.requestOptions.path,
          cancelToken: e.requestOptions.cancelToken,
          data: e.requestOptions.data,
          onReceiveProgress: e.requestOptions.onReceiveProgress,
          onSendProgress: e.requestOptions.onSendProgress,
          queryParameters: e.requestOptions.queryParameters,
          // options: e.requestOptions,
        ));
      } else {
        // Let the error "pass through" if it's not the error we're looking for
        TDioExceptions.fromError(e);
      }
    }));
  }

  // Helper method to make a GET request
  Future<dio.Response?> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
    dio.ProgressCallback? onReceiveProgress,
  }) async {
    dio.Response? response;
    try {
      response = await dioClient.dio.get(
        endpoint,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on dio.DioException catch (e) {
      print(e);
      throw TDioExceptions.fromError(e);
    } catch (e) {
      print(e);
      rethrow;
    }

    return response;
  }

  // Helper method to make a POST request
  Future<dio.Response?> post(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
    dio.ProgressCallback? onSendProgress,
    dio.ProgressCallback? onReceiveProgress,
  }) async {
    dio.Response? response;
    try {
      response = await dioClient.dio.post(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on dio.DioException catch (e) {
      print(e);
      throw TDioExceptions.fromError(e);
    } catch (e) {
      print(e);
      rethrow;
    }

    return response;
  }

  // Helper method to make a PUT request
  Future<dio.Response?> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
    dio.ProgressCallback? onSendProgress,
    dio.ProgressCallback? onReceiveProgress,
  }) async {
    dio.Response? response;
    try {
      response = await dioClient.dio.put(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on dio.DioException catch (e) {
      print(e);
      throw TDioExceptions.fromError(e);
    } catch (e) {
      print(e);
      rethrow;
    }

    return response;
  }

  // Helper method to make a DELETE request
  Future<dio.Response?> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
  }) async {
    dio.Response? response;
    try {
      response = await dioClient.dio.delete(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on dio.DioException catch (e) {
      print(e);
      throw TDioExceptions.fromError(e);
    } catch (e) {
      print(e);
      rethrow;
    }

    return response;
  }

//patch
  Future<dio.Response?> patch(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    dio.Options? options,
    dio.CancelToken? cancelToken,
    dio.ProgressCallback? onSendProgress,
    dio.ProgressCallback? onReceiveProgress,
  }) async {
    dio.Response? response;
    try {
      response = await dioClient.dio.patch(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
    } on dio.DioException catch (e) {
      print(e);
      throw TDioExceptions.fromError(e);
    } catch (e) {
      print(e);
      rethrow;
    }

    return response;
  }
}
