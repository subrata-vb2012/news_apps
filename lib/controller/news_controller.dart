import 'package:get/get.dart';
import 'package:news_app/services/handler/api_handler.dart';
import 'package:news_app/services/model/news_model.dart';

class NewsController extends GetxController {
  ApiHandler handler = ApiHandler();
  RxList<ArticleData> articlesList = <ArticleData>[].obs;
  RxList<ArticleData> favoriteList = <ArticleData>[].obs;
  RxBool isFetchInProgress = false.obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<NewsResponse> fetchNews() async {
    try {
      final response = await handler.fetchNewsArticles();
      return response;
    } catch (e) {
      throw Exception("Failed to load news: $e");
    }
  }

  bool isFavorite(ArticleData article) => favoriteList.contains(article);

  void addToFavorites(ArticleData article) {
    if (!favoriteList.contains(article)) {
      favoriteList.add(article);
      update();
    }
  }

  void removeFromFavorites(ArticleData article) {
    favoriteList.removeWhere((a) => a.title == article.title);
    update();
  }
}
