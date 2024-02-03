import 'package:causual_networking/feature/authentication/presentation/screens/on_boarding_screen/onboarding_screen.dart';
import 'package:get/get.dart';

import '../../../../common/screen/no_internet_screen.dart';
import '../../../../navigation_menu.dart';
import '../../../../states/user_state.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../application/service/authentication_service_impl.dart';


class WelcomeScreenController extends GetxController {
  // puting user state as permanent instance to mange user state for the whole app
  final userState = UserState.instance;
  final authServiceController = AuthenticationServiceimpl.instance;
  final networkManeger = Get.find<NetworkManager>();

  Future<void> navigateToLoginScreen() async {
    //fetch user from local storage and set it to user state
    await authServiceController.init();

    //get user from user state
    final user = userState.authenticatedUser;
    // final accessToken = userState.accessToken;
    // final refreshToken = userState.refreshToken;

    Future.delayed(const Duration(seconds: 3)).then((value) async {
      final isConnected = await networkManeger.isConnected();

      if (isConnected) {
        if (user == null) {
          Get.off(() => const OnboardingScreen(),
              transition: Transition.rightToLeft);
        } else {
          // debugPrint('access token is $accessToken');
          // debugPrint('refresh token is $refreshToken');
          Get.offAll(() => TNavigationMenu(),
              transition: Transition.rightToLeftWithFade);
        }
      } else {
        Get.to(() => const NoInternetScreen());
      }
    });
  }
}
