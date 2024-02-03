import 'package:get/get.dart';


import '../features/authentication/data/repository/authentication_repository_impl.dart';
import '../features/authentication/domain/entities/user.dart';




class UserState extends GetxController {
  final Rx<User?> _authenticatedUser = Rx<User?>(null);
  final Rx<String?> _accessToken = Rx<String?>(null);
  final Rx<String?> _refreshToken = Rx<String?>(null);

  User? get authenticatedUser => _authenticatedUser.value;
  bool get isUserLoggedIn => _authenticatedUser.value != null;
  String? get accessToken => _accessToken.value;
  String? get refreshToken => _refreshToken.value;

  static UserState get instance {
    if (Get.isRegistered<UserState>()) {
      return Get.find<UserState>();
    } else {
      return Get.put(UserState(), permanent: true);
    }
  }

  void setUser(User user,String accessToken,String refreshToken) {
    _authenticatedUser.value = user;
    _accessToken.value = accessToken;
    _refreshToken.value = refreshToken;
  }

  void removeUser()  {
      _authenticatedUser.value = null;
      _accessToken.value = null;
      _refreshToken.value = null;
  }

  void updateAccessToken(String accessToken) {

    final AuthenticationRepositoryImpl authenticationRepository = AuthenticationRepositoryImpl.instance;

    authenticationRepository.updateAccessToken(accessToken);
    _accessToken.value = accessToken;

  }

}
