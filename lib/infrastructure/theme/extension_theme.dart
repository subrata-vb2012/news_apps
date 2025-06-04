import 'package:flutter/material.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';

extension Style on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  TextStyle get grey => copyWith(color: AppColorConst.grey);

  TextStyle get shadow => copyWith(color: AppColorConst.shadow);

  TextStyle get black => copyWith(color: AppColorConst.black);
}
