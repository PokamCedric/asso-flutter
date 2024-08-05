import 'dart:async';
import 'package:flutter/material.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/configs/theme/app_colors.dart';
import 'package:african_windows/core/models_views/model_dropdown_filter.dart';
import 'package:african_windows/core/pages/layouts/card_layout.dart';
import 'package:african_windows/core/constants/defaults.dart';

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

class FilterHeader extends StatelessWidget {
  const FilterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'SEARCH AGAIN',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}

// ignore: must_be_immutable
class SearchField extends StatelessWidget {
  final Map<String, String> selectedFilters;
  final ValueChanged<Map<String, String>> onFilterChanged;
  Timer? _debounce;

  SearchField({
    super.key,
    required this.selectedFilters,
    required this.onFilterChanged,
  });

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      selectedFilters['query'] = value;
      onFilterChanged(Map.from(selectedFilters));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onChanged: _onSearchChanged,
            decoration: InputDecoration(
              hintText: "Search...",
              filled: true,
              fillColor: Theme.of(context).scaffoldBackgroundColor,
              border: AppDefaults.outlineInputBorder,
              focusedBorder: AppDefaults.focusedOutlineInputBorder,
            ),
          ),
        ),
      ],
    );
  }
}

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

class FilterDropdown extends StatelessWidget {
  final DropdownFilterModel filter;
  final String selectedValue;
  final ValueChanged<String?> onChanged;

  const FilterDropdown({
    super.key,
    required this.filter,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(filter.propertyName),
          gapH8,
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: AppDefaults.decoration,
            child: DropdownButton<String>(
              value: selectedValue,
              isExpanded: true,
              underline: const SizedBox(),
              dropdownColor: Theme.of(context).cardColor,
              items: filter.items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
          gapH16,
        ],
      ),
    );
  }
}

class ResetButton extends StatelessWidget {
  final VoidCallback onReset;

  const ResetButton({super.key, required this.onReset});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onReset,
        child: const Text('Reset'),
      ),
    );
  }
}
