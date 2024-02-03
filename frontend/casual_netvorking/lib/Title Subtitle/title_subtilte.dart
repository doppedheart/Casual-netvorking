import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TitleSubtitle extends StatelessWidget {
  const TitleSubtitle({
    super.key,
    required this.txtTheme,
    required this.title,
    required this.subTitle,
    this.titleColor, this.subtitleColor,
  });

  final TextTheme txtTheme;
  final String title;
  final String subTitle;
  final Color? titleColor;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        width: size.width * 0.18,
        child: Column(
          children: [
            Text(
              title,
              style: txtTheme.titleSmall?.apply(
                  fontSizeDelta: -8,
                  color: titleColor ?? Colors.amber,
                  fontWeightDelta: 1),
            ),
            Text(
              subTitle,
              style: GoogleFonts.poppins(
                  color:subtitleColor?? Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
