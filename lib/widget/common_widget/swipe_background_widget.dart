import 'package:flutter/material.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';
import 'package:news_app/infrastructure/theme/extension_theme.dart';

class SwipeBackground extends StatelessWidget {
  const SwipeBackground({super.key, required this.text, required this.icon, this.color});

  final String text;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 16),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: AppColorConst.red, size: 30),
          SizedBox(height: 6),
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.regular.black,
          ),
        ],
      ),
    );
  }
}
