import 'package:flutter/material.dart';

import '../../../../../../common/style/login_signup/login_signup_common_function.dart';
import '../../../../../../utils/constants/colors.dart';
import '../../../../../../utils/constants/sizes.dart';
import '../../../../../../utils/constants/text_strings.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final modelSize = MediaQuery.of(context).size;
    final size = MediaQuery.of(context).size;
    return Form(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            style: const TextStyle(color: Colors.black),
            decoration: LoginSignUpCommonFunction.inputFormDecoration(
                icon: Icons.email,
                labelText: TTexts.email,
                hintText: TTexts.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          TextFormField(
            decoration: LoginSignUpCommonFunction.inputFormDecoration(
                icon: Icons.lock,
                labelText: TTexts.password,
                hintText: TTexts.password,
                suffixIcon: Icons.visibility_off_outlined),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                TTexts.forgetPassword,
                style: TextStyle(color: TColors.green),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Login'.toUpperCase(),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
