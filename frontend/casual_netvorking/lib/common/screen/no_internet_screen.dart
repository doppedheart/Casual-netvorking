
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../states/user_state.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/network_manager.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  final networkkManeger = Get.find<NetworkManager>();
  final userState = Get.find<UserState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            size: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "No Internet Connection",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Please check your internet connection",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //retry button
          ElevatedButton(
              onPressed: () async {
                await networkkManeger.checkInternetConnection() == true
                    ? userState.authenticatedUser == null
                        ? Get.offAllNamed('/loginScreen')
                        : Get.offAllNamed('/navigationMenu')
                    : Get.snackbar(
                        'No Internet Connection',
                        'Please check your internet connection and try again',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: TColors.primaryBackground,
                        colorText: TColors.black,
                        duration: const Duration(seconds: 5),
                        margin: const EdgeInsets.all(TSizes.defaultSpace),
                        padding: const EdgeInsets.all(TSizes.defaultSpace),
                        borderRadius: 20,
                        isDismissible: true,
                        dismissDirection: DismissDirection.horizontal,
                        forwardAnimationCurve: Curves.easeIn,
                        reverseAnimationCurve: Curves.easeIn,
                        animationDuration: const Duration(milliseconds: 500),
                      );
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.refresh),
                  Text("Retry"),
                ],
              ))
        ],
      ),
    ));
  }
}
