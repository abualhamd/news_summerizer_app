class ArticleModel {
  final Uri articleUri;
  final String imageUrl;
  final String title;
  final String publishedAt;

  ArticleModel(
      {required this.articleUri,
      required this.title,
      required this.publishedAt,
      required this.imageUrl});

  factory ArticleModel.fromJson({required Map<String, dynamic> json}) {
    final Uri articleUri = Uri.parse(json['url']);
    return ArticleModel(
        articleUri: articleUri,
        title: json['title'],
        publishedAt: json['publishedAt'],
        imageUrl: json['urlToImage'] ?? '');
  }
}

class ArticleModelFromNewsData extends ArticleModel {
  final String content;
  ArticleModelFromNewsData({
    required super.articleUri,
    required super.title,
    required super.publishedAt,
    required super.imageUrl,
    required this.content,
  });

  factory ArticleModelFromNewsData.fromJson(
      {required Map<String, dynamic> article}) {
    final uri = Uri.parse(article['link']);
    return ArticleModelFromNewsData(
      articleUri: uri,
      title: article['title'],
      publishedAt: article['pubDate'],
      imageUrl: article['image_url'] ?? '',//todo remove the ??
      content: article['content'],
    );
  }
}
