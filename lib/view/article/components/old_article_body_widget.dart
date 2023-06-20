
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/values_managers/colors_manager.dart';
import '../../../data/models/article_model.dart';
import '../../cubit/cubit.dart';

class OldArticlebodyWidget extends StatelessWidget {
  const OldArticlebodyWidget({
    super.key,
    required this.controller,
    required this.article,
    required this.watch,
  });

  final ScrollController controller;
  final ArticleModelFromNewsData article;
  final NewsCubit watch;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 5, right: 10, left: 10),
            child: Text(
              article.title,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Container(
              height: 1,
              decoration: const BoxDecoration(color: ColorsManager.grey),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 80, left: 10, right: 10),
            child: Text(
              watch.articleModel?.summerization ?? article.content,
              style: TextStyle(fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
