import 'package:flutter/material.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/shared/constants.dart';
import 'package:news_app/shared/decorations_and_themes.dart';
import '../shared/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: kHorizontalPaddingValue, vertical: 10),
                //solved the textfiled problem(the keyboard kept poping out) by putting the textController in the cubit
                //TODO work on the its decoration
                child: TextField(
                  // focusNode: FocusNode(),
                  decoration: kInputDecoration,
                  controller: NewsCubit.get(context).searchController,
                  keyboardType: TextInputType.text,
                  onChanged: (String query) {
                    NewsCubit.get(context).getNewsOfSearch(query: query);
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
