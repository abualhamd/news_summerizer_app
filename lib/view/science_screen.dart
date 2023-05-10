import 'package:flutter/material.dart';
import 'package:news_app/view/components/news_category_widget.dart';
import 'package:news_app/app/utils/constants.dart';

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewsCategoryComponent(categoryIndex: Screens.science.index);
  }
}