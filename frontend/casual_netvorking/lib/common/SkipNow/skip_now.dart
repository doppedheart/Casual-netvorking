import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/colors.dart';
import '../../config/text_strings.dart';





class SkipNowWidget extends StatelessWidget {
  const SkipNowWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => Get.offAll(() => const Placeholder()),
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Row(
          children: [
            Text(
              tSkipNow,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: tSecondaryColor,
                  ),
            ),
            Icon(
              Icons.skip_next_outlined,
              color: tSecondaryColor,
              size: size.height * 0.035,
            )
          ],
        ),
      ),
    );
  }
}
