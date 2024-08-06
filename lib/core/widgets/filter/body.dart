
import 'package:flutter/material.dart';
import 'package:african_windows/core/models_views/model_dropdown_filter.dart';
import 'package:african_windows/core/widgets/filter/dropdown.dart';

class FilterBody extends StatelessWidget {
  final List<DropdownFilterModel> filters;
  final int filtersPerLine;
  final Map<String, String> selectedFilters;
  final ValueChanged<Map<String, String>> onFilterChanged;

  const FilterBody({
    super.key,
    required this.filters,
    required this.selectedFilters,
    required this.onFilterChanged,
    required this.filtersPerLine,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < filters.length; i += filtersPerLine)
          Row(
            children: [
              for (int j = i; j < i + filtersPerLine && j < filters.length; j++)
                Expanded(
                  child: FilterDropdown(
                    filter: filters[j],
                    selectedValue: selectedFilters[filters[j].propertyName] ?? filters[j].items.first,
                    onChanged: (value) {
                      selectedFilters[filters[j].propertyName] = value!;
                      onFilterChanged(Map.from(selectedFilters));
                    },
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
