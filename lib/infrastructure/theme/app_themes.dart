import 'package:flutter/material.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      textTheme: DefaultTextTheme.textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorConst.white,
        shadowColor: AppColorConst.transparent,
        elevation: 0,
      ),
      tabBarTheme: TabBarThemeData(
        dividerColor: Colors.transparent,
        indicatorAnimation: TabIndicatorAnimation.linear,
        indicator: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColorConst.lavender),
        labelColor: AppColorConst.black,
        unselectedLabelColor: AppColorConst.black,
      ),
    );
  }
}

class DefaultTextTheme {
  static const textTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 57.0, fontWeight: FontWeight.normal, letterSpacing: -0.25),
    displayMedium: TextStyle(fontSize: 45.0, fontWeight: FontWeight.normal),
    displaySmall: TextStyle(fontSize: 36.0, fontWeight: FontWeight.normal),
    headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.normal),
    headlineMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.normal),
    headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.normal),
    titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.15),
    titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, letterSpacing: 0.5),
    bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, letterSpacing: 0.25),
    bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal, letterSpacing: 0.4),
    labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1),
    labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
    labelSmall: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500, letterSpacing: 0.5),
  );
}
