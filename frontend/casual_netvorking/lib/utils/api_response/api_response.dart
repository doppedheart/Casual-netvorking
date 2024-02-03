class ApiResponse{
  bool success;
  String message;
  dynamic data;

  ApiResponse({required this.success,required this.message, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json){
    return ApiResponse(
      success: json['success'],
      message: json['message'],
      data: json['data']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'success': success,
      'message': message,
      'data': data
    };
  }

  @override
  String toString() {
    return 'ApiResponse{success: $success, message: $message, data: $data}';
  }
}