import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/news_controller.dart';
import 'package:news_app/infrastructure/app_const/app_color_const.dart';
import 'package:news_app/infrastructure/app_const/app_string_const.dart';
import 'package:news_app/widget/common_widget/news_tile.dart';
import 'package:news_app/widget/common_widget/show_snackbar.dart';
import 'package:news_app/widget/common_widget/swipe_background_widget.dart';
import 'package:news_app/presentation/details_screen/detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  final controller = Get.find<NewsController>();

  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.favoriteList.isEmpty
          ? Center(child: Text(AppStringConst.noFavNews))
          : ListView.builder(
              itemCount: controller.favoriteList.length,
              itemBuilder: (context, index) {
                final article = controller.favoriteList[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => DetailScreen(article: article));
                  },
                  child: Dismissible(
                    key: Key(article.title ?? ''),
                    direction: DismissDirection.endToStart,
                    confirmDismiss: (direction) async {
                      controller.removeFromFavorites(article);
                      showRawSnackBar(context: context, title: AppStringConst.removedFromFavScreen);
                      return false;
                    },
                    background: SwipeBackground(
                      text: AppStringConst.removeFromFavorite,
                      icon: Icons.delete,
                      color: AppColorConst.grey,
                    ),
                    child: NewsTile(article: article),
                  ),
                );
              },
            );
    });
  }
}
