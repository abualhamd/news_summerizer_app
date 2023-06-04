import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/config/routes_manager.dart';
import '../../../app/utils/values_managers/colors_manager.dart';
import '../../../app/utils/values_managers/constants.dart';
import '../../../data/models/article_model.dart';
import '../../components/article_image.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class NewsWidget extends StatelessWidget {
  final ArticleModelFromNewsData article;
  const NewsWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppState>(
      listener: (BuildContext context, AppState state) {},
      builder: (context, state) {
        final read = context.read<NewsCubit>();
        return SizedBox(
          height: 140.h,
          child: InkWell(
            onTap: () async {
              read.setArticleModel = article;
              await Navigator.pushNamed(
                context,
                Routes.articleRoute,
              );
              if (context.mounted) {
                BlocProvider.of<NewsCubit>(context, listen: false)
                    .screenChanged();
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10.0.h,
                  horizontal: Constants.horizontalPaddingValue),
              child: Row(
                children: [
                  SizedBox(
                    height: 130.h,
                    width: 160.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.r),
                      child: ArticleImage(imageUrl: article.imageUrl),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //? article title
                        Text(
                          article.title,
                          maxLines: Constants.maxLines,
                          softWrap: false,
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0.sp,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        //? publish date
                        Text(
                          article.publishedAt,
                          style: const TextStyle(color: ColorsManager.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
