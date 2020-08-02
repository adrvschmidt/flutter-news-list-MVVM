import 'dart:convert';

import 'package:fresh_news/models/news_article.dart';
import 'package:fresh_news/utils/constants.dart';
import 'package:http/http.dart' as http;

class WebServices {
  Future<List<NewsArticle>> fecthHeadLinesByKeyword(String keyword) async {
    final response = await http.get(Constants.headLinesFor(keyword));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((json) => NewsArticle.fromJson(json)).toList();
    } else {
      throw Exception("Failed to connect");
    }
  }

  Future<List<NewsArticle>> fecthTopHeadLines() async {
    final response = await http.get(Constants.TOP_HEADLINES_URL);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to connect");
    }
  }
}
