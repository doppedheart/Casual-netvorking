import 'package:casual_netvorking/features/authentication/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import 'Widget/login_footer_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const routeName = '/loginScreen';

  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: TColors.primaryColor,
        appBar: AppBar(
          backgroundColor: TColors.primaryColor,
          elevation: 0,
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(TSizes.defaultSpace),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(TImages.welcomeScreenImg,
                                      color: TColors.white,
                                      height: size.height * 0.28)
                                  .animate()
                                  .scaleXY(curve: Curves.easeIn),
                              const SizedBox(height: TSizes.defaultSpace),
                              Text(
                                'Casual Networking',
                                style: Get.textTheme.headlineMedium
                                    ?.copyWith(color: TColors.white),
                                textAlign: TextAlign.center,
                              ).animate().moveY(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.all(TSizes.defaultSpace),
                        child: LoginFooterWidget().animate().moveY()),
                  ],
                ),
        ),
      ),
    );
  }
}
