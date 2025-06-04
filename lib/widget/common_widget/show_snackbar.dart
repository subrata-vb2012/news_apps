import 'package:flutter/material.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';

void showRawSnackBar({
  required BuildContext context,
  required String title,
  bool? isError,
  Color? color,
  int milliseconds = 1800,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(milliseconds: milliseconds),
      padding: const EdgeInsets.all(16),
      backgroundColor:
          color ??
          (isError == null
              ? AppColorConst.black
              : isError == true
              ? AppColorConst.red
              : AppColorConst.green),
      content: Text(title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge),
    ),
  );
}
