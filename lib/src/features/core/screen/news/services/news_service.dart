import 'package:piggy/src/constants/endpoint.dart';
import 'package:piggy/src/features/core/screen/news/api/news_api_client.dart';
import 'package:piggy/src/features/core/screen/news/model/news.dart';

import 'package:http/http.dart';
import 'dart:convert' as convert;

import 'package:piggy/src/features/core/screen/news/services/read_text_file_service.dart';

class NewsService {

  static Future<List<News>> fetchTopNews() async {
    final response = await NewsApiClient(apiKey: await _getApi()).fetch(mTopNewsEndpoint);
    return _parseNews(response);
  }

  static Future<List<News>> fetchHotNews() async {
    final response = await NewsApiClient(apiKey: await _getApi()).fetch(mHotNewsEndpoint);
    return _parseNews(response);
  }

  static Future<List<News>> fetchLatestNews() async {
    final response = await NewsApiClient(apiKey: await _getApi()).fetch(mLatestNewsEndpoint);
    return _parseNews(response);
  }

  static Future<String> _getApi() async {
    return await ReadTextFileService.readApiKey();
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
