import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/utils/constants.dart';
import '../../data/models/article_model.dart';
import '../article_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class NewsWidget extends StatelessWidget {
  final ArticleModelFromNewsData article;
  const NewsWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppState>(
      listener: (BuildContext context, AppState state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleScreen(
                  article: article,
                ),
              ),
            );
            BlocProvider.of<NewsCubit>(context, listen: false).screenChanged();
          },
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
                  child: Visibility(
                    visible: article.imageUrl.isNotEmpty,
                    replacement:
                        Image.asset('assets/news-default-image@2x_0.png'),
                    child: Image.network(
                      article.imageUrl,
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset('assets/news-default-image@2x_0.png'),
                      // fit: BoxFit.cover,
                    ),
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
      },
    );
  }
}
