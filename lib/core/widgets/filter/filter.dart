import 'package:flutter/material.dart';
import 'package:african_windows/core/widgets/filter/body.dart';
import 'package:african_windows/core/widgets/filter/header.dart';
import 'package:african_windows/core/widgets/filter/reset_button.dart';
import 'package:african_windows/core/widgets/filter/search.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/configs/theme/app_colors.dart';
import 'package:african_windows/core/models_views/model_dropdown_filter.dart';
import 'package:african_windows/core/pages/layouts/card_layout.dart';

class Filter extends StatelessWidget {
  final List<DropdownFilterModel> filters;
  final int filtersPerLine;
  final ValueChanged<Map<String, String>> onFilterChanged;
  final Map<String, String> selectedFilters;

  const Filter({
    super.key,
    required this.filters,
    required this.onFilterChanged,
    this.filtersPerLine = 1,
    this.selectedFilters = const {},
  });

  BoxDecoration filterBoxDecoration({Color color = AppColors.iconGrey}) => BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.zero,
      );

  @override
  Widget build(BuildContext context) {
    return CardLayout(
      paddingFactor: 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterHeader(),
          divider(Theme.of(context).primaryColor),
          gapH8,
          SearchField(
            selectedFilters: selectedFilters,
            onFilterChanged: onFilterChanged,
          ),
          gapH16,
          FilterBody(
            filters: filters,
            selectedFilters: selectedFilters,
            onFilterChanged: onFilterChanged,
            filtersPerLine: filtersPerLine,
          ),
          gapH8,
          ResetButton(
            onReset: () {
              final resetFilters = <String, String>{};
              for (var filter in filters) {
                if (filter.items.isNotEmpty) {
                  resetFilters[filter.propertyName] = filter.items.first;
                }
              }
              onFilterChanged(resetFilters);
            },
          ),
          gapH8,
        ],
      ),
    );
  }

  Row divider(Color color) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(
            color: color,
            height: 10,
          ),
        ),
      ],
    );
  }
}
