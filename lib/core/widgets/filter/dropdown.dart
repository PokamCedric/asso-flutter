import 'package:flutter/material.dart';
import 'package:african_windows/core/widgets/layout_input_feld.dart';
import 'package:african_windows/core/models_views/model_dropdown_filter.dart';

class FilterDropdown extends StatelessWidget {
  final DropdownFilterModel filter;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const FilterDropdown({
    super.key,
    required this.filter,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure the selectedValue is in the list of items
    String validSelectedValue = selectedValue ?? filter.items.first;
    if (!filter.items.contains(validSelectedValue)) {
      validSelectedValue = filter.items.first;
    }

    return InputFieldLayout(
      label: filter.label,
      child: DropdownButton<String>(
        value: validSelectedValue,
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
    );
  }
}
