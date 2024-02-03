
import 'package:get/get.dart';



class TRoutes {
  final String splash = '/splash';
  final String home = '/home';
  final String login = '/login';
  final String signup = '/signup';

  final String profile = '/profile';
  final String settings = '/settings';
  final String editProfile = '/editProfile';
  final String changePassword = '/changePassword';
  final String changeEmail = '/changeEmail';
  final String changePhoneNumber = '/changePhoneNumber';
  final String changeSubscription = '/changeSubscription';
  final String changeDp = '/changeDp';

  final String forgotPassword = '/forgotPassword';
  final String resetPassword = '/resetPassword';

  //list of GetPages for GetMaterialApp
  final List<GetPage> getPages = [
    // GetPage(name: '/splash', page: () => WelcomeScreen()),
    // GetPage(name: '/home', page: () => const HomeScreen()),
    // GetPage(name: '/login', page: () => const LoginScreen()),
    // GetPage(name: '/signup', page: () => SignUpScreen()),
  ];
}
