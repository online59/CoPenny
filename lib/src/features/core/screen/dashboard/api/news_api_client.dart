import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:piggy/src/constants/api.dart';

class NewsApiClient {

  Future<Response> fetch() async {
    return await get(Uri.parse(mEveryNewsApiUrl));
  }

  Future<Response> fetchTopNews() async {
    return await get(Uri.parse(mTopNewsApiUrl));
  }
}
