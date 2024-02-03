import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';


import 'features/authentication/presentation/screens/login_screen/login_screen.dart';
import 'features/authentication/presentation/screens/welcome/welcome_screen.dart';
import 'navigation_menu.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return GetMaterialApp(
      title: 'Causal Networking',
      theme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      darkTheme: TAppTheme.darkTheme,
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        TNavigationMenu.routeName: (context) => TNavigationMenu(),
      },
      // home: GetBuilder<AuthenticationServiceimpl>(
      //   init: AuthenticationServiceimpl(),
      //   builder: (controller) => WelcomeScreen(),
      // ),
      home: WelcomeScreen(),
      // home: TNavigationMenu(),
    );
  }
}
