import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';
import 'package:news_app/infrastructure/app_const/app_string_const.dart';
import 'package:news_app/presentation/favorite_screen/favorite_screen.dart';
import 'package:news_app/presentation/home/view/tab_view.dart';
import 'package:news_app/presentation/news_screen/news_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: TabBar(
                tabs: [
                  TabView(icon: LucideIcons.list, tabText: AppStringConst.tab1),
                  TabView(icon: Icons.favorite, iconColor: AppColorConst.red, tabText: AppStringConst.tab2),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(children: [NewsScreen(), FavoriteScreen()]),
      ),
    );
  }
}
