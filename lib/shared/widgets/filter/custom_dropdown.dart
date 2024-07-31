import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final BoxDecoration filterBoxDecoration;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.filterBoxDecoration,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 6.0),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: filterBoxDecoration,
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            dropdownColor: Theme.of(context).cardColor,
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyLarge!,
                  ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }
}
