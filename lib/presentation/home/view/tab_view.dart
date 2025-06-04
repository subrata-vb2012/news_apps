import 'package:flutter/material.dart';
import 'package:news_app/infrastructure/theme/extension_theme.dart';

class TabView extends StatelessWidget {
  const TabView({super.key, required this.icon, required this.tabText, this.iconColor});

  final IconData icon;
  final String tabText;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Icon(icon, size: 33, color: iconColor),
          ),
          SizedBox(width: 19),
          Text(tabText, style: Theme.of(context).textTheme.headlineMedium?.bold.shadow),
        ],
      ),
    );
  }
}
