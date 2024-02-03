import 'package:get/get.dart';

import '../../../navigation_menu.dart';

import '../../../states/user_state.dart';
// import '../../../utils/helpers/network_manager.dart';

import '../screens/on_boarding_screen/onboarding_screen.dart';


class WelcomeScreenController extends GetxController {
  // puting user state as permanent instance to mange user state for the whole app
  final userState = UserState.instance;

  // final networkManeger = Get.find<NetworkManager>();

  Future<void> navigateToLoginScreen() async {
    //fetch user from local storage and set it to user state

    //get user from user state
    final user = userState.authenticatedUser;
    // final accessToken = userState.accessToken;
    // final refreshToken = userState.refreshToken;

    Future.delayed(const Duration(seconds: 3)).then((value) async {
      // final isConnected = await networkManeger.isConnected();

      // if (isConnected) {
        if (user == null) {
          Get.off(() => const OnboardingScreen(),
              transition: Transition.rightToLeft);
        } else {
          // debugPrint('access token is $accessToken');
          // debugPrint('refresh token is $refreshToken');
          Get.offAll(() => TNavigationMenu(),
              transition: Transition.rightToLeftWithFade);
        }
      // } 
    });
  }
}
