import 'package:flutter/widgets.dart';

class Article {
  final String title;
  final String url;
  final String time;

  const Article({required this.title, required this.url, required this.time});

  factory Article.fromMap(dynamic map){
    return Article(
      title: map['title'] ?? '未知',
      url: map['link'] ?? '',
      time: map['niceDate'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Article{title: $title, url: $url, time: $time}';
  }
}

class ArticleItem{
  final Article article;
  final VoidCallbackAction? onTap;

  const ArticleItem({required this.article, this.onTap});
}