import 'package:dio/dio.dart';

class NewsRepository {
  String api =
      'https://newsapi.org/v2/everything?q=apple&from=2025-05-26&to=2025-05-26&sortBy=popularity&apiKey=8ae7a7c7092a4c5ebbe6841cc301df0a';
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getNews() async {
    final response = await _dio.get(api);
    return response.data;
  }
}
