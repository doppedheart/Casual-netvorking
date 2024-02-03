import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controller/welcome_screen_controller.dart';

// import '../signUp/singup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  static const routeName = '/welcomeScreen';

  final controller = Get.put(WelcomeScreenController());

  @override
  Widget build(BuildContext context) {
    controller.navigateToLoginScreen();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: TColors.primaryColor,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(TImages.welcomeScreenImg,
                        color: TColors.white, height: size.height * 0.28)
                    .animate()
                    .scaleXY(
                        delay: const Duration(milliseconds: 1000),
                        curve: Curves.easeIn),
                _topDispalyTexts(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _topDispalyTexts() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          style: Get.textTheme.headlineMedium?.copyWith(color: TColors.white),
          'Casual Networking',
          textAlign: TextAlign.center,
        ).animate(delay: const Duration(milliseconds: 1000)).moveY(),
      ],
    );
  }
}
