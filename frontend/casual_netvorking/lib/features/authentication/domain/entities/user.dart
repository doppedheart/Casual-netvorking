class User {
  final String userId;
  final String name;
  final String email;
  final String password;
  final String dp;
  final String phoneNumber;
  final String subscription;
  final String googleId;
  final String appleId;
  final String createdAt;
  User({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.dp,
    required this.phoneNumber,
    required this.subscription,
    required this.googleId,
    required this.appleId,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      dp: json['dp'] ?? "",
      phoneNumber: json['phoneNumber'] ?? "",
      subscription: json['subscription'],
      googleId: json['googleId'] ?? "",
      appleId: json['appleId'] ?? "",
      createdAt: json['createdAt'].toString(),
    );
  }

  factory User.toJson(User user) {
    return User(
      userId: user.userId,
      name: user.name,
      email: user.email,
      password: user.password,
      dp: user.dp,
      phoneNumber: user.phoneNumber,
      subscription: user.subscription,
      googleId: user.googleId,
      appleId: user.appleId,
      //parsing string to int 
      createdAt: user.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'password': password,
      'dp': dp,
      'phoneNumber': phoneNumber,
      'subscription': subscription,
      'googleId': googleId,
      'appleId': appleId,
      //pasrse createdAt from string to int
      'createdAt': createdAt,
    };
  }

  User fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      dp: json['dp'] ?? "",
      phoneNumber: json['phoneNumber'] ?? "",
      subscription: json['subscription'],
      googleId: json['googleId'] ?? "",
      appleId: json['appleId'] ?? "",
      //pasrse createdAt from int to string
      createdAt: json['createdAt'].toString(),
    );
  }
}
