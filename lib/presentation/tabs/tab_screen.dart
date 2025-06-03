import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';
import 'package:news_app/infrastructure/app_const/app_string_const.dart';
import 'package:news_app/presentation/favorite_screen/favorite_screen.dart';
import 'package:news_app/presentation/news_screen/news_screen.dart';
import 'package:news_app/presentation/tabs/view/tab_view.dart';
import 'package:news_app/services/handler/api_handler.dart';
import 'package:news_app/services/repository/news_repository.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ApiHandler());
    Get.put(NewsRepository());
    Get.put(NewsController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: AppColorConst.transparent,
          elevation: 0,

          backgroundColor: AppColorConst.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  dividerColor: Colors.transparent,
                  indicatorAnimation: TabIndicatorAnimation.linear,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColorConst.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColorConst.shadow,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    TabView(
                      icon: LucideIcons.list,
                      tabText: AppStringConst.tab1,
                    ),
                    TabView(
                      icon: Icons.favorite,
                      iconColor: AppColorConst.red,
                      tabText: AppStringConst.tab2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: TabBarView(children: [NewsScreen(), FavoriteScreen()]),
      ),
    );
  }
}
