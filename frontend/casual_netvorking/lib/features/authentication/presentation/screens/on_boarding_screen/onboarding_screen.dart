import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../utils/constants/colors.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../controller/onbording_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final obController = OnbordingController();
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: obController.pageController,
              itemCount: obController.pages.length,
              onPageChanged: (int index) {
                obController.currentPage.value = index;
              },
              itemBuilder: (context, index) {
                return obController.pages[index];
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: obController.pageController,
                  count: obController.pages.length,
                  effect: const WormEffect(
                    dotColor: TColors.grey,
                    activeDotColor: TColors.primaryColor,
                  ),
                ),
                TextButton(
                  onPressed: obController.skipPage,
                  child: Text(
                    "Let's go!",
                    style: Get.textTheme.bodyLarge
                        ?.copyWith(color: TColors.primaryColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
