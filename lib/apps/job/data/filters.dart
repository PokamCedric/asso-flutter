
import 'package:african_windows/models_views/model_dropdown_filter.dart';

List<DropdownFilterModel> getDropdownFilterModels()
  =>  [
    DropdownFilterModel(
      'Field',
      'field',
      [
      'All Fields',
      'Food security, agriculture',
      'Peace-building and crisis prevention',
      'Infrastructure, ICT'
    ]),
    DropdownFilterModel(
      'Type of function',
      'type',
      [
      'All types of function',
      'Integrated Expert'
    ]),
    DropdownFilterModel(
      'Country',
      'country',
      [
      'All countries',
      'Kenya',
      'Sri Lanka',
      'Benin',
      'Madagascar'
    ]),
  ];

