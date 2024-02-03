import 'package:casual_netvorking/features/authentication/presentation/screens/welcome/welcome_screen.dart';
import 'package:casual_netvorking/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Casual Networking',
      theme: TAppTheme.darkTheme,
      home: WelcomeScreen(),
    );
  }
}
