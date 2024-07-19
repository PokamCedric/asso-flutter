import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final double width;
  final BoxDecoration filterBoxDecoration;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.width,
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
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: filterBoxDecoration,
          child: DropdownButton<String>(
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            dropdownColor: Colors.white, // TODO
            items: items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                    value,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black), // Set text color
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
