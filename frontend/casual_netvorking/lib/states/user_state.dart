import 'package:get/get.dart';

import '../features/authentication/modal/user.dart';

class UserState extends GetxController {
  final Rx<UserModal?> _authenticatedUser = Rx<UserModal?>(null);
  final RxBool _isUserLoggedIn = false.obs;
  final RxBool _isUserProfileComplete=false.obs;

  UserModal? get authenticatedUser => _authenticatedUser.value;
  bool get isUserLoggedIn => _isUserLoggedIn.value;
  bool get isUserProfileComplete => _isUserProfileComplete.value;


  static UserState get instance {
    if (Get.isRegistered<UserState>()) {
      return Get.find<UserState>();
    } else {
      return Get.put(UserState(), permanent: true);
    }
  }

  void setUser(UserModal user, ) {
    _authenticatedUser.value = user;
  }

  void setLogin(bool isLogin) {
    _isUserLoggedIn.value = isLogin;
  }

  void setProfileComplete(bool isProfileComplete) {
    _isUserProfileComplete.value = isProfileComplete;
  }
  

  void removeUser() {
    _authenticatedUser.value = null;

  }
}
