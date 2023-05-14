import 'package:flutter/material.dart';
import 'package:news_app/app/utils/assets_manager.dart';
import 'package:news_app/view/cubit/states.dart';
import 'package:news_app/view/cubit/cubit.dart';
import 'package:news_app/app/utils/constants.dart';
import 'package:news_app/app/utils/decorations_and_themes.dart';
import '../app/utils/colors_manager.dart';
import 'components/news_category_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final read = BlocProvider.of<NewsCubit>(context, listen: false);
    return BlocConsumer<NewsCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kHorizontalPaddingValue, vertical: 10),
                //solved the textfiled problem(the keyboard kept poping out) by putting the textController in the cubit
                //TODO work on the its decoration
                child: TextField(
                  // focusNode: FocusNode(),
                  decoration: kInputDecoration.copyWith(
                      suffixIcon: GestureDetector(
                    child: const Icon(
                      IconsManager.cancelIcon,
                      color: ColorsManager.grey,
                    ),
                    onTap: () {
                      read.searchController.clear();
                      // TODO clear the list
                    },
                  )),
                  controller: context.watch<NewsCubit>().searchController,
                  keyboardType: TextInputType.text,
                  onChanged: (String query) {
                    read.getNewsOfSearch(query: query);
                  },
                ),
              ),
              Expanded(
                child: NewsCategoryComponent(
                  categoryIndex: Screens.search.index,
                  fromSearchScreen: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
