import 'package:flutter/cupertino.dart';
import 'package:fresh_news/models/news_article.dart';
import 'package:fresh_news/services/web_service.dart';
import 'package:fresh_news/viewmodels/article_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class ListArticleViewModel extends ChangeNotifier {
  var loadingStatus = LoadingStatus.searching;

  List<ArticleViewModel> articles = List<ArticleViewModel>();

  ListArticleViewModel() {
    populateTopHeadLines();
  }

  Future<void> searchKeyWord(String keyword) async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticle =
        await WebServices().fecthHeadLinesByKeyword(keyword);
    this.articles = newsArticle
        .map((article) => ArticleViewModel(newsArticle: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }

  Future<void> populateTopHeadLines() async {
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles = await WebServices().fecthTopHeadLines();
    this.articles = newsArticles
        .map((article) => ArticleViewModel(newsArticle: article))
        .toList();
    this.loadingStatus =
        this.articles.isEmpty ? LoadingStatus.empty : LoadingStatus.completed;
    notifyListeners();
  }
}
