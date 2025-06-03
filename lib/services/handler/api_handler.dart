import 'package:news_app/services/model/news_model.dart';
import 'package:news_app/services/repository/news_repository.dart';

class ApiHandler {
  final NewsRepository repo = NewsRepository();

  Future<List<Articles>> fetchNewsArticles() async {
    final response = await repo.getNews();
    final newsModel = NewsModel.fromJson(response);
    return newsModel.articles ?? [];
  }
}
