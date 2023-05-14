import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/app/utils/app_strings.dart';
import 'package:news_app/app/utils/assets_manager.dart';
import 'package:news_app/app/utils/colors_manager.dart';
import 'package:news_app/view/cubit/states.dart';
import '../app/utils/toast.dart';
import '../data/models/article_model.dart';
import 'cubit/cubit.dart';

class ArticleScreen extends StatelessWidget {
  final ArticleModelFromNewsData article;
  const ArticleScreen({super.key, required this.article});

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
      final controller = ScrollController();

      return SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Scaffold(
              floatingActionButton: AbsorbPointer(
                absorbing: watch.summerization != null,
                child: FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<NewsCubit>(context)
                        .summerizeContet(content: article.content);
                  },
                  child: const Icon(IconsManager.summerizeIcon),
                ),
              ),
              body: SingleChildScrollView(
                controller: controller,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 5, right: 10, left: 10),
                      child: Text(
                        article.title,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Container(
                        height: 1,
                        decoration: const BoxDecoration(color: ColorsManager.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5, bottom: 80, left: 10, right: 10),
                      child: Text(
                        watch.summerization ?? article.content,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: state is SummerizationLoadingState,
              child: const CircularProgressIndicator(),
            )
          ],
        ),
      );
    });
  }
}
