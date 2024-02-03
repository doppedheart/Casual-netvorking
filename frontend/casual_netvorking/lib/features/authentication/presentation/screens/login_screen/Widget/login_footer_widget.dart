import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/image_strings.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../user_details/add_user_deatails_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //linkdein and github login
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: size.width * 0.4,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    TImages.lindeinImg,
                    height: TSizes.iconMd,
                  ),
                  style: OutlinedButton.styleFrom(
                      foregroundColor: TColors.textPrimary,
                      side: const BorderSide(color: TColors.white)),
                  label: Text('SignIin WIth LinkedIn'.toUpperCase(),
                      style:
                          Get.textTheme.bodyLarge?.apply(color: TColors.white)),
                ),
              ),
              SizedBox(
                width: size.width * 0.4,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    TImages.githubImag,
                    height: TSizes.iconMd,
                  ),
                  style: OutlinedButton.styleFrom(
                      foregroundColor: TColors.textPrimary,
                      side: const BorderSide(color: TColors.white)),
                  label: Text('SignIin WIth Github'.toUpperCase(),
                      style:
                          Get.textTheme.bodyLarge?.apply(color: TColors.white)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 1,
                  color: TColors.white.withOpacity(0.3),
                ),
              ),
              Text(
                "OR",
                style: Get.theme.textTheme.bodyMedium?.copyWith(
                    color: TColors.white.withOpacity(0.3),
                    fontWeight: FontWeight.w400),
              ),
              Expanded(
                child: Container(
                  height: 1,
                  color: TColors.white.withOpacity(0.4),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {
                Get.to(() => const AddUserDetailScreen());
              },
              icon: Image.asset(
                TImages.googleImg,
                height: TSizes.iconMd,
              ),
              style: OutlinedButton.styleFrom(
                  foregroundColor: TColors.textPrimary,
                  backgroundColor: TColors.white,
                  side: const BorderSide(color: TColors.textPrimary)),
              label: Text('SignIin WIth Google'.toUpperCase(),
                  style: Get.textTheme.bodyLarge
                      ?.apply(color: TColors.textPrimary)),
            ),
          ),
        ]);
  }
}
