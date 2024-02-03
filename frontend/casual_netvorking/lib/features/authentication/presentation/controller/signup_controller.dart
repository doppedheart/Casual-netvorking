
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../navigation_menu.dart';
import '../../../../utils/exceptions/dio_exception.dart';
import '../../../../utils/exceptions/internet_exception.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../domain/usecases/authentication_usecase.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find<SignupController>();

  final AuthenticationUsecase _authenticationUsecase =
      Get.put(AuthenticationUsecase());

  final isLoading = false.obs;

  void signupLoginWithGoogle() async {
    isLoading.value = true;
    try {
      final user = await _authenticationUsecase.signUpWithGoogle();
      isLoading.value = false;
      if (user != null) {
        debugPrint('user signed in with google: ${user.name}');
        //show snack bar
        THelperFunctions.showSuccessSnackBar('Signed in successfully');
        //half a second delay
        await Future.delayed(const Duration(milliseconds: 1500));
        //navigate to home screen
        Get.offAll(() => TNavigationMenu(),
          transition: Transition.rightToLeftWithFade
        );
      }
    } on InternetException catch (e) {
      debugPrint(e.toString());
      //show snack bar
      THelperFunctions.showErrorSnackBar('No internet connection');
      isLoading.value = false;
    } on TDioExceptions catch (e) {
      debugPrint(e.toString());
      //show snack bar
      THelperFunctions.showErrorSnackBar(e.message);
      isLoading.value = false;
    } catch (e) {
      debugPrint(e.toString());
      //show snack bar
      THelperFunctions.showErrorSnackBar('Something went wrong');
      isLoading.value = false;
    }
  }
}
