import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/view/cubit/cubit.dart';

import '../../data/models/article_model.dart';
import 'news_widget.dart';

class NewsCategoryComponent extends StatelessWidget {
  final int categoryIndex;
  final bool fromSearchScreen;

  const NewsCategoryComponent(
      {super.key, required this.categoryIndex, this.fromSearchScreen = false});

  @override
  Widget build(BuildContext context) {
    List<dynamic> articles = NewsCubit.get(context).categories[categoryIndex];

    return ConditionalBuilder(
      condition: articles.isNotEmpty,
      builder: (context) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final article = articles[index];
            if (article['content'] != null) {
              return NewsWidget(
                article: ArticleModelFromNewsData.fromJson(article: article),
                // ArticleModel.fromJson(json: article),
              );
            }
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
