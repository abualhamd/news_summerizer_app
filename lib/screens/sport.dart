import 'package:flutter/material.dart';
import 'package:news_app/components.dart';

import '../constants.dart';

class Sport extends StatelessWidget {
  const Sport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewsCategoryComponent(categoryIndex: Screens.sport.index);

  }
}