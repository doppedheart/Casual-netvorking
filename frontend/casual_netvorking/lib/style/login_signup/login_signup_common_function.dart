import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class LoginSignUpCommonFunction{
 static InputDecoration inputFormDecoration({
    required IconData? icon,
    required String? labelText,
    required String? hintText,
    IconData? suffixIcon,
  }) {
    return InputDecoration(
        filled: true,
        fillColor: TColors.lightGrey,
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: TColors.borderPrimary)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: TColors.borderPrimary)),
        prefixIcon: Icon(icon),
        suffixIcon: Icon(suffixIcon),

        // focusColor: Colors.black,
        labelText: labelText,

        // hintText: hintText,
        labelStyle: const TextStyle(color: TColors.darkGrey),
        floatingLabelStyle: const TextStyle(color: TColors.darkGrey),
        hintStyle: const TextStyle(color: TColors.darkGrey),
        border: InputBorder.none);
  }
}