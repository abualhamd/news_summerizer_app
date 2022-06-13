import 'package:flutter/material.dart';
import 'package:news_app/shared/components.dart';
import 'package:news_app/shared/constants.dart';

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewsCategoryComponent(categoryIndex: Screens.science.index);
  }
}