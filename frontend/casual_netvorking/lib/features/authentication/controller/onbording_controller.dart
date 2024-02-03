import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/text_strings.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../screens/login_screen/login_screen.dart';

class OnbordingController extends GetxController {
  RxInt currentPage = 0.obs;

  final pageController = PageController();
  final pages = const [
    OnBoardingWidget(
        pageColor: TColors.primaryColor,
        img: TImages.onboardingImg1,
        title: onBoardingTitle1,
        subtitle: onBoardingSubtitle1,
        counter: onBoardingCounter1),
    OnBoardingWidget(
        pageColor: TColors.accentColor,
        img: TImages.onboardingImg2,
        title: onBoardingTitle2,
        subtitle: onBoardingSubtitle2,
        counter: onBoardingCounter2),
    OnBoardingWidget(
        pageColor: TColors.green,
        img: TImages.onboardingImg3,
        title: onBoardingTitle3,
        subtitle: onBoardingSubtitle3,
        counter: onBoardingCounter3),
  ];

  void skipPage() {
    Get.off(() =>  LoginScreen());
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.pageColor,
    required this.img,
    required this.title,
    required this.subtitle,
    required this.counter,
    this.subtitleColor = Colors.white,
    this.titleColor = Colors.black87,
  });

  final Color pageColor;
  final String img;
  final String title;
  final String subtitle;
  final String counter;
  final Color titleColor;
  final Color subtitleColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: pageColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(img, height: size.height * 0.4),
          SvgPicture.asset(
            img,
            height: size.height * 0.4,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Get.textTheme.headlineMedium?.copyWith(color: titleColor),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Get.textTheme.bodyMedium?.copyWith(color: subtitleColor),
          ),
        ],
      ),
    );
  }
}
