
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/constants/colors.dart';

class FormHeaderText extends StatelessWidget {
  const FormHeaderText({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
  });

  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        RichText(
          softWrap: true,
          text: TextSpan(
            text: text1,
            style: Get.textTheme.displaySmall
                ?.apply(color: TColors.textPrimary, fontWeightDelta: 2),
            children: [
              TextSpan(
                text: text2,
                style: Get.textTheme.displayMedium
                    ?.apply(color: TColors.green, fontWeightDelta: 2),
              ),
              TextSpan(
                text: text3,
                style: Get.textTheme.displaySmall
                    ?.apply(color: TColors.textPrimary, fontWeightDelta: 2),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
