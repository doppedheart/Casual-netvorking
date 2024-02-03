import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../config/text_strings.dart';



class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.size,
    required this.txtTheme,
  });

  final Size size;
  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.015,
          horizontal: size.height * 0.015),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(width: 4, color: tSecondaryColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tSearch,
              style: txtTheme.headlineSmall
                  ?.apply(color: tPrimaryColor.withOpacity(0.6))),
          Icon(
            Icons.search_outlined,
            size: size.height * 0.035,
            color: tSecondaryColor.withOpacity(0.8),
          )
        ],
      ),
    );
  }
}
