import 'package:flutter/material.dart';
import 'package:news_app/app/utils/values_managers/assets_manager.dart';

import '../enums.dart';

extension GetCategoryIconExtension on Categories {
  IconData getIcon() {
    switch (this) {
      case Categories.business:
        return IconsManager.business;
      case Categories.sport:
        return IconsManager.sports;
      case Categories.science:
        return IconsManager.science;
      case Categories.search:
        return IconsManager.searchIcon;
    }
  }
}
