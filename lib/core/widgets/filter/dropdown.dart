
import 'package:flutter/material.dart';
import 'package:african_windows/core/constants/defaults.dart';
import 'package:african_windows/core/constants/gaps.dart';
import 'package:african_windows/core/models_views/model_dropdown_filter.dart';

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
