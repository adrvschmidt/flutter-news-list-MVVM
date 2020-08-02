import 'package:fresh_news/models/news_article.dart';

class ArticleViewModel {
  NewsArticle _newsArticle;

  ArticleViewModel({NewsArticle newsArticle}) : _newsArticle = newsArticle;

  String get title {
    return _newsArticle.title;
  }

  String get description {
    return _newsArticle.description;
  }

  String get imageUrl {
    return _newsArticle.urlImage;
  }

  String get url {
    return _newsArticle.url;
  }
}
