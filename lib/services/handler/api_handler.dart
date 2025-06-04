import 'package:news_app/services/model/news_model.dart';
import 'package:news_app/services/repository/news_repository.dart';

class ApiHandler {
  final NewsRepository repo = NewsRepository();

  Future<NewsResponse> fetchNewsArticles() async {
    final response = await repo.getNews();
    final newsModel = NewsResponse.fromJson(response);
    return newsModel;
  }
}
