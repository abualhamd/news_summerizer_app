import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/view/cubit/states.dart';
import 'cubit/cubit.dart';

class ArticleScreen extends StatelessWidget {
  final ArticleModelFromNewsData article;
  const ArticleScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    // bool sum_loaded = false;
    // String summerization = "";
    return BlocConsumer<NewsCubit, AppState>(
        listener: (BuildContext context, state) {
      if (state is SummerizationSuccessState) {
        BlocProvider.of<NewsCubit>(context, listen: false).summerization =
            state.summerization;
      }
      if (state is! SummerizationSuccessState) {
        BlocProvider.of<NewsCubit>(context, listen: false).summerization = '';
      }
    }, builder: (BuildContext context, state) {
      final cubit = NewsCubit.get(context);
      return SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   flexibleSpace: Visibility(
          //     child: Builder(builder: (context) {
          //       final bool imageExists = article.imageUrl.isNotEmpty;
          //       // return Stack(
          //       // alignment: Alignment.bottomLeft,
          //       return Visibility(
          //         visible: imageExists,
          //         child: Image.network(
          //           article.imageUrl,
          //           width: double.infinity,
          //           errorBuilder: null,
          //         ),
          //       );

          //       // );
          //     }),
          //   ),
          // ),
          body: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 5, right: 10, left: 10),
                  child: Text(
                    article.title,
                    style: TextStyle(
                        color: Colors.black, //imageExists ? Colors.white :
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Visibility(
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<NewsCubit>(context)
                            .summerizeContet(content: article.content);
                      },
                      child: Text('Summerize')),
                  visible: state is! SummerizationLoadingState,
                  replacement: CircularProgressIndicator(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 5, bottom: 10, left: 10, right: 10),
                  child: Text(
                    cubit.summerization.isEmpty
                        ? article.content
                        : cubit.summerization,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
