import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:piggy/src/constants/endpoint.dart';

class NewsApiClient {
  NewsApiClient({required String apiKey}) : _apiKey = apiKey;

  final String _apiKey;

  Future<Response> fetch(String url) async {
    return await get(Uri.parse(url + _apiKey));
  }

  Future<Response> fetchTopNews(String url) async {
    return await get(Uri.parse(url + _apiKey));
  }

}
