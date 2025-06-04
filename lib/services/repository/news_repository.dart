import 'package:dio/dio.dart';

class NewsRepository {
  static String baseApi = 'https://newsapi.org/v2/everything';
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> getNews({
    String sortBy = 'popularity',
    String apiKey = '8ae7a7c7092a4c5ebbe6841cc301df0a',
    String from = '2025-05-20',
    String to = '2025-05-26',
  }) async {
    try {
      final response = await _dio.get(
        baseApi,
        queryParameters: {'sortBy': sortBy, 'apikey': apiKey, 'q': 'apple', 'from': from, 'to': to},
      );

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load news. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('News fetch error');
    }
  }
}
