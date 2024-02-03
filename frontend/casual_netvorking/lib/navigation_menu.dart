import 'package:casual_netvorking/utils/constants/colors.dart';
import 'package:casual_netvorking/utils/helpers/network_manager.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'features/connect/presentation/account_screen.dart';
import 'features/connect/presentation/chat_screen.dart';
import 'features/connect/presentation/explore_screen.dart';
import 'features/connect/presentation/like_screen.dart';

class TNavigationMenu extends StatelessWidget {
  TNavigationMenu({super.key});

  static const routeName = '/navigationMenu';

  final controller = Get.put(NavigationController());

  final NetworkManager networkManager = Get.find<NetworkManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => CurvedNavigationBar(
            height: 60,
            backgroundColor: TColors.primaryBackground,
            animationDuration: const Duration(milliseconds: 100),
            animationCurve: Curves.easeOut,
            index: controller.selectedIndex,
            onTap: controller.onDestinationSelected,
            color: TColors.primary,
            buttonBackgroundColor: TColors.accent,
            items: const [
              Icon(
                Iconsax.home,
              ),
              Icon(
                Iconsax.search_favorite,
              ),
              Icon(
                Iconsax.message,
              ),
            ],
          )),
      body: Obx(() => controller.screen[controller.selectedIndex]),
    );
  }
}

class NavigationController extends GetxController {
  final _selectedIndex = 1.obs;

  int get selectedIndex => _selectedIndex.value;

  final screen = [
    ExploreScreen(),
    const LikesScreen(),
    ChatScreen(),
    AccountScreen(),
  ];

  void onDestinationSelected(int index) {
    _selectedIndex.value = index;
  }
}
