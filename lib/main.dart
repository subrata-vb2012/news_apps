import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/presentation/tabs/tab_screen.dart';
import 'controller/news_controller.dart';

void main() {
  runApp(const MyApp());
  Get.put(NewsController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: TabScreen(),
    );
  }
}
