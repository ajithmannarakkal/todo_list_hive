import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_hive/app_routes/app_routes.dart';

import 'app_pages/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      getPages: AppPages.pages,
    );
  }
}


