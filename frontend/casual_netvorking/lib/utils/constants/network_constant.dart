

class NetworkConstants {
  //base url
  // static String? baseUrl = dotenv.env['baseURI'];
  static String? baseUrl = "https://reqres.in/api";
  //api version
  static const String apiVersion = "v1";

  //headers
  static const Map<String, String> defaultHeader = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  //header with token
  static Map<String, String> headerWithToken(String token) {
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "authorization": token,
    };
  }

  //endpoints
  static const String posts = "posts";
  static const String comments = "comments";
  static const String albums = "albums";
  static const String photos = "photos";

  //status codes
  static const int successStatusCode = 200;
  static const int createdStatusCode = 201;
  static const int acceptedStatusCode = 202;
  static const int noContentStatusCode = 204;
  static const int badRequestStatusCode = 400;
  static const int unauthorizedStatusCode = 401;
  static const int forbiddenStatusCode = 403;
  static const int notFoundStatusCode = 404;
  static const int methodNotAllowedStatusCode = 405;
  static const int notAcceptableStatusCode = 406;
  static const int requestTimeoutStatusCode = 408;
  static const int conflictStatusCode = 409;
  static const int internalServerErrorStatusCode = 500;
  static const int notImplementedStatusCode = 501;
  static const int badGatewayStatusCode = 502;
  static const int serviceUnavailableStatusCode = 503;
  static const int gatewayTimeoutStatusCode = 504;

  //dio
  static const Duration connectTimeout =
      Duration(milliseconds: 30000); //30 seconds
  static const Duration receiveTimeout =
      Duration(milliseconds: 30000); //30 seconds
  static const Duration sendTimeout =
      Duration(milliseconds: 30000); //30 seconds

  //dio error messages
  static const String noInternetConnection = "No Internet Connection";
  static const String connectionTimeout = "Connection Timeout";
  static const String sendTimeoutException = "Send Timeout Exception";
  static const String receiveTimeoutException = "Receive Timeout Exception";
  static const String badCertificate = "Bad Certificate";
  static const String connectionError = "Connection Error";
  static const String defaultError = "Something went wrong";

  //dio error codes
  static const int noInternetConnectionErrorCode = 1;
  static const int connectionTimeoutErrorCode = 2;
  static const int sendTimeoutExceptionErrorCode = 3;
  static const int receiveTimeoutExceptionErrorCode = 4;
  static const int defaultErrorCode = 5;

  //dio error types
  static const String noInternetConnectionErrorType =
      "NoInternetConnectionError";
  static const String connectionTimeoutErrorType = "ConnectionTimeoutError";
  static const String sendTimeoutExceptionErrorType =
      "SendTimeoutExceptionError";
  static const String receiveTimeoutExceptionErrorType =
      "ReceiveTimeoutExceptionError";
  static const String defaultErrorType = "DefaultError";

  //dio error messages
  static const String noInternetConnectionErrorMessage =
      "No Internet Connection";
  static const String connectionTimeoutErrorMessage = "Server is not responding";
  static const String sendTimeoutExceptionErrorMessage =
      "Send Timeout Exception";
  static const String receiveTimeoutExceptionErrorMessage =
      "Receive Timeout Exception";
  static const String defaultErrorMessage = "Something went wrong";
  static const String cancelErrorMessage = "Request to API server was cancelled";
  static const String badCertificateErrorMessage =
      "Unable to verify SSL certificate";
  static const String connectionErrorErrorMessage ="Connection Error";
  static const String badResponseErrorMessage = "Bad Response Error";
  static const String badRequestErrorMessage = "Bad Request Error";
  static const String unauthorizedErrorMessage = "Unauthorized Error";
  static const String forbiddenErrorMessage = "Forbidden Error";
  static const String notFoundErrorMessage = "Not Found Error";
  static const String methodNotAllowedErrorMessage =
      "Method Not Allowed Error";
  static const String notAcceptableErrorMessage = "Not Acceptable Error";
  static const String requestTimeoutErrorMessage = "Request Timeout Error";
  static const String conflictErrorMessage = "Conflict Error";
  static const String internalServerErrorErrorMessage =
      "Internal Server Error";
  static const String notImplementedErrorMessage = "Not Implemented Error";
  static const String badGatewayErrorMessage = "Bad Gateway Error";
  static const String serviceUnavailableErrorMessage =
      "Service Unavailable Error";
  static const String gatewayTimeoutErrorMessage = "Gateway Timeout Error";
}
