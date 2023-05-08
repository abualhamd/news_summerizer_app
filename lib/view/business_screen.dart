import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/view/components/news_category_widget.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

import '../shared/constants.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, AppState>(
      listener: (context, state){},
      builder: (context, state) => NewsCategoryComponent(
          categoryIndex: Screens.business.index),
    );
    //   child: ,
    // ); //  articles.length
  }
}
