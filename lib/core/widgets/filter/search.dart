
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:african_windows/core/constants/defaults.dart';

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
