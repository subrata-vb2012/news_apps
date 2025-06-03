import 'package:get/get.dart';
import 'package:news_app/services/handler/api_handler.dart';
import 'package:news_app/services/model/news_model.dart';

class NewsController extends GetxController {
  ApiHandler handler = ApiHandler();
  RxList<Articles> articlesList = <Articles>[].obs;
  RxList<Articles> favoriteList = <Articles>[].obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  void fetchNews() async {
    final result = await handler.fetchNewsArticles();
    articlesList.assignAll(result);
  }

  bool isFavorite(Articles article) => favoriteList.contains(article);

  void addToFavorites(Articles article) {
    if (!favoriteList.contains(article)) {
      favoriteList.add(article);
      update();
    }
  }

  void removeFromFavorites(Articles article) {
    favoriteList.removeWhere((a) => a.title == article.title);
    update();
  }
}
