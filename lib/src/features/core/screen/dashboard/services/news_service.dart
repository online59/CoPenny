import 'package:piggy/src/features/core/screen/dashboard/api/news_api_client.dart';
import 'package:piggy/src/features/core/screen/dashboard/model/news.dart';

import 'package:http/http.dart';
import 'dart:convert' as convert;

class NewsService {

  static Future<List<News>> fetchTopNews() async {
    final response = await NewsApiClient().fetch();
    return _parseNews(response);
  }

  static Future<List<News>> fetchNews() async {
    final response = await NewsApiClient().fetch();
    return _parseNews(response);
  }

  static List<News> _parseNews(Response response) {
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      var jsonArticles = jsonResponse['articles'] as List;
      return jsonArticles.map((e) => News.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
