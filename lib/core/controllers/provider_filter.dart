import 'package:african_windows/core/models_views/model_dropdown_filter.dart';
import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  final Map<String, String> _selectedFilters = {};

  Map<String, String> get selectedFilters => _selectedFilters;

  void updateFilters(Map<String, String> newFilters) {
    _selectedFilters.clear();
    _selectedFilters.addAll(newFilters);
    notifyListeners();
  }

  void initializeFilters(List<DropdownFilterModel> filters) {
    for (var filter in filters) {
      if (filter.items.isNotEmpty) {
        filter.items.insert(0, 'Select');
        _selectedFilters[filter.propertyName] = filter.items.first;
      }
    }
    notifyListeners();
  }
}
