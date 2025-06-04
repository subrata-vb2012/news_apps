import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/infrastructure/theme/app_themes.dart';
import 'package:news_app/presentation/home/home_screen.dart';
import 'controller/news_controller.dart';

void main() {
  runApp(const MyApp());
  Get.lazyPut(() => NewsController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme:AppTheme.lightTheme(),
      home: HomeScreen(),
    );
  }
}
