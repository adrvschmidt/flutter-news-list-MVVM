import 'package:flutter/material.dart';
import 'package:fresh_news/pages/news_list_page.dart';
import 'package:fresh_news/viewmodels/list_articles_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fresh News",
      home: ChangeNotifierProvider(
        builder: (context) => ListArticleViewModel(),
        child: NewsListPage(),
      ),
    );
  }
}
