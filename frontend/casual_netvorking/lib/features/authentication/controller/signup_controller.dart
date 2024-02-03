import 'package:casual_netvorking/features/authentication/screens/user_details/add_user_deatails_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../navigation_menu.dart';
import '../../../utils/exceptions/dio_exception.dart';
import '../../../utils/exceptions/internet_exception.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../data/repository/authentication_repository_impl.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find<SignupController>();

  final repository = AuthenticationRepositoryImpl.instance;

  final isLoading = false.obs;

  Future<void> signupLoginWithGoogle() async {
    isLoading.value = true;
    try {
      final response = await repository.signUpWithGoogle();

      if (response != null) {
        if (response["success"]) {
          debugPrint('user signed in with google: ${response['data']['name']}');
          //show snack bar
          THelperFunctions.showSuccessSnackBar('Signed in successfully');
          //half a second delay
          await Future.delayed(const Duration(milliseconds: 1500));
          //navigate to home screen
          Get.offAll(() => const AddUserDetailScreen(),
              transition: Transition.rightToLeftWithFade);
        } else {
          //show snack bar
          THelperFunctions.showErrorSnackBar(response['message']);
        }
      }

      isLoading.value = false;
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

  void signupLoginWithGitHub() async {
    isLoading.value = true;
    try {
      final user = await repository.signUpWithGitHub();
      isLoading.value = false;
      if (user != null) {
        debugPrint('user signed in with github: ${user.displayName}');
        //show snack bar
        THelperFunctions.showSuccessSnackBar('Signed in successfully');
        //half a second delay
        await Future.delayed(const Duration(milliseconds: 1500));
        //navigate to home screen
        Get.offAll(() => TNavigationMenu(),
            transition: Transition.rightToLeftWithFade);
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
