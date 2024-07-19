// filter_widget.dart
import 'package:core_dashboard/models/model_dropdown_filter.dart';
import 'package:flutter/material.dart';
import 'filter.dart';

class FilterWidget extends StatelessWidget {
  final int totalItems;
  final int filtersPerLine;
  final List<DropdownFilterModel> filters;
  final Function(Map<String, dynamic>) onFilterChanged;

  const FilterWidget({
    super.key,
    required this.totalItems,
    required this.filters,
    required this.onFilterChanged,
    this.filtersPerLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Filter(
        totalItems: totalItems,
        filtersPerLine: filtersPerLine,
        filters: filters,
        onFilterChanged: onFilterChanged,
    );
  }
}
