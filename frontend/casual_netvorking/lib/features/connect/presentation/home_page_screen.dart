
import 'package:casual_netvorking/features/connect/presentation/account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'chat_screen.dart';
import 'explore_screen.dart';
import 'like_screen.dart';

/*
Title:HomePageScreen
Purpose:HomePageScreen
Created By:Kalpesh Khandla
*/

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  HomePageScreenState createState() => HomePageScreenState();
}

class HomePageScreenState extends State<HomePageScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ExploreScreen(),
        const LikesScreen(),
        ChatScreen(),
        AccountScreen(),
      ],
    );
  }

  AppBar appBarWidget() {
    List bottomItems = [
      pageIndex == 0
          ? "assets/img/explore_active_icon.svg"
          : "assets/img/explore_icon.svg",
      pageIndex == 1
          ? "assets/img/likes_active_icon.svg"
          : "assets/img/likes_icon.svg",
      pageIndex == 2
          ? "assets/img/chat_active_icon.svg"
          : "assets/img/chat_icon.svg",
      pageIndex == 3
          ? "assets/img/account_active_icon.svg"
          : "assets/img/account_icon.svg",
    ];
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  pageIndex = index;
                });
              },
              icon: SvgPicture.asset(
                bottomItems[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
