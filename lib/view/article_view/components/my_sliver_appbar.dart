import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app/utils/values_managers/assets_manager.dart';
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
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            height: 300.h,
            width: double.infinity,
            child: ShaderMask(
              blendMode: BlendMode
                  .multiply, //BlendMode.multiply,//BlendMode.hardLight,
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.grey.shade100,
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
                      // 0.0,
                      0.3,
                      0.35,
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
              child: ArticleImage(imageUrl: article?.imageUrl),
            ),
          ),
          Positioned.directional(
            textDirection: TextDirection.ltr,
            start: 10.w,
            top: 15.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade600.withOpacity(0.2),
                    shape: BoxShape.circle,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.white.withOpacity(0.2),
                    //     blurRadius: 10,
                    //     spreadRadius: -8,
                    //   ),
                    // ],
                  ),
                  child: IconButton(
                    icon: const Icon(
                      IconsManager.arrowBack,
                      color: ColorsManager.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 20.h),
            child: Text(
              article!.title,
              style: TextStyle(
                  height: 1.2,
                  color: ColorsManager.white,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
