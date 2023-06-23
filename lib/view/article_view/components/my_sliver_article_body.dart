import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app/utils/values_managers/colors_manager.dart';
import '../../cubit/cubit.dart';

class MySliverArticleBody extends StatelessWidget {
  const MySliverArticleBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final watch = context.watch<NewsCubit>();

    return SliverToBoxAdapter(
      child: Container(
        color: ColorsManager.black,
        child: Container(
          constraints: BoxConstraints(minHeight: 353.h),
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r)),
          ),
          padding: EdgeInsets.only(
              top: 20.0.h, bottom: 80.h, right: 15.w, left: 15.w),
          child: Text(
            watch.articleDisplayText,
            style: TextStyle(
              height: 1.5,
                fontSize: 20.sp,
                backgroundColor: ColorsManager.white,
                color: ColorsManager.black),
          ),
        ),
      ),
    );
  }
}
