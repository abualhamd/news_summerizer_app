import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/screens/webview_screen.dart';
import 'constants.dart';

class NewsWidget extends StatelessWidget {
  final Map<String, dynamic> article;

  const NewsWidget({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WebViewScreen(
            url: article['url'].toString(),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: kHorizontalPaddingValue),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(
                    //TODO add default image
                    article['urlToImage'].toString(),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              height: 120,
              width: 120,
              // child: ,
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
                        article['title'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      article['publishedAt'].toString(),
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

class NewsCategoryComponent extends StatelessWidget {
  final int categoryIndex;
  final bool fromSearchScreen;

  const NewsCategoryComponent(
      {required this.categoryIndex, this.fromSearchScreen = false});

  @override
  Widget build(BuildContext context) {
    List<dynamic> articles = NewsCubit.get(context).categories[categoryIndex];

    return ConditionalBuilder(
      condition: articles.isNotEmpty,
      builder: (context) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return NewsWidget(
              article: articles[index],
            );
          },
          separatorBuilder: (context, index) {
            return Container(
              color: Colors.grey,
              height: 2.0,
            );
          },
          itemCount: articles.length,
        );
      },
      fallback: (BuildContext context) => fromSearchScreen
          ? Container()
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
