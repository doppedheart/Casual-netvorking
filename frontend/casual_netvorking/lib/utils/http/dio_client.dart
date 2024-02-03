import 'package:dio/dio.dart' as dio;

import 'package:get/get.dart';

import '../../config/dio/dio_conifg.dart';
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
