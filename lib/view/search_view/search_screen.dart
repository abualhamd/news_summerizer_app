import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/app/utils/values_managers/app_strings.dart';
import 'package:news_app/app/utils/values_managers/assets_manager.dart';
import 'package:news_app/view/cubit/states.dart';
import 'package:news_app/view/cubit/cubit.dart';
import 'package:news_app/app/utils/values_managers/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../app/utils/values_managers/colors_manager.dart';
import '../../app/utils/enums.dart';
import '../home_view/components/news_category_widget.dart';

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
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(IconsManager.arrowBack)),
            ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPaddingValue,
                      vertical: 10.h),
                  child: TextField(
                    decoration: InputDecoration(
                      label: const Text(AppStrings.search),
                      prefixIcon: const Icon(IconsManager.searchIcon),
                      suffixIcon: GestureDetector(
                        // TODO clear the list
                        onTap: () => _searchController.clear(),
                        child: const Icon(
                          IconsManager.cancelIcon,
                          color: ColorsManager.grey,
                        ),
                      ),
                    ),
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
