import 'package:dio/dio.dart';

import '../constants/network_constant.dart';

/// Exception class for handling various errors.
class TDioExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const TDioExceptions([this.message = 'An unexpected error occurred. Please try again.']);

  /// Create an authentication exception from a Firebase authentication exception code.
  factory TDioExceptions.fromError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return  const TDioExceptions(NetworkConstants.connectionTimeoutErrorMessage);
      case DioExceptionType.sendTimeout:
        return  const TDioExceptions(NetworkConstants.sendTimeoutExceptionErrorMessage);
      case DioExceptionType.receiveTimeout:
        return  const TDioExceptions(NetworkConstants.receiveTimeoutExceptionErrorMessage);
      case DioExceptionType.cancel:
        return  const TDioExceptions(NetworkConstants.cancelErrorMessage);
      case DioExceptionType.badCertificate:
        return  const TDioExceptions(NetworkConstants.badCertificateErrorMessage);
      case DioExceptionType.connectionError:
        return  const TDioExceptions(NetworkConstants.connectionErrorErrorMessage);
      case DioExceptionType.badResponse:
        switch (error.response!.statusCode) {
          case NetworkConstants.badRequestStatusCode:
            return  const TDioExceptions(NetworkConstants.badRequestErrorMessage);
          case NetworkConstants.forbiddenStatusCode:
            return  const TDioExceptions(NetworkConstants.forbiddenErrorMessage);
          case NetworkConstants.notFoundStatusCode:
            return const  TDioExceptions(NetworkConstants.notFoundErrorMessage);
          case NetworkConstants.methodNotAllowedStatusCode:
            return  const TDioExceptions(NetworkConstants.methodNotAllowedErrorMessage);
          case NetworkConstants.notAcceptableStatusCode:
            return  const TDioExceptions(NetworkConstants.notAcceptableErrorMessage);
          case NetworkConstants.requestTimeoutStatusCode:
            return  const TDioExceptions(NetworkConstants.requestTimeoutErrorMessage);
          case NetworkConstants.conflictStatusCode:
            return  const TDioExceptions(NetworkConstants.conflictErrorMessage);
          case NetworkConstants.internalServerErrorStatusCode:
            return  const TDioExceptions(NetworkConstants.internalServerErrorErrorMessage);
          case NetworkConstants.notImplementedStatusCode:
            return  const TDioExceptions(NetworkConstants.notImplementedErrorMessage);
          case NetworkConstants.badGatewayStatusCode:
            return  const TDioExceptions(NetworkConstants.badGatewayErrorMessage);
          case NetworkConstants.serviceUnavailableStatusCode:
            return  const TDioExceptions(NetworkConstants.serviceUnavailableErrorMessage);
          case NetworkConstants.gatewayTimeoutStatusCode:
            return  const TDioExceptions(NetworkConstants.gatewayTimeoutErrorMessage);
          default:
            return  const TDioExceptions(NetworkConstants.defaultErrorMessage);
        }
      case DioExceptionType.unknown:
        return  const TDioExceptions(NetworkConstants.defaultErrorMessage);
    }
  }
}
