import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class Ellipse extends StatelessWidget {
  const Ellipse({
    super.key,
    required this.size,
  });

  final double size;
  final width = 70;
  final height = 89;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * size,
        height: height * size,
        decoration: BoxDecoration(
            color: TColors.primary,
            borderRadius: BorderRadius.all(
                Radius.elliptical(width * size, height * size))));
  }
}
