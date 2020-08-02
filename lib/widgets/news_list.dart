import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/article_view_model.dart';

class NewsList extends StatelessWidget {
  final List<ArticleViewModel> articles;
  final Function(ArticleViewModel article) onSelected;

  NewsList({this.articles, this.onSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          onTap: () {
            this.onSelected(article);
          },
          leading: Container(
            width: 100,
            height: 100,
            child: (article.imageUrl != null)
                ? Image.network(article.imageUrl)
                : Image.network(
                    "https://fotos.jornaldocarro.estadao.com.br/uploads/2019/"
                    "04/03164428/P90333946_highRes_bmw-f-850-gs-adventu.jpg"),
          ),
          title: Text(articles[index].title),
        );
      },
    );
  }
}
