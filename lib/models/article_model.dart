class ArticleModel {
  final Uri articleUri;
  final String imageUrl;
  final String title;
  final String publishedAt;

  ArticleModel(
      {required this. articleUri,
      required this. title,
      required this. publishedAt,
      required this. imageUrl});

  factory ArticleModel.fromJson({required Map<String, dynamic> json}) {
    final Uri articleUri = Uri.parse(json['url']);
    return ArticleModel(
        articleUri: articleUri,
        title: json['title'],
        publishedAt: json['publishedAt'],
        imageUrl: json['urlToImage'] ?? '');
  }

  // Uri get articleUri => _articleUri;
  // String get articleTitle => _title;
  // String get imageUrl => _imageUrl;
  // String get publishedAt => _publishedAt;
}
