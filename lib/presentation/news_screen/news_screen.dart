import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';
import 'package:news_app/infrastructure/app_const/app_string_const.dart';
import 'package:news_app/presentation/common_widget/news_tile.dart';
import 'package:news_app/presentation/common_widget/swipe_background_widget.dart';
import 'package:news_app/presentation/details_screen/detail_screen.dart';

class NewsScreen extends StatelessWidget {
  final controller = Get.find<NewsController>();

  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.articlesList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                controller.fetchNews();
              },
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 24),
                itemCount: controller.articlesList.length,
                itemBuilder: (context, index) {
                  final article = controller.articlesList[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => DetailScreen(article: article));
                    },
                    child: Dismissible(
                      key: Key(article.title ?? ''),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) async {
                        controller.addToFavorites(article);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(AppStringConst.addedToFavScreen),
                          ),
                        );
                        return false;
                      },
                      background: SwipeBackground(
                        text: AppStringConst.addedToFavorite,
                        icon: Icons.favorite,
                        color: AppColorConst.pink,
                      ),
                      child: NewsTile(article: article),
                    ),
                  );
                },
              ),
            );
    });
  }
}
