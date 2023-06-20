import '../values_managers/app_strings.dart';
import '../enums.dart';

extension GetLabelExtension on Categories {
  String getLabel() {
    switch (this) {
      case Categories.business:
        return AppStrings.business;
      case Categories.sport:
        return AppStrings.sport;
      case Categories.science:
        return AppStrings.science;
      case Categories.search:
        return AppStrings.search;
    }
  }
}
