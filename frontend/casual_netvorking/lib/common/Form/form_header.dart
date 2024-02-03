import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  final String title;

  final String subTitle;
  final String hdrImg;

  const FormHeaderWidget(
      {super.key,
      required this.size,
      required this.hdrImg,
      required this.title,
      required this.subTitle,
      this.tCrossAxissAligment,
      this.tMainAxisAlignment,
      this.imgHeightFraction});

  final Size size;
  final CrossAxisAlignment? tCrossAxissAligment;
  final MainAxisAlignment? tMainAxisAlignment;
  final double? imgHeightFraction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: tCrossAxissAligment??CrossAxisAlignment.start,
      mainAxisAlignment: tMainAxisAlignment ??
           MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(hdrImg),
          height: imgHeightFraction == null
              ? size.height * 0.2
              : size.height * imgHeightFraction!,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
