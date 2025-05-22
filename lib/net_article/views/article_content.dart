import 'package:flutter/material.dart';
import 'package:wangdemo/net_article/model/article.dart';

class ArticleContent extends StatefulWidget {
  const ArticleContent({Key? key}) : super(key: key);

  @override
  State<ArticleContent> createState() => _ArticleContentState();
}

class _ArticleContentState extends State<ArticleContent> {
  List<Article> _articles = [];

  Widget _buildItemByIndex(BuildContext context, int index) {
    return ArticleItem(article:_articles[index],onTap:_jumpToPage);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: _buildItemByIndex,itemCount: _articles.length,itemExtent: 80,);
  }
}
