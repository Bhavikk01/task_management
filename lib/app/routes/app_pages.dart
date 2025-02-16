import 'package:get/get.dart';
import 'package:task_management/app/screens/auth_screens/login/binding/login_binding.dart';
import 'package:task_management/app/screens/auth_screens/sign_up/binding/sign_up_binding.dart';
import 'package:task_management/main.dart';

import '../screens/auth_screens/login/login_screen.dart';
import '../screens/auth_screens/sign_up/sign_up_screen.dart';
import '../screens/home_screen/controller/home_screen_binding.dart';
import '../screens/home_screen/home_screen.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [

    /// Home Page
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeScreenBinding(),
    ),

    /// Auth Pages
    GetPage(
      name: Routes.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashScreen(),
    ),

  ];
}
