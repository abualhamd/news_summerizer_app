import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app/utils/values_managers/assets_manager.dart';
import 'package:news_app/view/cubit/states.dart';
import 'package:news_app/view/cubit/cubit.dart';
import 'package:news_app/app/utils/values_managers/constants.dart';
import 'package:news_app/app/config/decorations_and_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/utils/shared/set_statusbar_color.dart';
import '../../app/utils/values_managers/colors_manager.dart';
import '../../app/utils/enums.dart';
import '../home/components/news_category_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  static final TextEditingController _searchController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final read = BlocProvider.of<NewsCubit>(context, listen: false);

    return BlocConsumer<NewsCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPaddingValue,
                      vertical: 10.h),
                  child: TextField(
                    // focusNode: FocusNode(),
                    decoration: kInputDecoration.copyWith(
                        suffixIcon: GestureDetector(
                      child: const Icon(
                        IconsManager.cancelIcon,
                        color: ColorsManager.grey,
                      ),
                      onTap: () {
                        _searchController.clear();
                        // TODO clear the list
                      },
                    )),
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (String query) {
                      read.getNewsOfSearch(query: query);
                    },
                  ),
                ),
                const Expanded(
                  child: NewsCategoryComponent(
                    category: Categories.search,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
