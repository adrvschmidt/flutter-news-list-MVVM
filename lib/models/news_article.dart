class NewsArticle {
  final String title;
  final String description;
  final String urlImage;
  final String url;

  NewsArticle({this.title, this.description, this.urlImage, this.url});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
        title: json["title"],
        description: json["description"],
        urlImage: json["urlToImage"],
        url: json["url"]);
  }
}
