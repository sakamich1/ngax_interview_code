import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'bindings.dart';
import '../module/home/home_screen.dart';

class AppRouter {
  AppRouter._();

  static const home = '/home';

  static final routes = [
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
 
  ];
}
