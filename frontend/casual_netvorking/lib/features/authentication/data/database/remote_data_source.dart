// import 'dart:convert';

// class AuhtenticationRemoteDataSource{
//   final http.Client client;

//   AuhtenticationRemoteDataSource({required this.client});

//   Future<User> login(String email, String password) async {
//     final response = await client.post(
//       Uri.parse('https://eat-healthy-api.herokuapp.com/api/v1/auth/login'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         'email': email,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       return User.fromJson(json.decode(response.body));
//     } else {
//       throw ServerException();
//     }
//   }
// }