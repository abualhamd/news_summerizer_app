import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/cubit/cubit.dart';

import '../../../app/utils/enums.dart';
import '../../../data/models/article_model.dart';
import 'news_widget.dart';

class NewsCategoryComponent extends StatelessWidget {
  // final int categoryIndex;
  // final bool fromSearchScreen;
  final Categories _category;

  const NewsCategoryComponent({super.key, required Categories category})
      : _category = category;

  @override
  Widget build(BuildContext context) {
    List<dynamic> articles =
        context.watch<NewsCubit>().categories[_category.index];

    return ConditionalBuilder(
      condition: articles.isNotEmpty,
      builder: (context) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final article = articles[index];
            return (article['content'] != null)
                ? NewsWidget(
                    article:
                        ArticleModelFromNewsData.fromJson(article: article),
                  )
                : null;
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
      fallback: (BuildContext context) => (_category == Categories.search)
          ? Container()
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
