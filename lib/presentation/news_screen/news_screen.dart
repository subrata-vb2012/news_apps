import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';
import 'package:news_app/infrastructure/app_const/app_string_const.dart';
import 'package:news_app/presentation/details_screen/detail_screen.dart';
import 'package:news_app/services/model/news_model.dart';
import 'package:news_app/widget/common_widget/news_tile.dart';
import 'package:news_app/widget/common_widget/show_snackbar.dart';
import 'package:news_app/widget/common_widget/swipe_background_widget.dart';

class NewsScreen extends StatelessWidget {
  final controller = Get.find<NewsController>();

  NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.fetchNews();
      },
      color: AppColorConst.green,
      child: FutureBuilder(
        future: controller.fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(AppStringConst.somethingWentWrong, style: const TextStyle(color: Colors.red)),
            );
          } else if (!snapshot.hasData || (snapshot.data!.articles ?? []).isEmpty) {
            return Center(child: Text(AppStringConst.noNewsFound));
          } else {
            controller.articlesList.value = snapshot.data?.articles ?? <ArticleData>[];
            return ListView.builder(
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
                      showRawSnackBar(context: context, title: AppStringConst.addedToFavScreen);
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
              itemCount: controller.articlesList.length,
            );
          }
        },
      ),
    );
  }
}
