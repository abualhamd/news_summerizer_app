import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/view/components/article_image.dart';
import 'package:news_app/view/cubit/cubit.dart';

import '../../../app/utils/values_managers/colors_manager.dart';

class MySliverAppbar extends StatelessWidget {
  const MySliverAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final article = context.watch<NewsCubit>().articleModel;
    return SliverToBoxAdapter(
      child: Visibility(
        visible: article!.imageUrl != null,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              height: 300.h,
              width: double.infinity,
              child: ShaderMask(
                blendMode: BlendMode.darken, //dstOver,//overlay,//srcATop
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        // ColorsManager.white,
                        Colors.grey.shade200,
                        Colors.grey.shade300,
                        Colors.grey.shade400,
                        ColorsManager.greyShade500,
                        Colors.grey.shade600,
                        Colors.grey.shade700,
                        Colors.grey.shade800,
                        Colors.grey.shade900,
                        ColorsManager.black,
                      ],
                      stops: const [
                        0.1,
                        0.45,
                        0.55,
                        0.65,
                        0.75,
                        0.85,
                        0.9,
                        0.95,
                        0.98,
                      ]).createShader(bounds);
                },
                child: ArticleImage(imageUrl: article.imageUrl),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 20.h),
              child: Text(
                article.title,
                style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
