import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/utils/values_managers/app_strings.dart';
import 'package:news_app/app/utils/values_managers/assets_manager.dart';
import 'package:news_app/app/utils/values_managers/colors_manager.dart';
import 'package:news_app/view/cubit/states.dart';

import '../../app/utils/shared/toast.dart';
import '../../app/utils/values_managers/constants.dart';
import '../cubit/cubit.dart';
import 'components/my_sliver_appbar.dart';
import 'components/my_sliver_article_body.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});
  static final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppState>(
        listener: (BuildContext context, state) {
      if (state is SummerizationSuccessState) {
        BlocProvider.of<NewsCubit>(context, listen: false).summerization =
            state.summerization;
      }
      if (state is SummerizationErrorState) {
        showToast(message: AppStrings.summerizationErrorMessage);
      }
    }, builder: (BuildContext context, state) {
      final watch = context.watch<NewsCubit>();

      return Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onDoubleTap: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: Constants.milliSecondsScrollToTop),
                curve: Curves.easeInOut,
              );
            },
            child: SafeArea(
              child: Scaffold(
                extendBodyBehindAppBar: true,
                backgroundColor: ColorsManager.white,
                floatingActionButton: AbsorbPointer(
                  absorbing: watch.summerization != null,
                  child: FloatingActionButton(
                    onPressed: () {
                      BlocProvider.of<NewsCubit>(context).summerizeContet(
                          content: watch.articleModel!.content);
                    },
                    child: const Icon(IconsManager.summerizeIcon),
                  ),
                ),
                body: CustomScrollView(
                  controller: _scrollController,
                  slivers: const [
                    //? appbar
                    MySliverAppbar(),
                    //? body
                    MySliverArticleBody(),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: state is SummerizationLoadingState,
            child: const CircularProgressIndicator(),
          )
        ],
      );
    });
  }
}
