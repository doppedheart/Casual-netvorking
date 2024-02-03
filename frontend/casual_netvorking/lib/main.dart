import 'package:casual_netvorking/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:casual_netvorking/firebase_options.dart';
import 'package:casual_netvorking/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Casual Networking',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.darkTheme,
      home: WelcomeScreen(),
    );
  }
}
