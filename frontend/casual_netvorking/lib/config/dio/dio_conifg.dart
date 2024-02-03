import 'package:dio/dio.dart';

import '../../utils/constants/network_constant.dart';


class DioClient {
  late Dio dio;

  DioClient() {
    dio = _configureDio();
  }

  Dio _configureDio() {
    final dio = Dio();
    //create base options
    

    print('DioConfig init ,base url ${NetworkConstants.baseUrl}');

    final baseOptions = BaseOptions(
        baseUrl: NetworkConstants.baseUrl??'',
        connectTimeout: NetworkConstants.connectTimeout,
        receiveTimeout: NetworkConstants.receiveTimeout,
        headers: NetworkConstants.defaultHeader
        );

    //log interceptor
    final logInterceptor = LogInterceptor(
      request: true,
      responseBody: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    );

    dio.options = baseOptions;
    dio.interceptors.add(logInterceptor);

    return dio;
  }

  //add interceptors
  void addInterceptors(Interceptor interceptor) {
    dio.interceptors.add(interceptor);
  }

  void addInterceptorsList(List<Interceptor> interceptors) {
    dio.interceptors.addAll(interceptors);
  }

  void removeInterceptors(Interceptor interceptor) {
    dio.interceptors.remove(interceptor);
  }

  void removeInterceptorsList(List<Interceptor> interceptors) {
    dio.interceptors.removeWhere((element) => interceptors.contains(element));
  }

  void clearInterceptors() {
    dio.interceptors.clear();
  }

  void dispose() {
    dio.close();
  }

  //adding token in header  for auth purpose
  void addTokenInHeader(String token) {
    final headers = NetworkConstants.headerWithToken(token);
    dio.options.headers.addAll(headers);
  }

  //handle response
  dynamic handleResponse(Response response) {
    switch (response.statusCode) {
      case NetworkConstants.successStatusCode:
        return response.data;
      case NetworkConstants.createdStatusCode:
        return response.data;
      case NetworkConstants.acceptedStatusCode:
        return response.data;
      case NetworkConstants.noContentStatusCode:
        return response.data;
      default:
        throw Exception('Failed to load data: ${response.statusCode}');
    }
  }


}
