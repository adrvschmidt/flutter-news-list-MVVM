import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/article_view_model.dart';
import 'package:fresh_news/viewmodels/list_articles_view_model.dart';
import 'package:fresh_news/widgets/news_list.dart';
import 'package:provider/provider.dart';

import 'news_article_details_page.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    Provider.of<ListArticleViewModel>(context, listen: false)
        .populateTopHeadLines();
  }

  void _showNewsArticleDetails(BuildContext context, ArticleViewModel article) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewsArticleDetailsPage(article: article),
      ),
    );
  }

  Widget _buildList(BuildContext context, ListArticleViewModel vm) {
    switch (vm.loadingStatus) {
      case LoadingStatus.searching:
        return Align(
          child: CircularProgressIndicator(),
        );
      case LoadingStatus.empty:
        return Align(
          child: Text("No results found"),
        );
      case LoadingStatus.completed:
        return Expanded(
          child: NewsList(
            articles: vm.articles,
            onSelected: (article) {
              _showNewsArticleDetails(
                context,
                article,
              );
            },
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ListArticleViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Fresh News"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (value) {
              //Fetch all news with keyword
              if (value.isNotEmpty) {
                vm.searchKeyWord(value);
              }
            },
            decoration: InputDecoration(
              labelText: "Entre com sua busca",
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                },
              ),
            ),
          ),
          _buildList(context, vm),
        ],
      ),
    );
  }
}
