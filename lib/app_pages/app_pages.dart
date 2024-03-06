import 'package:get/get.dart';
import 'package:todolist_hive/app_routes/app_routes.dart';
import 'package:todolist_hive/home/home_controller.dart';
import 'package:todolist_hive/home/home_screen.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => const HomeScreen(),
      binding: HomeBinding()
       ),  ];
}
