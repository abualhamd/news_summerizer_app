import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import '../../shared/constants.dart';
import '../webview_screen.dart';

class NewsWidget extends StatelessWidget {
  final ArticleModel article;

  const NewsWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewScreen(
            uri: article.articleUri,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 10.0, horizontal: kHorizontalPaddingValue),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 120,
              width: 120,
              child: Image.network(
                article.imageUrl,
                errorBuilder: (context, error, stackTrace) =>
                    Image.asset('lib/assets/news-default-image@2x_0.png'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15.0),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        article.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      article.publishedAt,
                      style: const TextStyle(color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
